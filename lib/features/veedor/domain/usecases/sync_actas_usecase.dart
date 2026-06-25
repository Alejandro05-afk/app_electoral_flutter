import '../repositories/acta_repository.dart';

class SyncActasUseCase {
  final ActaRepository _repository;
  SyncActasUseCase(this._repository);
  Future<void> call() {
    return _repository.getUnsyncedActas().then((actas) async {
      for (final acta in actas) {
        await _repository.syncActa(acta);
      }
    });
  }
}
