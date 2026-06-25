import '../entities/mesa_entity.dart';

abstract class RecintoRepository {
  Future<List<MesaEntity>> getMesas(String recintoId);
  Future<void> assignVeedor(String mesaId, String veedorUserId);
}
