import '../entities/acta_entity.dart';
import '../repositories/acta_repository.dart';

class UpdateActaUseCase {
  final ActaRepository _repository;
  UpdateActaUseCase(this._repository);
  Future<void> call(ActaEntity acta) => _repository.updateActa(acta);
}
