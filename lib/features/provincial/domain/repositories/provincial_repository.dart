import '../entities/recinto_entity.dart';

abstract class ProvincialRepository {
  Future<List<RecintoEntity>> getRecintos();
  Future<void> createRecinto(RecintoEntity recinto);
  Future<void> assignCoordinador(String recintoId, String coordinadorUserId);
}
