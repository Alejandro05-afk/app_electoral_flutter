import '../entities/acta_entity.dart';

abstract class ActaRepository {
  Future<List<ActaEntity>> getMisActas(String userId);
  Future<void> registerActa(ActaEntity acta);
  Future<void> updateActa(ActaEntity acta);
  Future<List<ActaEntity>> getUnsyncedActas();
  Future<void> syncActa(ActaEntity acta);
}
