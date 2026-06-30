import 'package:drift/drift.dart';
import 'package:control_electoral/features/veedor/local/database.dart';
import 'package:control_electoral/features/veedor/domain/entities/acta_entity.dart';
import 'package:control_electoral/features/veedor/domain/entities/mesa_entity.dart';
import 'package:control_electoral/features/veedor/domain/entities/organizacion_entity.dart';

class ActaLocalDatasource {
  final AppDatabase _db;

  ActaLocalDatasource(this._db);

  ActaEntity _rowToActa(LocalActa row, List<VotoEntity> votos) {
    return ActaEntity(
      id: row.id,
      mesaId: row.mesaId,
      recintoId: row.recintoId,
      dignidad: row.dignidad,
      totalSufragantesLetras: row.totalSufragantesLetras,
      totalSufragantesCentena: row.totalSufragantesCentena,
      totalSufragantesDecena: row.totalSufragantesDecena,
      totalSufragantesUnidad: row.totalSufragantesUnidad,
      votosBlancosLetras: row.votosBlancosLetras,
      votosBlancosCentena: row.votosBlancosCentena,
      votosBlancosDecena: row.votosBlancosDecena,
      votosBlancosUnidad: row.votosBlancosUnidad,
      votosNulosLetras: row.votosNulosLetras,
      votosNulosCentena: row.votosNulosCentena,
      votosNulosDecena: row.votosNulosDecena,
      votosNulosUnidad: row.votosNulosUnidad,
      fotoLocalPath: row.fotoLocalPath,
      fotoFileId: row.fotoFileId,
      gpsLat: row.gpsLat,
      gpsLng: row.gpsLng,
      gpsAccuracy: row.gpsAccuracy,
      registradoPor: row.registradoPor,
      sincronizado: row.sincronizado,
      updatedAt: row.updatedAt,
      votos: votos,
    );
  }

  VotoEntity _rowToVoto(LocalActaVoto row) {
    return VotoEntity(
      id: row.id,
      actaId: row.actaId,
      organizacionId: row.organizacionId,
      votos: row.votos,
      votosLetras: row.votosLetras,
      votosCentena: row.votosCentena,
      votosDecena: row.votosDecena,
      votosUnidad: row.votosUnidad,
    );
  }

  Future<void> saveActa(ActaEntity acta) async {
    await _db.into(_db.localActas).insertOnConflictUpdate(
      LocalActasCompanion.insert(
        id: acta.id,
        mesaId: acta.mesaId,
        recintoId: acta.recintoId,
        dignidad: acta.dignidad,
        totalSufragantesLetras: Value(acta.totalSufragantesLetras),
        totalSufragantesCentena: Value(acta.totalSufragantesCentena),
        totalSufragantesDecena: Value(acta.totalSufragantesDecena),
        totalSufragantesUnidad: Value(acta.totalSufragantesUnidad),
        votosBlancosLetras: Value(acta.votosBlancosLetras),
        votosBlancosCentena: Value(acta.votosBlancosCentena),
        votosBlancosDecena: Value(acta.votosBlancosDecena),
        votosBlancosUnidad: Value(acta.votosBlancosUnidad),
        votosNulosLetras: Value(acta.votosNulosLetras),
        votosNulosCentena: Value(acta.votosNulosCentena),
        votosNulosDecena: Value(acta.votosNulosDecena),
        votosNulosUnidad: Value(acta.votosNulosUnidad),
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
          votos: Value(voto.votos),
          votosLetras: Value(voto.votosLetras),
          votosCentena: Value(voto.votosCentena),
          votosDecena: Value(voto.votosDecena),
          votosUnidad: Value(voto.votosUnidad),
        ),
      );
    }
  }

  Future<List<ActaEntity>> _loadActasWithCondition(Function(dynamic) queryFn) async {
    final query = _db.select(_db.localActas);
    queryFn(query);
    final rows = await query.get();
    final result = <ActaEntity>[];
    for (final row in rows) {
      final votos = await (_db.select(_db.localActaVotos)
          ..where((t) => t.actaId.equals(row.id)))
          .get();
      result.add(_rowToActa(row, votos.map(_rowToVoto).toList()));
    }
    return result;
  }

  Future<List<ActaEntity>> getActasByUser(String userId) async {
    return _loadActasWithCondition(
        (query) => query.where((t) => t.registradoPor.equals(userId)));
  }

  Future<List<ActaEntity>> getUnsyncedActas() async {
    return _loadActasWithCondition(
        (query) => query.where((t) => t.sincronizado.equals(false)));
  }

  Future<void> markAsSynced(String actaId) async {
    await (_db.update(_db.localActas)..where((t) => t.id.equals(actaId)))
        .write(const LocalActasCompanion(sincronizado: Value(true)));
  }

  Future<List<ActaEntity>> getActasByMesa(String mesaId) async {
    return _loadActasWithCondition(
        (query) => query.where((t) => t.mesaId.equals(mesaId)));
  }

  Future<void> saveMesasForVeedor(List<MesaEntity> mesas, String veedorId) async {
    await (_db.delete(_db.localMesas)..where((t) => t.veedorUserId.equals(veedorId))).go();
    for (final mesa in mesas) {
      await _db.into(_db.localMesas).insert(
        LocalMesasCompanion.insert(
          id: mesa.id,
          recintoId: mesa.recintoId,
          numeroMesa: mesa.numeroMesa,
          veedorId: Value(mesa.veedorId),
          estado: mesa.estado,
          veedorUserId: veedorId,
        ),
      );
    }
  }

  Future<List<MesaEntity>> getCachedMesasByVeedor(String veedorId) async {
    final rows = await (_db.select(_db.localMesas)
        ..where((t) => t.veedorUserId.equals(veedorId)))
        .get();
    return rows.map((row) => MesaEntity(
      id: row.id,
      recintoId: row.recintoId,
      numeroMesa: row.numeroMesa,
      veedorId: row.veedorId,
      estado: row.estado,
    )).toList();
  }

  Future<void> saveOrganizaciones(List<OrganizacionEntity> orgs) async {
    await _db.delete(_db.localOrganizaciones).go();
    for (final org in orgs) {
      await _db.into(_db.localOrganizaciones).insert(
        LocalOrganizacionesCompanion.insert(
          id: org.id,
          nombre: org.nombre,
          dignidad: org.dignidad,
          numeroLista: org.numeroLista,
          candidatoNombre: org.candidatoNombre,
        ),
      );
    }
  }

  Future<List<OrganizacionEntity>> getCachedOrganizaciones() async {
    final rows = await _db.select(_db.localOrganizaciones).get();
    return rows.map((row) => OrganizacionEntity(
      id: row.id,
      nombre: row.nombre,
      dignidad: row.dignidad,
      numeroLista: row.numeroLista,
      candidatoNombre: row.candidatoNombre,
    )).toList();
  }
}
