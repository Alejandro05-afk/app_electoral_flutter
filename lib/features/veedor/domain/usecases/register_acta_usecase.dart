import '../entities/acta_entity.dart';
import '../repositories/acta_repository.dart';

class RegisterActaUseCase {
  final ActaRepository _repository;
  RegisterActaUseCase(this._repository);
  Future<void> call(ActaEntity acta) => _repository.registerActa(acta);
}
