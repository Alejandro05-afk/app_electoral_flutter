import '../entities/mesa_entity.dart';

abstract class RecintoRepository {
  Future<List<MesaEntity>> getMesas(String recintoId);
  Future<void> assignVeedor(String mesaId, String veedorUserId);
  Future<String> createVeedor({
    required String cedula,
    required String nombres,
    required String apellidos,
    required String telefono,
    required String recintoId,
    required String createdBy,
  });
  Future<List<Map<String, dynamic>>> getVeedores(String recintoId);
}
