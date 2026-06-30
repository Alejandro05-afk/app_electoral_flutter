import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

part 'database.g.dart';

class LocalActas extends Table {
  TextColumn get id => text()();
  TextColumn get mesaId => text()();
  TextColumn get recintoId => text()();
  TextColumn get dignidad => text()();
  TextColumn get totalSufragantesLetras => text().withDefault(const Constant(''))();
  IntColumn get totalSufragantesCentena => integer().withDefault(const Constant(0))();
  IntColumn get totalSufragantesDecena => integer().withDefault(const Constant(0))();
  IntColumn get totalSufragantesUnidad => integer().withDefault(const Constant(0))();
  TextColumn get votosBlancosLetras => text().withDefault(const Constant(''))();
  IntColumn get votosBlancosCentena => integer().withDefault(const Constant(0))();
  IntColumn get votosBlancosDecena => integer().withDefault(const Constant(0))();
  IntColumn get votosBlancosUnidad => integer().withDefault(const Constant(0))();
  TextColumn get votosNulosLetras => text().withDefault(const Constant(''))();
  IntColumn get votosNulosCentena => integer().withDefault(const Constant(0))();
  IntColumn get votosNulosDecena => integer().withDefault(const Constant(0))();
  IntColumn get votosNulosUnidad => integer().withDefault(const Constant(0))();
  TextColumn get fotoLocalPath => text().nullable()();
  TextColumn get fotoFileId => text().nullable()();
  RealColumn get gpsLat => real().nullable()();
  RealColumn get gpsLng => real().nullable()();
  RealColumn get gpsAccuracy => real().nullable()();
  TextColumn get registradoPor => text()();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class LocalActaVotos extends Table {
  TextColumn get id => text()();
  TextColumn get actaId => text()();
  TextColumn get organizacionId => text()();
  IntColumn get votos => integer().withDefault(const Constant(0))();
  TextColumn get votosLetras => text().withDefault(const Constant(''))();
  IntColumn get votosCentena => integer().withDefault(const Constant(0))();
  IntColumn get votosDecena => integer().withDefault(const Constant(0))();
  IntColumn get votosUnidad => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

class LocalMesas extends Table {
  TextColumn get id => text()();
  TextColumn get recintoId => text()();
  IntColumn get numeroMesa => integer()();
  TextColumn get veedorId => text().nullable()();
  TextColumn get estado => text()();
  TextColumn get veedorUserId => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class LocalOrganizaciones extends Table {
  TextColumn get id => text()();
  TextColumn get nombre => text()();
  TextColumn get dignidad => text()();
  IntColumn get numeroLista => integer()();
  TextColumn get candidatoNombre => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [LocalActas, LocalActaVotos, LocalMesas, LocalOrganizaciones])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) => m.createAll(),
      onUpgrade: (m, from, to) async {
        if (from < 2) {
          await m.createAll();
        } else {
          if (from < 3) {
            await m.addColumn(localActas, localActas.totalSufragantesLetras);
            await m.addColumn(localActas, localActas.totalSufragantesCentena);
            await m.addColumn(localActas, localActas.totalSufragantesDecena);
            await m.addColumn(localActas, localActas.totalSufragantesUnidad);
            await m.addColumn(localActas, localActas.votosBlancosLetras);
            await m.addColumn(localActas, localActas.votosBlancosCentena);
            await m.addColumn(localActas, localActas.votosBlancosDecena);
            await m.addColumn(localActas, localActas.votosBlancosUnidad);
            await m.addColumn(localActas, localActas.votosNulosLetras);
            await m.addColumn(localActas, localActas.votosNulosCentena);
            await m.addColumn(localActas, localActas.votosNulosDecena);
            await m.addColumn(localActas, localActas.votosNulosUnidad);
            await m.addColumn(localActaVotos, localActaVotos.votosLetras);
            await m.addColumn(localActaVotos, localActaVotos.votosCentena);
            await m.addColumn(localActaVotos, localActaVotos.votosDecena);
            await m.addColumn(localActaVotos, localActaVotos.votosUnidad);
          }
        }
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'electoral.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
