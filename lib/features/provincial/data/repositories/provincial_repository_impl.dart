import 'package:control_electoral/features/provincial/domain/entities/recinto_entity.dart';
import 'package:control_electoral/features/provincial/domain/repositories/provincial_repository.dart';
import 'package:control_electoral/features/recinto/domain/entities/mesa_entity.dart';
import 'package:control_electoral/features/veedor/domain/entities/acta_entity.dart';
import '../datasources/provincial_remote_datasource.dart';

class ProvincialRepositoryImpl implements ProvincialRepository {
  final ProvincialRemoteDatasource _datasource;

  ProvincialRepositoryImpl(this._datasource);

  @override
  Future<List<RecintoEntity>> getRecintos() => _datasource.getRecintos();

  @override
  Future<List<ActaEntity>> getAllActas() => _datasource.getAllActas();

  @override
  Future<List<MesaEntity>> getAllMesas() => _datasource.getAllMesas();

  @override
  Future<void> createRecinto(RecintoEntity recinto) async {
    await _datasource.createRecinto(recinto);
  }

  @override
  Future<void> assignCoordinador(String recintoId, String coordinadorUserId) =>
      _datasource.assignCoordinador(recintoId, coordinadorUserId);

  @override
  Future<String> createCoordinador({
    required String cedula,
    required String nombres,
    required String apellidos,
    required String telefono,
    required String recintoId,
    required String createdBy,
  }) => _datasource.createCoordinador(
    cedula: cedula,
    nombres: nombres,
    apellidos: apellidos,
    telefono: telefono,
    recintoId: recintoId,
    createdBy: createdBy,
  );
}
