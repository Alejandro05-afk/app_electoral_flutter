import 'dart:io';
import 'package:appwrite/appwrite.dart';
import 'package:control_electoral/core/appwrite/appwrite_client.dart';
import 'package:control_electoral/features/veedor/domain/entities/acta_entity.dart';

class ActaRemoteDatasource {
  final Databases _db;
  final Storage _storage;

  ActaRemoteDatasource(this._db, this._storage);

  Future<String> uploadActaPhoto(File photo) async {
    final inputFile = InputFile.fromPath(
      path: photo.path,
      filename: 'acta_${DateTime.now().millisecondsSinceEpoch}.jpg',
    );
    final result = await _storage.createFile(
      bucketId: AppwriteConfig.actasBucketId,
      fileId: ID.unique(),
      file: inputFile,
    );
    return result.$id;
  }

  Future<String> createActa(ActaEntity acta) async {
    final actaDocId = ID.unique();
    await _db.createDocument(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.actasCollection,
      documentId: actaDocId,
      data: {
        'mesa_id': acta.mesaId,
        'recinto_id': acta.recintoId,
        'dignidad': acta.dignidad,
        'total_sufragantes': acta.totalSufragantes,
        'votos_nulos': acta.votosNulos,
        'votos_blancos': acta.votosBlancos,
        'foto_file_id': acta.fotoFileId,
        'foto_bucket_id': AppwriteConfig.actasBucketId,
        'gps_lat': acta.gpsLat,
        'gps_lng': acta.gpsLng,
        'gps_accuracy': acta.gpsAccuracy,
        'registrado_por': acta.registradoPor,
        'sincronizado': true,
        'updated_at': DateTime.now().toIso8601String(),
      },
    );

    for (final voto in acta.votos) {
      await _db.createDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: AppwriteConfig.actaVotosCollection,
        documentId: ID.unique(),
        data: {
          'acta_id': actaDocId,
          'organizacion_id': voto.organizacionId,
          'votos': voto.votos,
        },
      );
    }

    return actaDocId;
  }

  Future<void> updateActa(ActaEntity acta) async {
    await _db.updateDocument(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.actasCollection,
      documentId: acta.id,
      data: {
        'total_sufragantes': acta.totalSufragantes,
        'votos_nulos': acta.votosNulos,
        'votos_blancos': acta.votosBlancos,
        'foto_file_id': acta.fotoFileId,
        'gps_lat': acta.gpsLat,
        'gps_lng': acta.gpsLng,
        'gps_accuracy': acta.gpsAccuracy,
        'updated_at': DateTime.now().toIso8601String(),
      },
    );
  }

  Future<ActaEntity?> getActa(String actaId) async {
    try {
      final doc = await _db.getDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: AppwriteConfig.actasCollection,
        documentId: actaId,
      );
      return ActaEntity(
        id: doc.$id,
        mesaId: doc.data['mesa_id'],
        recintoId: doc.data['recinto_id'],
        dignidad: doc.data['dignidad'],
        totalSufragantes: doc.data['total_sufragantes'],
        votosNulos: doc.data['votos_nulos'],
        votosBlancos: doc.data['votos_blancos'],
        fotoFileId: doc.data['foto_file_id'],
        fotoBucketId: doc.data['foto_bucket_id'],
        gpsLat: (doc.data['gps_lat'] as num?)?.toDouble(),
        gpsLng: (doc.data['gps_lng'] as num?)?.toDouble(),
        gpsAccuracy: (doc.data['gps_accuracy'] as num?)?.toDouble(),
        registradoPor: doc.data['registrado_por'],
        sincronizado: doc.data['sincronizado'] ?? true,
        updatedAt: DateTime.parse(doc.data['updated_at']),
      );
    } catch (_) {
      return null;
    }
  }

  Future<List<ActaEntity>> getActasByMesa(String mesaId) async {
    final result = await _db.listDocuments(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.actasCollection,
      queries: [Query.equal('mesa_id', mesaId)],
    );
    return result.documents.map((doc) {
      return ActaEntity(
        id: doc.$id,
        mesaId: doc.data['mesa_id'],
        recintoId: doc.data['recinto_id'],
        dignidad: doc.data['dignidad'],
        totalSufragantes: doc.data['total_sufragantes'],
        votosNulos: doc.data['votos_nulos'],
        votosBlancos: doc.data['votos_blancos'],
        fotoFileId: doc.data['foto_file_id'],
        fotoBucketId: doc.data['foto_bucket_id'],
        gpsLat: (doc.data['gps_lat'] as num?)?.toDouble(),
        gpsLng: (doc.data['gps_lng'] as num?)?.toDouble(),
        gpsAccuracy: (doc.data['gps_accuracy'] as num?)?.toDouble(),
        registradoPor: doc.data['registrado_por'],
        sincronizado: doc.data['sincronizado'] ?? true,
        updatedAt: DateTime.parse(doc.data['updated_at']),
      );
    }).toList();
  }
}
