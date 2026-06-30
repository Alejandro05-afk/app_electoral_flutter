import 'package:control_electoral/features/recinto/domain/entities/mesa_entity.dart';
import 'package:control_electoral/features/recinto/domain/repositories/recinto_repository.dart';
import '../datasources/recinto_remote_datasource.dart';

class RecintoRepositoryImpl implements RecintoRepository {
  final RecintoRemoteDatasource _datasource;

  RecintoRepositoryImpl(this._datasource);

  @override
  Future<List<MesaEntity>> getMesas(String recintoId) => _datasource.getMesas(recintoId);

  @override
  Future<void> assignVeedor(String mesaId, String veedorUserId) =>
      _datasource.assignVeedor(mesaId, veedorUserId);

  @override
  Future<String> createVeedor({
    required String cedula,
    required String nombres,
    required String apellidos,
    required String telefono,
    required String recintoId,
    required String createdBy,
  }) => _datasource.createVeedor(
    cedula: cedula,
    nombres: nombres,
    apellidos: apellidos,
    telefono: telefono,
    recintoId: recintoId,
    createdBy: createdBy,
  );

  @override
  Future<List<Map<String, dynamic>>> getVeedores(String recintoId) =>
      _datasource.getVeedores(recintoId);
}
