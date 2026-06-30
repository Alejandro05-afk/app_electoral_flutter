import 'dart:io';
import 'package:appwrite/appwrite.dart';
import 'package:control_electoral/core/appwrite/appwrite_client.dart';
import 'package:control_electoral/features/veedor/domain/entities/acta_entity.dart';
import 'package:control_electoral/features/veedor/domain/entities/mesa_entity.dart';
import 'package:control_electoral/features/veedor/domain/entities/organizacion_entity.dart';

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

  Future<List<VotoEntity>> _loadVotos(String actaId) async {
    final result = await _db.listDocuments(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.actaVotosCollection,
      queries: [Query.equal('acta_id', actaId)],
    );
    return result.documents.map((doc) {
      return VotoEntity(
        id: doc.$id,
        actaId: doc.data['acta_id'],
        organizacionId: doc.data['organizacion_id'],
        votos: doc.data['votos'] ?? 0,
        votosLetras: doc.data['votos_letras'] ?? '',
        votosCentena: doc.data['votos_centena'] ?? 0,
        votosDecena: doc.data['votos_decena'] ?? 0,
        votosUnidad: doc.data['votos_unidad'] ?? 0,
      );
    }).toList();
  }

  Future<void> _deleteVotos(String actaId) async {
    final result = await _db.listDocuments(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.actaVotosCollection,
      queries: [Query.equal('acta_id', actaId)],
    );
    for (final doc in result.documents) {
      await _db.deleteDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: AppwriteConfig.actaVotosCollection,
        documentId: doc.$id,
      );
    }
  }

  ActaEntity _docToActa(Map<String, dynamic> data, String id, {List<VotoEntity>? votos}) {
    return ActaEntity(
      id: id,
      mesaId: data['mesa_id'],
      recintoId: data['recinto_id'],
      dignidad: data['dignidad'],
      totalSufragantesLetras: data['total_sufragantes_letras'] ?? '',
      totalSufragantesCentena: data['total_sufragantes_centena'] ?? 0,
      totalSufragantesDecena: data['total_sufragantes_decena'] ?? 0,
      totalSufragantesUnidad: data['total_sufragantes_unidad'] ?? 0,
      votosBlancosLetras: data['votos_blancos_letras'] ?? '',
      votosBlancosCentena: data['votos_blancos_centena'] ?? 0,
      votosBlancosDecena: data['votos_blancos_decena'] ?? 0,
      votosBlancosUnidad: data['votos_blancos_unidad'] ?? 0,
      votosNulosLetras: data['votos_nulos_letras'] ?? '',
      votosNulosCentena: data['votos_nulos_centena'] ?? 0,
      votosNulosDecena: data['votos_nulos_decena'] ?? 0,
      votosNulosUnidad: data['votos_nulos_unidad'] ?? 0,
      fotoFileId: data['foto_file_id'],
      fotoBucketId: data['foto_bucket_id'],
      gpsLat: (data['gps_lat'] as num?)?.toDouble(),
      gpsLng: (data['gps_lng'] as num?)?.toDouble(),
      gpsAccuracy: (data['gps_accuracy'] as num?)?.toDouble(),
      registradoPor: data['registrado_por'],
      sincronizado: data['sincronizado'] ?? true,
      updatedAt: DateTime.parse(data['updated_at']),
      votos: votos ?? [],
    );
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
        'total_sufragantes_letras': acta.totalSufragantesLetras,
        'total_sufragantes_centena': acta.totalSufragantesCentena,
        'total_sufragantes_decena': acta.totalSufragantesDecena,
        'total_sufragantes_unidad': acta.totalSufragantesUnidad,
        'votos_blancos': acta.votosBlancos,
        'votos_blancos_letras': acta.votosBlancosLetras,
        'votos_blancos_centena': acta.votosBlancosCentena,
        'votos_blancos_decena': acta.votosBlancosDecena,
        'votos_blancos_unidad': acta.votosBlancosUnidad,
        'votos_nulos': acta.votosNulos,
        'votos_nulos_letras': acta.votosNulosLetras,
        'votos_nulos_centena': acta.votosNulosCentena,
        'votos_nulos_decena': acta.votosNulosDecena,
        'votos_nulos_unidad': acta.votosNulosUnidad,
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
          'votos_letras': voto.votosLetras,
          'votos_centena': voto.votosCentena,
          'votos_decena': voto.votosDecena,
          'votos_unidad': voto.votosUnidad,
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
        'total_sufragantes_letras': acta.totalSufragantesLetras,
        'total_sufragantes_centena': acta.totalSufragantesCentena,
        'total_sufragantes_decena': acta.totalSufragantesDecena,
        'total_sufragantes_unidad': acta.totalSufragantesUnidad,
        'votos_blancos': acta.votosBlancos,
        'votos_blancos_letras': acta.votosBlancosLetras,
        'votos_blancos_centena': acta.votosBlancosCentena,
        'votos_blancos_decena': acta.votosBlancosDecena,
        'votos_blancos_unidad': acta.votosBlancosUnidad,
        'votos_nulos': acta.votosNulos,
        'votos_nulos_letras': acta.votosNulosLetras,
        'votos_nulos_centena': acta.votosNulosCentena,
        'votos_nulos_decena': acta.votosNulosDecena,
        'votos_nulos_unidad': acta.votosNulosUnidad,
        'foto_file_id': acta.fotoFileId,
        'gps_lat': acta.gpsLat,
        'gps_lng': acta.gpsLng,
        'gps_accuracy': acta.gpsAccuracy,
        'updated_at': DateTime.now().toIso8601String(),
      },
    );

    await _deleteVotos(acta.id);
    for (final voto in acta.votos) {
      await _db.createDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: AppwriteConfig.actaVotosCollection,
        documentId: ID.unique(),
        data: {
          'acta_id': acta.id,
          'organizacion_id': voto.organizacionId,
          'votos': voto.votos,
          'votos_letras': voto.votosLetras,
          'votos_centena': voto.votosCentena,
          'votos_decena': voto.votosDecena,
          'votos_unidad': voto.votosUnidad,
        },
      );
    }
  }

  Future<ActaEntity?> getActa(String actaId) async {
    try {
      final doc = await _db.getDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: AppwriteConfig.actasCollection,
        documentId: actaId,
      );
      final votos = await _loadVotos(actaId);
      return _docToActa(doc.data, doc.$id, votos: votos);
    } catch (_) {
      return null;
    }
  }

  Future<List<OrganizacionEntity>> getOrganizaciones(String dignidad) async {
    final result = await _db.listDocuments(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.organizacionesCollection,
      queries: [Query.equal('dignidad', dignidad)],
    );
    return result.documents.map((doc) {
      return OrganizacionEntity(
        id: doc.$id,
        nombre: doc.data['nombre'],
        dignidad: doc.data['dignidad'],
        numeroLista: doc.data['numero_lista'],
        candidatoNombre: doc.data['candidato_nombre'],
      );
    }).toList();
  }

  Future<List<MesaEntity>> getMesasByVeedor(String veedorId) async {
    final result = await _db.listDocuments(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.mesasCollection,
      queries: [Query.equal('veedor_id', veedorId)],
    );
    return result.documents.map((doc) {
      return MesaEntity(
        id: doc.$id,
        recintoId: doc.data['recinto_id'],
        numeroMesa: doc.data['numero_mesa'],
        veedorId: doc.data['veedor_id'],
        estado: doc.data['estado'] ?? 'pendiente',
      );
    }).toList();
  }

  Future<void> updateMesaEstado(String mesaId, String estado) async {
    await _db.updateDocument(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.mesasCollection,
      documentId: mesaId,
      data: {'estado': estado, 'updated_at': DateTime.now().toIso8601String()},
    );
  }

  Future<List<ActaEntity>> getActasByUser(String userId) async {
    final result = await _db.listDocuments(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.actasCollection,
      queries: [Query.equal('registrado_por', userId)],
    );
    final actas = <ActaEntity>[];
    for (final doc in result.documents) {
      final votos = await _loadVotos(doc.$id);
      actas.add(_docToActa(doc.data, doc.$id, votos: votos));
    }
    return actas;
  }

  Future<List<ActaEntity>> getActasByMesa(String mesaId) async {
    final result = await _db.listDocuments(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.actasCollection,
      queries: [Query.equal('mesa_id', mesaId)],
    );
    final actas = <ActaEntity>[];
    for (final doc in result.documents) {
      final votos = await _loadVotos(doc.$id);
      actas.add(_docToActa(doc.data, doc.$id, votos: votos));
    }
    return actas;
  }
}
