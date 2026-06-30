import 'dart:convert';
import 'package:appwrite/appwrite.dart';
import 'package:control_electoral/core/appwrite/appwrite_client.dart';
import 'package:control_electoral/features/recinto/domain/entities/mesa_entity.dart';

class RecintoRemoteDatasource {
  final Databases _db;
  final Functions _functions;

  RecintoRemoteDatasource(this._db, this._functions);

  Future<List<MesaEntity>> getMesas(String recintoId) async {
    final result = await _db.listDocuments(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.mesasCollection,
      queries: [Query.equal('recinto_id', recintoId)],
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

  Future<void> assignVeedor(String mesaId, String veedorUserId) async {
    await _db.updateDocument(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.mesasCollection,
      documentId: mesaId,
      data: {'veedor_id': veedorUserId},
    );
  }

  Future<String> createVeedor({
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
        'role': 'veedor',
        'recinto_id': recintoId,
        'created_by': createdBy,
      }),
      xasync: false,
    );
    if (execution.status == 'failed') {
      throw Exception('Function error: ${execution.errors}');
    }
    final result = jsonDecode(execution.responseBody);
    if (result is! Map || result['ok'] != true) {
      throw Exception('Function returned: $result');
    }
    final userId = result['userId'];
    if (userId is! String) {
      throw Exception('userId not returned: $result');
    }
    return userId;
  }

  Future<List<Map<String, dynamic>>> getVeedores(String recintoId) async {
    final result = await _db.listDocuments(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.usersProfileCollection,
      queries: [
        Query.equal('role', 'veedor'),
        Query.equal('recinto_id', recintoId),
      ],
    );
    return result.documents.map((doc) {
      return Map<String, dynamic>.from(doc.data);
    }).toList();
  }
}
