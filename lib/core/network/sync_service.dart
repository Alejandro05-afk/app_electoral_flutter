import 'dart:async';
import 'package:control_electoral/features/veedor/domain/repositories/acta_repository.dart';
import 'connectivity_service.dart';

class SyncService {
  final ActaRepository _actaRepo;
  final ConnectivityService _connectivity;
  StreamSubscription? _sub;
  bool _started = false;

  SyncService(this._actaRepo, this._connectivity);

  void startListening() {
    if (_started) return;
    _started = true;

    _syncPending();

    _sub = _connectivity.onStatusChange.listen((connected) async {
      if (connected) await _syncPending();
    });
  }

  Future<void> _syncPending() async {
    try {
      final pending = await _actaRepo.getUnsyncedActas();
      for (final acta in pending) {
        await _actaRepo.syncActa(acta);
      }
    } catch (_) {}
  }

  void dispose() {
    _sub?.cancel();
    _sub = null;
    _started = false;
  }
}
