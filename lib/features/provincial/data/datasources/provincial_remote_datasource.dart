import 'package:appwrite/appwrite.dart';
import 'package:control_electoral/core/appwrite/appwrite_client.dart';
import 'package:control_electoral/features/provincial/domain/entities/recinto_entity.dart';

class ProvincialRemoteDatasource {
  final Databases _db;

  ProvincialRemoteDatasource(this._db);

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

  Future<void> createRecinto(RecintoEntity recinto) async {
    await _db.createDocument(
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
  }

  Future<void> assignCoordinador(String recintoId, String coordinadorUserId) async {
    await _db.updateDocument(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.recintosCollection,
      documentId: recintoId,
      data: {'coordinador_id': coordinadorUserId},
    );
  }
}
