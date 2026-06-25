import 'package:drift/drift.dart';
import 'package:control_electoral/features/veedor/local/database.dart';
import 'package:control_electoral/features/veedor/domain/entities/acta_entity.dart';

class ActaLocalDatasource {
  final AppDatabase _db;

  ActaLocalDatasource(this._db);

  Future<void> saveActa(ActaEntity acta) async {
    await _db.into(_db.localActas).insertOnConflictUpdate(
      LocalActasCompanion.insert(
        id: acta.id,
        mesaId: acta.mesaId,
        recintoId: acta.recintoId,
        dignidad: acta.dignidad,
        totalSufragantes: acta.totalSufragantes,
        votosNulos: acta.votosNulos,
        votosBlancos: acta.votosBlancos,
        fotoLocalPath: Value(acta.fotoLocalPath),
        fotoFileId: Value(acta.fotoFileId),
        gpsLat: Value(acta.gpsLat),
        gpsLng: Value(acta.gpsLng),
        gpsAccuracy: Value(acta.gpsAccuracy),
        registradoPor: acta.registradoPor,
        sincronizado: Value(acta.sincronizado),
        updatedAt: acta.updatedAt,
      ),
    );

    for (final voto in acta.votos) {
      await _db.into(_db.localActaVotos).insertOnConflictUpdate(
        LocalActaVotosCompanion.insert(
          id: voto.id,
          actaId: voto.actaId,
          organizacionId: voto.organizacionId,
          votos: voto.votos,
        ),
      );
    }
  }

  Future<List<ActaEntity>> getUnsyncedActas() async {
    final rows = await (_db.select(_db.localActas)
        ..where((t) => t.sincronizado.equals(false)))
        .get();
    final result = <ActaEntity>[];
    for (final row in rows) {
      final votos = await (_db.select(_db.localActaVotos)
          ..where((t) => t.actaId.equals(row.id)))
          .get();
      result.add(ActaEntity(
        id: row.id,
        mesaId: row.mesaId,
        recintoId: row.recintoId,
        dignidad: row.dignidad,
        totalSufragantes: row.totalSufragantes,
        votosNulos: row.votosNulos,
        votosBlancos: row.votosBlancos,
        fotoLocalPath: row.fotoLocalPath,
        fotoFileId: row.fotoFileId,
        gpsLat: row.gpsLat,
        gpsLng: row.gpsLng,
        gpsAccuracy: row.gpsAccuracy,
        registradoPor: row.registradoPor,
        sincronizado: row.sincronizado,
        updatedAt: row.updatedAt,
        votos: votos.map((v) => VotoEntity(
          id: v.id,
          actaId: v.actaId,
          organizacionId: v.organizacionId,
          votos: v.votos,
        )).toList(),
      ));
    }
    return result;
  }

  Future<void> markAsSynced(String actaId) async {
    await (_db.update(_db.localActas)..where((t) => t.id.equals(actaId)))
        .write(const LocalActasCompanion(sincronizado: Value(true)));
  }

  Future<List<ActaEntity>> getActasByMesa(String mesaId) async {
    final rows = await (_db.select(_db.localActas)
        ..where((t) => t.mesaId.equals(mesaId)))
        .get();
    final result = <ActaEntity>[];
    for (final row in rows) {
      final votos = await (_db.select(_db.localActaVotos)
          ..where((t) => t.actaId.equals(row.id)))
          .get();
      result.add(ActaEntity(
        id: row.id,
        mesaId: row.mesaId,
        recintoId: row.recintoId,
        dignidad: row.dignidad,
        totalSufragantes: row.totalSufragantes,
        votosNulos: row.votosNulos,
        votosBlancos: row.votosBlancos,
        fotoLocalPath: row.fotoLocalPath,
        fotoFileId: row.fotoFileId,
        gpsLat: row.gpsLat,
        gpsLng: row.gpsLng,
        gpsAccuracy: row.gpsAccuracy,
        registradoPor: row.registradoPor,
        sincronizado: row.sincronizado,
        updatedAt: row.updatedAt,
        votos: votos.map((v) => VotoEntity(
          id: v.id,
          actaId: v.actaId,
          organizacionId: v.organizacionId,
          votos: v.votos,
        )).toList(),
      ));
    }
    return result;
  }
}
