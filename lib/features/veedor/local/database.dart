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
  IntColumn get totalSufragantes => integer()();
  IntColumn get votosNulos => integer()();
  IntColumn get votosBlancos => integer()();
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
  IntColumn get votos => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [LocalActas, LocalActaVotos])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'electoral.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
