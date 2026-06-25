import 'package:appwrite/appwrite.dart';
import 'package:control_electoral/core/appwrite/appwrite_client.dart';
import 'package:control_electoral/features/recinto/domain/entities/mesa_entity.dart';

class RecintoRemoteDatasource {
  final Databases _db;

  RecintoRemoteDatasource(this._db);

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
}
