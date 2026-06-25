// tools/seed_data.dart
// Run with: dart run tools/seed_data.dart
// NOTE: This script requires a server-side Appwrite client (use Appwrite Function or set headers manually)
import 'package:appwrite/appwrite.dart';

const endpoint = 'TU_ENDPOINT';
const projectId = 'TU_PROJECT_ID';
const databaseId = 'TU_DB_ID';

void main() async {
  final client = Client()
    ..setEndpoint(endpoint)
    ..setProject(projectId);

  final db = Databases(client);

  final orgsAlcalde = [
    {'nombre': 'Movimiento A', 'candidato_nombre': 'Juan Pérez', 'dignidad': 'alcalde', 'numero_lista': 1},
    {'nombre': 'Partido B', 'candidato_nombre': 'María López', 'dignidad': 'alcalde', 'numero_lista': 2},
    {'nombre': 'Alianza C', 'candidato_nombre': 'Carlos Ruiz', 'dignidad': 'alcalde', 'numero_lista': 3},
    {'nombre': 'Frente D', 'candidato_nombre': 'Ana Torres', 'dignidad': 'alcalde', 'numero_lista': 4},
    {'nombre': 'Unión E', 'candidato_nombre': 'Luis Mora', 'dignidad': 'alcalde', 'numero_lista': 5},
  ];

  final orgsPrefecto = [
    {'nombre': 'Movimiento A', 'candidato_nombre': 'Pedro Gómez', 'dignidad': 'prefecto', 'numero_lista': 1},
    {'nombre': 'Partido B', 'candidato_nombre': 'Lucía Vega', 'dignidad': 'prefecto', 'numero_lista': 2},
    {'nombre': 'Alianza C', 'candidato_nombre': 'Diego Ramos', 'dignidad': 'prefecto', 'numero_lista': 3},
    {'nombre': 'Frente D', 'candidato_nombre': 'Sofía Herrera', 'dignidad': 'prefecto', 'numero_lista': 4},
    {'nombre': 'Unión E', 'candidato_nombre': 'Jorge Medina', 'dignidad': 'prefecto', 'numero_lista': 5},
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
