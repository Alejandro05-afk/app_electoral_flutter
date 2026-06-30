import '../entities/acta_entity.dart';
import '../entities/mesa_entity.dart';
import '../entities/organizacion_entity.dart';

abstract class ActaRepository {
  Future<List<ActaEntity>> getMisActas(String userId);
  Future<void> registerActa(ActaEntity acta);
  Future<void> updateActa(ActaEntity acta);
  Future<List<ActaEntity>> getUnsyncedActas();
  Future<void> syncActa(ActaEntity acta);
  Future<List<OrganizacionEntity>> getOrganizaciones(String dignidad);
  Future<List<MesaEntity>> getMesasByVeedor(String veedorId);
  Future<List<ActaEntity>> getActasByMesa(String mesaId);
  Future<void> updateMesaEstado(String mesaId, String estado);
}
