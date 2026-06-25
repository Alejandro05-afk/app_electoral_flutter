import 'dart:async';
import 'package:control_electoral/features/veedor/domain/repositories/acta_repository.dart';
import 'connectivity_service.dart';

class SyncService {
  final ActaRepository _actaRepo;
  final ConnectivityService _connectivity;
  StreamSubscription? _sub;

  SyncService(this._actaRepo, this._connectivity);

  void startListening() {
    _sub = _connectivity.onStatusChange.listen((connected) async {
      if (connected) await _syncPending();
    });
  }

  Future<void> _syncPending() async {
    final pending = await _actaRepo.getUnsyncedActas();
    for (final acta in pending) {
      await _actaRepo.syncActa(acta);
    }
  }

  void dispose() => _sub?.cancel();
}
