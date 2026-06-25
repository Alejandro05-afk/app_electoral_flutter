import '../entities/mesa_entity.dart';
import '../repositories/recinto_repository.dart';

class GetMesasUseCase {
  final RecintoRepository _repository;
  GetMesasUseCase(this._repository);
  Future<List<MesaEntity>> call(String recintoId) => _repository.getMesas(recintoId);
}
