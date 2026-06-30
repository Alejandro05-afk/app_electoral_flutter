import 'dart:convert';
import 'package:appwrite/appwrite.dart';
import 'package:control_electoral/core/appwrite/appwrite_client.dart';
import 'package:control_electoral/features/provincial/domain/entities/recinto_entity.dart';
import 'package:control_electoral/features/recinto/domain/entities/mesa_entity.dart';
import 'package:control_electoral/features/veedor/domain/entities/acta_entity.dart';

class ProvincialRemoteDatasource {
  final Databases _db;
  final Functions _functions;

  ProvincialRemoteDatasource(this._db, this._functions);

  Future<List<MesaEntity>> getAllMesas() async {
    final result = await _db.listDocuments(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.mesasCollection,
    );
    return result.documents.map((doc) {
      return MesaEntity(
        id: doc.$id,
        recintoId: doc.data['recinto_id'],
        numeroMesa: doc.data['numero_mesa'],
        veedorId: doc.data['veedor_id'],
        estado: doc.data['estado'],
      );
    }).toList();
  }

  Future<List<ActaEntity>> getAllActas() async {
    final result = await _db.listDocuments(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.actasCollection,
    );
    final actas = <ActaEntity>[];
    for (final doc in result.documents) {
      final votosResult = await _db.listDocuments(
        databaseId: AppwriteConfig.databaseId,
        collectionId: AppwriteConfig.actaVotosCollection,
        queries: [Query.equal('acta_id', doc.$id)],
      );
      final votos = votosResult.documents.map((v) => VotoEntity(
        id: v.$id,
        actaId: v.data['acta_id'],
        organizacionId: v.data['organizacion_id'],
        votos: v.data['votos'] ?? 0,
        votosLetras: v.data['votos_letras'] ?? '',
        votosCentena: v.data['votos_centena'] ?? 0,
        votosDecena: v.data['votos_decena'] ?? 0,
        votosUnidad: v.data['votos_unidad'] ?? 0,
      )).toList();

      actas.add(ActaEntity(
        id: doc.$id,
        mesaId: doc.data['mesa_id'],
        recintoId: doc.data['recinto_id'],
        dignidad: doc.data['dignidad'],
        totalSufragantesLetras: doc.data['total_sufragantes_letras'] ?? '',
        totalSufragantesCentena: doc.data['total_sufragantes_centena'] ?? 0,
        totalSufragantesDecena: doc.data['total_sufragantes_decena'] ?? 0,
        totalSufragantesUnidad: doc.data['total_sufragantes_unidad'] ?? 0,
        votosBlancosLetras: doc.data['votos_blancos_letras'] ?? '',
        votosBlancosCentena: doc.data['votos_blancos_centena'] ?? 0,
        votosBlancosDecena: doc.data['votos_blancos_decena'] ?? 0,
        votosBlancosUnidad: doc.data['votos_blancos_unidad'] ?? 0,
        votosNulosLetras: doc.data['votos_nulos_letras'] ?? '',
        votosNulosCentena: doc.data['votos_nulos_centena'] ?? 0,
        votosNulosDecena: doc.data['votos_nulos_decena'] ?? 0,
        votosNulosUnidad: doc.data['votos_nulos_unidad'] ?? 0,
        fotoFileId: doc.data['foto_file_id'],
        fotoBucketId: doc.data['foto_bucket_id'],
        gpsLat: (doc.data['gps_lat'] as num?)?.toDouble(),
        gpsLng: (doc.data['gps_lng'] as num?)?.toDouble(),
        gpsAccuracy: (doc.data['gps_accuracy'] as num?)?.toDouble(),
        registradoPor: doc.data['registrado_por'],
        sincronizado: doc.data['sincronizado'] ?? true,
        updatedAt: DateTime.parse(doc.data['updated_at']),
        votos: votos,
      ));
    }
    return actas;
  }

  Future<List<RecintoEntity>> getRecintos() async {
    final result = await _db.listDocuments(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.recintosCollection,
    );
    return result.documents.map((doc) {
      return RecintoEntity(
        id: doc.$id,
        canton: doc.data['canton'],
        parroquia: doc.data['parroquia'],
        nombre: doc.data['nombre'],
        numJrv: doc.data['num_jrv'],
        coordinadorId: doc.data['coordinador_id'],
        createdBy: doc.data['created_by'],
      );
    }).toList();
  }

  Future<List<String>> createRecinto(RecintoEntity recinto) async {
    final recintoDoc = await _db.createDocument(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.recintosCollection,
      documentId: ID.unique(),
      data: {
        'canton': recinto.canton,
        'parroquia': recinto.parroquia,
        'nombre': recinto.nombre,
        'num_jrv': recinto.numJrv,
        'coordinador_id': recinto.coordinadorId,
        'created_by': recinto.createdBy,
      },
    );
    try {
      final mesaIds = <String>[];
      for (int i = 1; i <= recinto.numJrv; i++) {
        final mesa = await _db.createDocument(
          databaseId: AppwriteConfig.databaseId,
          collectionId: AppwriteConfig.mesasCollection,
          documentId: ID.unique(),
          data: {
            'recinto_id': recintoDoc.$id,
            'numero_mesa': i,
            'veedor_id': '',
            'estado': 'pendiente',
          },
        );
        mesaIds.add(mesa.$id);
      }
      return mesaIds;
    } catch (e) {
      await _db.deleteDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: AppwriteConfig.recintosCollection,
        documentId: recintoDoc.$id,
      );
      rethrow;
    }
  }

  Future<void> assignCoordinador(String recintoId, String coordinadorUserId) async {
    await _db.updateDocument(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.recintosCollection,
      documentId: recintoId,
      data: {'coordinador_id': coordinadorUserId},
    );
  }

  Future<String> createCoordinador({
    required String cedula,
    required String nombres,
    required String apellidos,
    required String telefono,
    required String recintoId,
    required String createdBy,
  }) async {
    final execution = await _functions.createExecution(
      functionId: 'create-user-hierarchy',
      body: jsonEncode({
        'cedula': cedula,
        'email': '$cedula@controlelectoral.local',
        'nombres': nombres,
        'apellidos': apellidos,
        'telefono': telefono,
        'role': 'recinto',
        'recinto_id': recintoId,
        'created_by': createdBy,
      }),
      xasync: false,
    );
    final body = execution.responseBody;
    final logs = execution.logs;
    final errs = execution.errors;
    if (execution.status == 'failed') {
      throw Exception('Status: ${execution.status} | Errors: $errs | Logs: $logs | Body: $body');
    }
    final result = jsonDecode(body);
    if (result is! Map || result['ok'] != true) {
      throw Exception('Response: $body | Status: ${execution.responseStatusCode} | Logs: $logs | Errors: $errs');
    }
    final userId = result['userId'];
    if (userId is! String) {
      throw Exception('userId missing: $body | Logs: $logs | Errors: $errs');
    }
    return userId;
  }
}
