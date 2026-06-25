import 'dart:io';
import 'package:control_electoral/core/network/connectivity_service.dart';
import 'package:control_electoral/features/veedor/domain/entities/acta_entity.dart';
import 'package:control_electoral/features/veedor/domain/repositories/acta_repository.dart';
import '../datasources/acta_remote_datasource.dart';
import '../datasources/acta_local_datasource.dart';

class ActaRepositoryImpl implements ActaRepository {
  final ActaRemoteDatasource _remote;
  final ActaLocalDatasource _local;
  final ConnectivityService _connectivity;

  ActaRepositoryImpl(this._remote, this._local, this._connectivity);

  @override
  Future<List<ActaEntity>> getMisActas(String userId) async {
    if (await _connectivity.isConnected) {
      return _remote.getActasByMesa(userId);
    }
    return _local.getActasByMesa(userId);
  }

  @override
  Future<void> registerActa(ActaEntity acta) async {
    await _local.saveActa(acta.copyWith(sincronizado: false));
    if (await _connectivity.isConnected) {
      await _syncSingleActa(acta);
    }
  }

  @override
  Future<void> updateActa(ActaEntity acta) async {
    await _local.saveActa(acta.copyWith(sincronizado: false));
    if (await _connectivity.isConnected) {
      await _syncSingleActa(acta);
    }
  }

  @override
  Future<List<ActaEntity>> getUnsyncedActas() async {
    return _local.getUnsyncedActas();
  }

  @override
  Future<void> syncActa(ActaEntity acta) async {
    final remote = await _remote.getActa(acta.id);
    if (remote == null) {
      await _syncSingleActa(acta);
    } else if (acta.updatedAt.isAfter(remote.updatedAt)) {
      await _syncSingleActa(acta);
    }
    await _local.markAsSynced(acta.id);
  }

  Future<void> _syncSingleActa(ActaEntity acta) async {
    try {
      var updatedActa = acta;
      if (acta.fotoLocalPath != null && acta.fotoFileId == null) {
        final fileId = await _remote.uploadActaPhoto(File(acta.fotoLocalPath!));
        updatedActa = acta.copyWith(fotoFileId: fileId);
      }
      await _remote.createActa(updatedActa);
      await _local.markAsSynced(acta.id);
    } catch (_) {}
  }
}
