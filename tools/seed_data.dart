// tools/seed_data.dart
// Run with: dart run tools/seed_data.dart
// NOTE: Requires an Appwrite API Key with databases.write permission.
// Get one from: Appwrite Console -> API Keys -> Create API Key
import 'package:appwrite/appwrite.dart';

const endpoint = 'https://cloud.appwrite.io/v1';
const projectId = '6a3d90690027e626c87c';
const databaseId = '6a3d923c0002ed8f934b';
const apiKey = 'AQUI_TU_API_KEY'; // <-- Reemplazar con API Key del backend

void main() async {
  final client = Client()
    ..setEndpoint(endpoint)
    ..setProject(projectId)
    ..setKey(apiKey);

  final db = Databases(client);

  final orgsAlcalde = [
    {
      'nombre': 'Revolución Ciudadana',
      'candidato_nombre': 'Pabel Muñoz',
      'dignidad': 'alcalde',
      'numero_lista': 5,
    },
    {
      'nombre': 'Partido Social Cristiano',
      'candidato_nombre': 'Jorge Yunda',
      'dignidad': 'alcalde',
      'numero_lista': 6,
    },
    {
      'nombre': 'Acción Democrática Nacional',
      'candidato_nombre': 'Andrés Castillo',
      'dignidad': 'alcalde',
      'numero_lista': 7,
    },
    {
      'nombre': 'Movimiento CREO',
      'candidato_nombre': 'Juan José Castelló',
      'dignidad': 'alcalde',
      'numero_lista': 21,
    },
    {
      'nombre': 'Pachakutik',
      'candidato_nombre': 'Rosa Cerda',
      'dignidad': 'alcalde',
      'numero_lista': 18,
    },
  ];

  final orgsPrefecto = [
    {
      'nombre': 'Revolución Ciudadana',
      'candidato_nombre': 'Paola Pabón',
      'dignidad': 'prefecto',
      'numero_lista': 5,
    },
    {
      'nombre': 'Partido Social Cristiano',
      'candidato_nombre': 'Gissel Proaño',
      'dignidad': 'prefecto',
      'numero_lista': 6,
    },
    {
      'nombre': 'Acción Democrática Nacional',
      'candidato_nombre': 'Mauricio Pinto',
      'dignidad': 'prefecto',
      'numero_lista': 7,
    },
    {
      'nombre': 'Movimiento CREO',
      'candidato_nombre': 'Patricio Barriga',
      'dignidad': 'prefecto',
      'numero_lista': 21,
    },
    {
      'nombre': 'Pachakutik',
      'candidato_nombre': 'Fernando Davalos',
      'dignidad': 'prefecto',
      'numero_lista': 18,
    },
  ];

  print('Insertando organizaciones políticas...');
  for (final org in [...orgsAlcalde, ...orgsPrefecto]) {
    await db.createDocument(
      databaseId: databaseId,
      collectionId: 'organizaciones_politicas',
      documentId: ID.unique(),
      data: org,
    );
  }
  print('10 organizaciones insertadas correctamente.');
}
