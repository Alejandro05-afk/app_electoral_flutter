import '../entities/acta_entity.dart';
import '../repositories/acta_repository.dart';

class GetMisActasUseCase {
  final ActaRepository _repository;
  GetMisActasUseCase(this._repository);
  Future<List<ActaEntity>> call(String userId) => _repository.getMisActas(userId);
}
