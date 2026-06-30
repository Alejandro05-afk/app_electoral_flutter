import '../entities/acta_entity.dart';
import '../repositories/acta_repository.dart';

class GetActasByMesaUseCase {
  final ActaRepository _repository;
  GetActasByMesaUseCase(this._repository);
  Future<List<ActaEntity>> call(String mesaId) => _repository.getActasByMesa(mesaId);
}
