import '../entities/organizacion_entity.dart';
import '../repositories/acta_repository.dart';

class GetOrganizacionesUseCase {
  final ActaRepository _repository;
  GetOrganizacionesUseCase(this._repository);
  Future<List<OrganizacionEntity>> call(String dignidad) => _repository.getOrganizaciones(dignidad);
}
