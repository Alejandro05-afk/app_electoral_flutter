import '../entities/recinto_entity.dart';
import 'package:control_electoral/features/recinto/domain/entities/mesa_entity.dart';
import 'package:control_electoral/features/veedor/domain/entities/acta_entity.dart';

abstract class ProvincialRepository {
  Future<List<RecintoEntity>> getRecintos();

  Future<List<ActaEntity>> getAllActas();
  Future<List<MesaEntity>> getAllMesas();
  Future<void> createRecinto(RecintoEntity recinto);
  Future<void> assignCoordinador(String recintoId, String coordinadorUserId);
  Future<String> createCoordinador({
    required String cedula,
    required String nombres,
    required String apellidos,
    required String telefono,
    required String recintoId,
    required String createdBy,
  });
}
