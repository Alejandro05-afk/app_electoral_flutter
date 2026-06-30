import '../entities/mesa_entity.dart';
import '../repositories/acta_repository.dart';

class GetMisMesasUseCase {
  final ActaRepository _repository;
  GetMisMesasUseCase(this._repository);
  Future<List<MesaEntity>> call(String veedorId) => _repository.getMesasByVeedor(veedorId);
}
