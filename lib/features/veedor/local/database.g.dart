// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $LocalActasTable extends LocalActas
    with TableInfo<$LocalActasTable, LocalActa> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalActasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mesaIdMeta = const VerificationMeta('mesaId');
  @override
  late final GeneratedColumn<String> mesaId = GeneratedColumn<String>(
    'mesa_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recintoIdMeta = const VerificationMeta(
    'recintoId',
  );
  @override
  late final GeneratedColumn<String> recintoId = GeneratedColumn<String>(
    'recinto_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dignidadMeta = const VerificationMeta(
    'dignidad',
  );
  @override
  late final GeneratedColumn<String> dignidad = GeneratedColumn<String>(
    'dignidad',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalSufragantesMeta = const VerificationMeta(
    'totalSufragantes',
  );
  @override
  late final GeneratedColumn<int> totalSufragantes = GeneratedColumn<int>(
    'total_sufragantes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _votosNulosMeta = const VerificationMeta(
    'votosNulos',
  );
  @override
  late final GeneratedColumn<int> votosNulos = GeneratedColumn<int>(
    'votos_nulos',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _votosBlancosMeta = const VerificationMeta(
    'votosBlancos',
  );
  @override
  late final GeneratedColumn<int> votosBlancos = GeneratedColumn<int>(
    'votos_blancos',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fotoLocalPathMeta = const VerificationMeta(
    'fotoLocalPath',
  );
  @override
  late final GeneratedColumn<String> fotoLocalPath = GeneratedColumn<String>(
    'foto_local_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fotoFileIdMeta = const VerificationMeta(
    'fotoFileId',
  );
  @override
  late final GeneratedColumn<String> fotoFileId = GeneratedColumn<String>(
    'foto_file_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gpsLatMeta = const VerificationMeta('gpsLat');
  @override
  late final GeneratedColumn<double> gpsLat = GeneratedColumn<double>(
    'gps_lat',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gpsLngMeta = const VerificationMeta('gpsLng');
  @override
  late final GeneratedColumn<double> gpsLng = GeneratedColumn<double>(
    'gps_lng',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gpsAccuracyMeta = const VerificationMeta(
    'gpsAccuracy',
  );
  @override
  late final GeneratedColumn<double> gpsAccuracy = GeneratedColumn<double>(
    'gps_accuracy',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _registradoPorMeta = const VerificationMeta(
    'registradoPor',
  );
  @override
  late final GeneratedColumn<String> registradoPor = GeneratedColumn<String>(
    'registrado_por',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sincronizadoMeta = const VerificationMeta(
    'sincronizado',
  );
  @override
  late final GeneratedColumn<bool> sincronizado = GeneratedColumn<bool>(
    'sincronizado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sincronizado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    mesaId,
    recintoId,
    dignidad,
    totalSufragantes,
    votosNulos,
    votosBlancos,
    fotoLocalPath,
    fotoFileId,
    gpsLat,
    gpsLng,
    gpsAccuracy,
    registradoPor,
    sincronizado,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_actas';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalActa> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('mesa_id')) {
      context.handle(
        _mesaIdMeta,
        mesaId.isAcceptableOrUnknown(data['mesa_id']!, _mesaIdMeta),
      );
    } else if (isInserting) {
      context.missing(_mesaIdMeta);
    }
    if (data.containsKey('recinto_id')) {
      context.handle(
        _recintoIdMeta,
        recintoId.isAcceptableOrUnknown(data['recinto_id']!, _recintoIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recintoIdMeta);
    }
    if (data.containsKey('dignidad')) {
      context.handle(
        _dignidadMeta,
        dignidad.isAcceptableOrUnknown(data['dignidad']!, _dignidadMeta),
      );
    } else if (isInserting) {
      context.missing(_dignidadMeta);
    }
    if (data.containsKey('total_sufragantes')) {
      context.handle(
        _totalSufragantesMeta,
        totalSufragantes.isAcceptableOrUnknown(
          data['total_sufragantes']!,
          _totalSufragantesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalSufragantesMeta);
    }
    if (data.containsKey('votos_nulos')) {
      context.handle(
        _votosNulosMeta,
        votosNulos.isAcceptableOrUnknown(data['votos_nulos']!, _votosNulosMeta),
      );
    } else if (isInserting) {
      context.missing(_votosNulosMeta);
    }
    if (data.containsKey('votos_blancos')) {
      context.handle(
        _votosBlancosMeta,
        votosBlancos.isAcceptableOrUnknown(
          data['votos_blancos']!,
          _votosBlancosMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_votosBlancosMeta);
    }
    if (data.containsKey('foto_local_path')) {
      context.handle(
        _fotoLocalPathMeta,
        fotoLocalPath.isAcceptableOrUnknown(
          data['foto_local_path']!,
          _fotoLocalPathMeta,
        ),
      );
    }
    if (data.containsKey('foto_file_id')) {
      context.handle(
        _fotoFileIdMeta,
        fotoFileId.isAcceptableOrUnknown(
          data['foto_file_id']!,
          _fotoFileIdMeta,
        ),
      );
    }
    if (data.containsKey('gps_lat')) {
      context.handle(
        _gpsLatMeta,
        gpsLat.isAcceptableOrUnknown(data['gps_lat']!, _gpsLatMeta),
      );
    }
    if (data.containsKey('gps_lng')) {
      context.handle(
        _gpsLngMeta,
        gpsLng.isAcceptableOrUnknown(data['gps_lng']!, _gpsLngMeta),
      );
    }
    if (data.containsKey('gps_accuracy')) {
      context.handle(
        _gpsAccuracyMeta,
        gpsAccuracy.isAcceptableOrUnknown(
          data['gps_accuracy']!,
          _gpsAccuracyMeta,
        ),
      );
    }
    if (data.containsKey('registrado_por')) {
      context.handle(
        _registradoPorMeta,
        registradoPor.isAcceptableOrUnknown(
          data['registrado_por']!,
          _registradoPorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_registradoPorMeta);
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
        _sincronizadoMeta,
        sincronizado.isAcceptableOrUnknown(
          data['sincronizado']!,
          _sincronizadoMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalActa map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalActa(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      mesaId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mesa_id'],
      )!,
      recintoId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recinto_id'],
      )!,
      dignidad: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dignidad'],
      )!,
      totalSufragantes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_sufragantes'],
      )!,
      votosNulos: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}votos_nulos'],
      )!,
      votosBlancos: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}votos_blancos'],
      )!,
      fotoLocalPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}foto_local_path'],
      ),
      fotoFileId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}foto_file_id'],
      ),
      gpsLat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}gps_lat'],
      ),
      gpsLng: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}gps_lng'],
      ),
      gpsAccuracy: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}gps_accuracy'],
      ),
      registradoPor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}registrado_por'],
      )!,
      sincronizado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}sincronizado'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $LocalActasTable createAlias(String alias) {
    return $LocalActasTable(attachedDatabase, alias);
  }
}

class LocalActa extends DataClass implements Insertable<LocalActa> {
  final String id;
  final String mesaId;
  final String recintoId;
  final String dignidad;
  final int totalSufragantes;
  final int votosNulos;
  final int votosBlancos;
  final String? fotoLocalPath;
  final String? fotoFileId;
  final double? gpsLat;
  final double? gpsLng;
  final double? gpsAccuracy;
  final String registradoPor;
  final bool sincronizado;
  final DateTime updatedAt;
  const LocalActa({
    required this.id,
    required this.mesaId,
    required this.recintoId,
    required this.dignidad,
    required this.totalSufragantes,
    required this.votosNulos,
    required this.votosBlancos,
    this.fotoLocalPath,
    this.fotoFileId,
    this.gpsLat,
    this.gpsLng,
    this.gpsAccuracy,
    required this.registradoPor,
    required this.sincronizado,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['mesa_id'] = Variable<String>(mesaId);
    map['recinto_id'] = Variable<String>(recintoId);
    map['dignidad'] = Variable<String>(dignidad);
    map['total_sufragantes'] = Variable<int>(totalSufragantes);
    map['votos_nulos'] = Variable<int>(votosNulos);
    map['votos_blancos'] = Variable<int>(votosBlancos);
    if (!nullToAbsent || fotoLocalPath != null) {
      map['foto_local_path'] = Variable<String>(fotoLocalPath);
    }
    if (!nullToAbsent || fotoFileId != null) {
      map['foto_file_id'] = Variable<String>(fotoFileId);
    }
    if (!nullToAbsent || gpsLat != null) {
      map['gps_lat'] = Variable<double>(gpsLat);
    }
    if (!nullToAbsent || gpsLng != null) {
      map['gps_lng'] = Variable<double>(gpsLng);
    }
    if (!nullToAbsent || gpsAccuracy != null) {
      map['gps_accuracy'] = Variable<double>(gpsAccuracy);
    }
    map['registrado_por'] = Variable<String>(registradoPor);
    map['sincronizado'] = Variable<bool>(sincronizado);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  LocalActasCompanion toCompanion(bool nullToAbsent) {
    return LocalActasCompanion(
      id: Value(id),
      mesaId: Value(mesaId),
      recintoId: Value(recintoId),
      dignidad: Value(dignidad),
      totalSufragantes: Value(totalSufragantes),
      votosNulos: Value(votosNulos),
      votosBlancos: Value(votosBlancos),
      fotoLocalPath: fotoLocalPath == null && nullToAbsent
          ? const Value.absent()
          : Value(fotoLocalPath),
      fotoFileId: fotoFileId == null && nullToAbsent
          ? const Value.absent()
          : Value(fotoFileId),
      gpsLat: gpsLat == null && nullToAbsent
          ? const Value.absent()
          : Value(gpsLat),
      gpsLng: gpsLng == null && nullToAbsent
          ? const Value.absent()
          : Value(gpsLng),
      gpsAccuracy: gpsAccuracy == null && nullToAbsent
          ? const Value.absent()
          : Value(gpsAccuracy),
      registradoPor: Value(registradoPor),
      sincronizado: Value(sincronizado),
      updatedAt: Value(updatedAt),
    );
  }

  factory LocalActa.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalActa(
      id: serializer.fromJson<String>(json['id']),
      mesaId: serializer.fromJson<String>(json['mesaId']),
      recintoId: serializer.fromJson<String>(json['recintoId']),
      dignidad: serializer.fromJson<String>(json['dignidad']),
      totalSufragantes: serializer.fromJson<int>(json['totalSufragantes']),
      votosNulos: serializer.fromJson<int>(json['votosNulos']),
      votosBlancos: serializer.fromJson<int>(json['votosBlancos']),
      fotoLocalPath: serializer.fromJson<String?>(json['fotoLocalPath']),
      fotoFileId: serializer.fromJson<String?>(json['fotoFileId']),
      gpsLat: serializer.fromJson<double?>(json['gpsLat']),
      gpsLng: serializer.fromJson<double?>(json['gpsLng']),
      gpsAccuracy: serializer.fromJson<double?>(json['gpsAccuracy']),
      registradoPor: serializer.fromJson<String>(json['registradoPor']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'mesaId': serializer.toJson<String>(mesaId),
      'recintoId': serializer.toJson<String>(recintoId),
      'dignidad': serializer.toJson<String>(dignidad),
      'totalSufragantes': serializer.toJson<int>(totalSufragantes),
      'votosNulos': serializer.toJson<int>(votosNulos),
      'votosBlancos': serializer.toJson<int>(votosBlancos),
      'fotoLocalPath': serializer.toJson<String?>(fotoLocalPath),
      'fotoFileId': serializer.toJson<String?>(fotoFileId),
      'gpsLat': serializer.toJson<double?>(gpsLat),
      'gpsLng': serializer.toJson<double?>(gpsLng),
      'gpsAccuracy': serializer.toJson<double?>(gpsAccuracy),
      'registradoPor': serializer.toJson<String>(registradoPor),
      'sincronizado': serializer.toJson<bool>(sincronizado),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  LocalActa copyWith({
    String? id,
    String? mesaId,
    String? recintoId,
    String? dignidad,
    int? totalSufragantes,
    int? votosNulos,
    int? votosBlancos,
    Value<String?> fotoLocalPath = const Value.absent(),
    Value<String?> fotoFileId = const Value.absent(),
    Value<double?> gpsLat = const Value.absent(),
    Value<double?> gpsLng = const Value.absent(),
    Value<double?> gpsAccuracy = const Value.absent(),
    String? registradoPor,
    bool? sincronizado,
    DateTime? updatedAt,
  }) => LocalActa(
    id: id ?? this.id,
    mesaId: mesaId ?? this.mesaId,
    recintoId: recintoId ?? this.recintoId,
    dignidad: dignidad ?? this.dignidad,
    totalSufragantes: totalSufragantes ?? this.totalSufragantes,
    votosNulos: votosNulos ?? this.votosNulos,
    votosBlancos: votosBlancos ?? this.votosBlancos,
    fotoLocalPath: fotoLocalPath.present
        ? fotoLocalPath.value
        : this.fotoLocalPath,
    fotoFileId: fotoFileId.present ? fotoFileId.value : this.fotoFileId,
    gpsLat: gpsLat.present ? gpsLat.value : this.gpsLat,
    gpsLng: gpsLng.present ? gpsLng.value : this.gpsLng,
    gpsAccuracy: gpsAccuracy.present ? gpsAccuracy.value : this.gpsAccuracy,
    registradoPor: registradoPor ?? this.registradoPor,
    sincronizado: sincronizado ?? this.sincronizado,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  LocalActa copyWithCompanion(LocalActasCompanion data) {
    return LocalActa(
      id: data.id.present ? data.id.value : this.id,
      mesaId: data.mesaId.present ? data.mesaId.value : this.mesaId,
      recintoId: data.recintoId.present ? data.recintoId.value : this.recintoId,
      dignidad: data.dignidad.present ? data.dignidad.value : this.dignidad,
      totalSufragantes: data.totalSufragantes.present
          ? data.totalSufragantes.value
          : this.totalSufragantes,
      votosNulos: data.votosNulos.present
          ? data.votosNulos.value
          : this.votosNulos,
      votosBlancos: data.votosBlancos.present
          ? data.votosBlancos.value
          : this.votosBlancos,
      fotoLocalPath: data.fotoLocalPath.present
          ? data.fotoLocalPath.value
          : this.fotoLocalPath,
      fotoFileId: data.fotoFileId.present
          ? data.fotoFileId.value
          : this.fotoFileId,
      gpsLat: data.gpsLat.present ? data.gpsLat.value : this.gpsLat,
      gpsLng: data.gpsLng.present ? data.gpsLng.value : this.gpsLng,
      gpsAccuracy: data.gpsAccuracy.present
          ? data.gpsAccuracy.value
          : this.gpsAccuracy,
      registradoPor: data.registradoPor.present
          ? data.registradoPor.value
          : this.registradoPor,
      sincronizado: data.sincronizado.present
          ? data.sincronizado.value
          : this.sincronizado,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalActa(')
          ..write('id: $id, ')
          ..write('mesaId: $mesaId, ')
          ..write('recintoId: $recintoId, ')
          ..write('dignidad: $dignidad, ')
          ..write('totalSufragantes: $totalSufragantes, ')
          ..write('votosNulos: $votosNulos, ')
          ..write('votosBlancos: $votosBlancos, ')
          ..write('fotoLocalPath: $fotoLocalPath, ')
          ..write('fotoFileId: $fotoFileId, ')
          ..write('gpsLat: $gpsLat, ')
          ..write('gpsLng: $gpsLng, ')
          ..write('gpsAccuracy: $gpsAccuracy, ')
          ..write('registradoPor: $registradoPor, ')
          ..write('sincronizado: $sincronizado, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    mesaId,
    recintoId,
    dignidad,
    totalSufragantes,
    votosNulos,
    votosBlancos,
    fotoLocalPath,
    fotoFileId,
    gpsLat,
    gpsLng,
    gpsAccuracy,
    registradoPor,
    sincronizado,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalActa &&
          other.id == this.id &&
          other.mesaId == this.mesaId &&
          other.recintoId == this.recintoId &&
          other.dignidad == this.dignidad &&
          other.totalSufragantes == this.totalSufragantes &&
          other.votosNulos == this.votosNulos &&
          other.votosBlancos == this.votosBlancos &&
          other.fotoLocalPath == this.fotoLocalPath &&
          other.fotoFileId == this.fotoFileId &&
          other.gpsLat == this.gpsLat &&
          other.gpsLng == this.gpsLng &&
          other.gpsAccuracy == this.gpsAccuracy &&
          other.registradoPor == this.registradoPor &&
          other.sincronizado == this.sincronizado &&
          other.updatedAt == this.updatedAt);
}

class LocalActasCompanion extends UpdateCompanion<LocalActa> {
  final Value<String> id;
  final Value<String> mesaId;
  final Value<String> recintoId;
  final Value<String> dignidad;
  final Value<int> totalSufragantes;
  final Value<int> votosNulos;
  final Value<int> votosBlancos;
  final Value<String?> fotoLocalPath;
  final Value<String?> fotoFileId;
  final Value<double?> gpsLat;
  final Value<double?> gpsLng;
  final Value<double?> gpsAccuracy;
  final Value<String> registradoPor;
  final Value<bool> sincronizado;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const LocalActasCompanion({
    this.id = const Value.absent(),
    this.mesaId = const Value.absent(),
    this.recintoId = const Value.absent(),
    this.dignidad = const Value.absent(),
    this.totalSufragantes = const Value.absent(),
    this.votosNulos = const Value.absent(),
    this.votosBlancos = const Value.absent(),
    this.fotoLocalPath = const Value.absent(),
    this.fotoFileId = const Value.absent(),
    this.gpsLat = const Value.absent(),
    this.gpsLng = const Value.absent(),
    this.gpsAccuracy = const Value.absent(),
    this.registradoPor = const Value.absent(),
    this.sincronizado = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalActasCompanion.insert({
    required String id,
    required String mesaId,
    required String recintoId,
    required String dignidad,
    required int totalSufragantes,
    required int votosNulos,
    required int votosBlancos,
    this.fotoLocalPath = const Value.absent(),
    this.fotoFileId = const Value.absent(),
    this.gpsLat = const Value.absent(),
    this.gpsLng = const Value.absent(),
    this.gpsAccuracy = const Value.absent(),
    required String registradoPor,
    this.sincronizado = const Value.absent(),
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       mesaId = Value(mesaId),
       recintoId = Value(recintoId),
       dignidad = Value(dignidad),
       totalSufragantes = Value(totalSufragantes),
       votosNulos = Value(votosNulos),
       votosBlancos = Value(votosBlancos),
       registradoPor = Value(registradoPor),
       updatedAt = Value(updatedAt);
  static Insertable<LocalActa> custom({
    Expression<String>? id,
    Expression<String>? mesaId,
    Expression<String>? recintoId,
    Expression<String>? dignidad,
    Expression<int>? totalSufragantes,
    Expression<int>? votosNulos,
    Expression<int>? votosBlancos,
    Expression<String>? fotoLocalPath,
    Expression<String>? fotoFileId,
    Expression<double>? gpsLat,
    Expression<double>? gpsLng,
    Expression<double>? gpsAccuracy,
    Expression<String>? registradoPor,
    Expression<bool>? sincronizado,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mesaId != null) 'mesa_id': mesaId,
      if (recintoId != null) 'recinto_id': recintoId,
      if (dignidad != null) 'dignidad': dignidad,
      if (totalSufragantes != null) 'total_sufragantes': totalSufragantes,
      if (votosNulos != null) 'votos_nulos': votosNulos,
      if (votosBlancos != null) 'votos_blancos': votosBlancos,
      if (fotoLocalPath != null) 'foto_local_path': fotoLocalPath,
      if (fotoFileId != null) 'foto_file_id': fotoFileId,
      if (gpsLat != null) 'gps_lat': gpsLat,
      if (gpsLng != null) 'gps_lng': gpsLng,
      if (gpsAccuracy != null) 'gps_accuracy': gpsAccuracy,
      if (registradoPor != null) 'registrado_por': registradoPor,
      if (sincronizado != null) 'sincronizado': sincronizado,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalActasCompanion copyWith({
    Value<String>? id,
    Value<String>? mesaId,
    Value<String>? recintoId,
    Value<String>? dignidad,
    Value<int>? totalSufragantes,
    Value<int>? votosNulos,
    Value<int>? votosBlancos,
    Value<String?>? fotoLocalPath,
    Value<String?>? fotoFileId,
    Value<double?>? gpsLat,
    Value<double?>? gpsLng,
    Value<double?>? gpsAccuracy,
    Value<String>? registradoPor,
    Value<bool>? sincronizado,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return LocalActasCompanion(
      id: id ?? this.id,
      mesaId: mesaId ?? this.mesaId,
      recintoId: recintoId ?? this.recintoId,
      dignidad: dignidad ?? this.dignidad,
      totalSufragantes: totalSufragantes ?? this.totalSufragantes,
      votosNulos: votosNulos ?? this.votosNulos,
      votosBlancos: votosBlancos ?? this.votosBlancos,
      fotoLocalPath: fotoLocalPath ?? this.fotoLocalPath,
      fotoFileId: fotoFileId ?? this.fotoFileId,
      gpsLat: gpsLat ?? this.gpsLat,
      gpsLng: gpsLng ?? this.gpsLng,
      gpsAccuracy: gpsAccuracy ?? this.gpsAccuracy,
      registradoPor: registradoPor ?? this.registradoPor,
      sincronizado: sincronizado ?? this.sincronizado,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (mesaId.present) {
      map['mesa_id'] = Variable<String>(mesaId.value);
    }
    if (recintoId.present) {
      map['recinto_id'] = Variable<String>(recintoId.value);
    }
    if (dignidad.present) {
      map['dignidad'] = Variable<String>(dignidad.value);
    }
    if (totalSufragantes.present) {
      map['total_sufragantes'] = Variable<int>(totalSufragantes.value);
    }
    if (votosNulos.present) {
      map['votos_nulos'] = Variable<int>(votosNulos.value);
    }
    if (votosBlancos.present) {
      map['votos_blancos'] = Variable<int>(votosBlancos.value);
    }
    if (fotoLocalPath.present) {
      map['foto_local_path'] = Variable<String>(fotoLocalPath.value);
    }
    if (fotoFileId.present) {
      map['foto_file_id'] = Variable<String>(fotoFileId.value);
    }
    if (gpsLat.present) {
      map['gps_lat'] = Variable<double>(gpsLat.value);
    }
    if (gpsLng.present) {
      map['gps_lng'] = Variable<double>(gpsLng.value);
    }
    if (gpsAccuracy.present) {
      map['gps_accuracy'] = Variable<double>(gpsAccuracy.value);
    }
    if (registradoPor.present) {
      map['registrado_por'] = Variable<String>(registradoPor.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalActasCompanion(')
          ..write('id: $id, ')
          ..write('mesaId: $mesaId, ')
          ..write('recintoId: $recintoId, ')
          ..write('dignidad: $dignidad, ')
          ..write('totalSufragantes: $totalSufragantes, ')
          ..write('votosNulos: $votosNulos, ')
          ..write('votosBlancos: $votosBlancos, ')
          ..write('fotoLocalPath: $fotoLocalPath, ')
          ..write('fotoFileId: $fotoFileId, ')
          ..write('gpsLat: $gpsLat, ')
          ..write('gpsLng: $gpsLng, ')
          ..write('gpsAccuracy: $gpsAccuracy, ')
          ..write('registradoPor: $registradoPor, ')
          ..write('sincronizado: $sincronizado, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalActaVotosTable extends LocalActaVotos
    with TableInfo<$LocalActaVotosTable, LocalActaVoto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalActaVotosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actaIdMeta = const VerificationMeta('actaId');
  @override
  late final GeneratedColumn<String> actaId = GeneratedColumn<String>(
    'acta_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _organizacionIdMeta = const VerificationMeta(
    'organizacionId',
  );
  @override
  late final GeneratedColumn<String> organizacionId = GeneratedColumn<String>(
    'organizacion_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _votosMeta = const VerificationMeta('votos');
  @override
  late final GeneratedColumn<int> votos = GeneratedColumn<int>(
    'votos',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, actaId, organizacionId, votos];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_acta_votos';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalActaVoto> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('acta_id')) {
      context.handle(
        _actaIdMeta,
        actaId.isAcceptableOrUnknown(data['acta_id']!, _actaIdMeta),
      );
    } else if (isInserting) {
      context.missing(_actaIdMeta);
    }
    if (data.containsKey('organizacion_id')) {
      context.handle(
        _organizacionIdMeta,
        organizacionId.isAcceptableOrUnknown(
          data['organizacion_id']!,
          _organizacionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_organizacionIdMeta);
    }
    if (data.containsKey('votos')) {
      context.handle(
        _votosMeta,
        votos.isAcceptableOrUnknown(data['votos']!, _votosMeta),
      );
    } else if (isInserting) {
      context.missing(_votosMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalActaVoto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalActaVoto(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      actaId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}acta_id'],
      )!,
      organizacionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}organizacion_id'],
      )!,
      votos: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}votos'],
      )!,
    );
  }

  @override
  $LocalActaVotosTable createAlias(String alias) {
    return $LocalActaVotosTable(attachedDatabase, alias);
  }
}

class LocalActaVoto extends DataClass implements Insertable<LocalActaVoto> {
  final String id;
  final String actaId;
  final String organizacionId;
  final int votos;
  const LocalActaVoto({
    required this.id,
    required this.actaId,
    required this.organizacionId,
    required this.votos,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['acta_id'] = Variable<String>(actaId);
    map['organizacion_id'] = Variable<String>(organizacionId);
    map['votos'] = Variable<int>(votos);
    return map;
  }

  LocalActaVotosCompanion toCompanion(bool nullToAbsent) {
    return LocalActaVotosCompanion(
      id: Value(id),
      actaId: Value(actaId),
      organizacionId: Value(organizacionId),
      votos: Value(votos),
    );
  }

  factory LocalActaVoto.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalActaVoto(
      id: serializer.fromJson<String>(json['id']),
      actaId: serializer.fromJson<String>(json['actaId']),
      organizacionId: serializer.fromJson<String>(json['organizacionId']),
      votos: serializer.fromJson<int>(json['votos']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'actaId': serializer.toJson<String>(actaId),
      'organizacionId': serializer.toJson<String>(organizacionId),
      'votos': serializer.toJson<int>(votos),
    };
  }

  LocalActaVoto copyWith({
    String? id,
    String? actaId,
    String? organizacionId,
    int? votos,
  }) => LocalActaVoto(
    id: id ?? this.id,
    actaId: actaId ?? this.actaId,
    organizacionId: organizacionId ?? this.organizacionId,
    votos: votos ?? this.votos,
  );
  LocalActaVoto copyWithCompanion(LocalActaVotosCompanion data) {
    return LocalActaVoto(
      id: data.id.present ? data.id.value : this.id,
      actaId: data.actaId.present ? data.actaId.value : this.actaId,
      organizacionId: data.organizacionId.present
          ? data.organizacionId.value
          : this.organizacionId,
      votos: data.votos.present ? data.votos.value : this.votos,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalActaVoto(')
          ..write('id: $id, ')
          ..write('actaId: $actaId, ')
          ..write('organizacionId: $organizacionId, ')
          ..write('votos: $votos')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, actaId, organizacionId, votos);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalActaVoto &&
          other.id == this.id &&
          other.actaId == this.actaId &&
          other.organizacionId == this.organizacionId &&
          other.votos == this.votos);
}

class LocalActaVotosCompanion extends UpdateCompanion<LocalActaVoto> {
  final Value<String> id;
  final Value<String> actaId;
  final Value<String> organizacionId;
  final Value<int> votos;
  final Value<int> rowid;
  const LocalActaVotosCompanion({
    this.id = const Value.absent(),
    this.actaId = const Value.absent(),
    this.organizacionId = const Value.absent(),
    this.votos = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalActaVotosCompanion.insert({
    required String id,
    required String actaId,
    required String organizacionId,
    required int votos,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       actaId = Value(actaId),
       organizacionId = Value(organizacionId),
       votos = Value(votos);
  static Insertable<LocalActaVoto> custom({
    Expression<String>? id,
    Expression<String>? actaId,
    Expression<String>? organizacionId,
    Expression<int>? votos,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (actaId != null) 'acta_id': actaId,
      if (organizacionId != null) 'organizacion_id': organizacionId,
      if (votos != null) 'votos': votos,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalActaVotosCompanion copyWith({
    Value<String>? id,
    Value<String>? actaId,
    Value<String>? organizacionId,
    Value<int>? votos,
    Value<int>? rowid,
  }) {
    return LocalActaVotosCompanion(
      id: id ?? this.id,
      actaId: actaId ?? this.actaId,
      organizacionId: organizacionId ?? this.organizacionId,
      votos: votos ?? this.votos,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (actaId.present) {
      map['acta_id'] = Variable<String>(actaId.value);
    }
    if (organizacionId.present) {
      map['organizacion_id'] = Variable<String>(organizacionId.value);
    }
    if (votos.present) {
      map['votos'] = Variable<int>(votos.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalActaVotosCompanion(')
          ..write('id: $id, ')
          ..write('actaId: $actaId, ')
          ..write('organizacionId: $organizacionId, ')
          ..write('votos: $votos, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LocalActasTable localActas = $LocalActasTable(this);
  late final $LocalActaVotosTable localActaVotos = $LocalActaVotosTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    localActas,
    localActaVotos,
  ];
}

typedef $$LocalActasTableCreateCompanionBuilder =
    LocalActasCompanion Function({
      required String id,
      required String mesaId,
      required String recintoId,
      required String dignidad,
      required int totalSufragantes,
      required int votosNulos,
      required int votosBlancos,
      Value<String?> fotoLocalPath,
      Value<String?> fotoFileId,
      Value<double?> gpsLat,
      Value<double?> gpsLng,
      Value<double?> gpsAccuracy,
      required String registradoPor,
      Value<bool> sincronizado,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$LocalActasTableUpdateCompanionBuilder =
    LocalActasCompanion Function({
      Value<String> id,
      Value<String> mesaId,
      Value<String> recintoId,
      Value<String> dignidad,
      Value<int> totalSufragantes,
      Value<int> votosNulos,
      Value<int> votosBlancos,
      Value<String?> fotoLocalPath,
      Value<String?> fotoFileId,
      Value<double?> gpsLat,
      Value<double?> gpsLng,
      Value<double?> gpsAccuracy,
      Value<String> registradoPor,
      Value<bool> sincronizado,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$LocalActasTableFilterComposer
    extends Composer<_$AppDatabase, $LocalActasTable> {
  $$LocalActasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mesaId => $composableBuilder(
    column: $table.mesaId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recintoId => $composableBuilder(
    column: $table.recintoId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dignidad => $composableBuilder(
    column: $table.dignidad,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalSufragantes => $composableBuilder(
    column: $table.totalSufragantes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get votosNulos => $composableBuilder(
    column: $table.votosNulos,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get votosBlancos => $composableBuilder(
    column: $table.votosBlancos,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fotoLocalPath => $composableBuilder(
    column: $table.fotoLocalPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fotoFileId => $composableBuilder(
    column: $table.fotoFileId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get gpsLat => $composableBuilder(
    column: $table.gpsLat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get gpsLng => $composableBuilder(
    column: $table.gpsLng,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get gpsAccuracy => $composableBuilder(
    column: $table.gpsAccuracy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get registradoPor => $composableBuilder(
    column: $table.registradoPor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocalActasTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalActasTable> {
  $$LocalActasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mesaId => $composableBuilder(
    column: $table.mesaId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recintoId => $composableBuilder(
    column: $table.recintoId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dignidad => $composableBuilder(
    column: $table.dignidad,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalSufragantes => $composableBuilder(
    column: $table.totalSufragantes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get votosNulos => $composableBuilder(
    column: $table.votosNulos,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get votosBlancos => $composableBuilder(
    column: $table.votosBlancos,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fotoLocalPath => $composableBuilder(
    column: $table.fotoLocalPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fotoFileId => $composableBuilder(
    column: $table.fotoFileId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get gpsLat => $composableBuilder(
    column: $table.gpsLat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get gpsLng => $composableBuilder(
    column: $table.gpsLng,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get gpsAccuracy => $composableBuilder(
    column: $table.gpsAccuracy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get registradoPor => $composableBuilder(
    column: $table.registradoPor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalActasTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalActasTable> {
  $$LocalActasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get mesaId =>
      $composableBuilder(column: $table.mesaId, builder: (column) => column);

  GeneratedColumn<String> get recintoId =>
      $composableBuilder(column: $table.recintoId, builder: (column) => column);

  GeneratedColumn<String> get dignidad =>
      $composableBuilder(column: $table.dignidad, builder: (column) => column);

  GeneratedColumn<int> get totalSufragantes => $composableBuilder(
    column: $table.totalSufragantes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get votosNulos => $composableBuilder(
    column: $table.votosNulos,
    builder: (column) => column,
  );

  GeneratedColumn<int> get votosBlancos => $composableBuilder(
    column: $table.votosBlancos,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fotoLocalPath => $composableBuilder(
    column: $table.fotoLocalPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fotoFileId => $composableBuilder(
    column: $table.fotoFileId,
    builder: (column) => column,
  );

  GeneratedColumn<double> get gpsLat =>
      $composableBuilder(column: $table.gpsLat, builder: (column) => column);

  GeneratedColumn<double> get gpsLng =>
      $composableBuilder(column: $table.gpsLng, builder: (column) => column);

  GeneratedColumn<double> get gpsAccuracy => $composableBuilder(
    column: $table.gpsAccuracy,
    builder: (column) => column,
  );

  GeneratedColumn<String> get registradoPor => $composableBuilder(
    column: $table.registradoPor,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$LocalActasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalActasTable,
          LocalActa,
          $$LocalActasTableFilterComposer,
          $$LocalActasTableOrderingComposer,
          $$LocalActasTableAnnotationComposer,
          $$LocalActasTableCreateCompanionBuilder,
          $$LocalActasTableUpdateCompanionBuilder,
          (
            LocalActa,
            BaseReferences<_$AppDatabase, $LocalActasTable, LocalActa>,
          ),
          LocalActa,
          PrefetchHooks Function()
        > {
  $$LocalActasTableTableManager(_$AppDatabase db, $LocalActasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalActasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalActasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalActasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> mesaId = const Value.absent(),
                Value<String> recintoId = const Value.absent(),
                Value<String> dignidad = const Value.absent(),
                Value<int> totalSufragantes = const Value.absent(),
                Value<int> votosNulos = const Value.absent(),
                Value<int> votosBlancos = const Value.absent(),
                Value<String?> fotoLocalPath = const Value.absent(),
                Value<String?> fotoFileId = const Value.absent(),
                Value<double?> gpsLat = const Value.absent(),
                Value<double?> gpsLng = const Value.absent(),
                Value<double?> gpsAccuracy = const Value.absent(),
                Value<String> registradoPor = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalActasCompanion(
                id: id,
                mesaId: mesaId,
                recintoId: recintoId,
                dignidad: dignidad,
                totalSufragantes: totalSufragantes,
                votosNulos: votosNulos,
                votosBlancos: votosBlancos,
                fotoLocalPath: fotoLocalPath,
                fotoFileId: fotoFileId,
                gpsLat: gpsLat,
                gpsLng: gpsLng,
                gpsAccuracy: gpsAccuracy,
                registradoPor: registradoPor,
                sincronizado: sincronizado,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String mesaId,
                required String recintoId,
                required String dignidad,
                required int totalSufragantes,
                required int votosNulos,
                required int votosBlancos,
                Value<String?> fotoLocalPath = const Value.absent(),
                Value<String?> fotoFileId = const Value.absent(),
                Value<double?> gpsLat = const Value.absent(),
                Value<double?> gpsLng = const Value.absent(),
                Value<double?> gpsAccuracy = const Value.absent(),
                required String registradoPor,
                Value<bool> sincronizado = const Value.absent(),
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => LocalActasCompanion.insert(
                id: id,
                mesaId: mesaId,
                recintoId: recintoId,
                dignidad: dignidad,
                totalSufragantes: totalSufragantes,
                votosNulos: votosNulos,
                votosBlancos: votosBlancos,
                fotoLocalPath: fotoLocalPath,
                fotoFileId: fotoFileId,
                gpsLat: gpsLat,
                gpsLng: gpsLng,
                gpsAccuracy: gpsAccuracy,
                registradoPor: registradoPor,
                sincronizado: sincronizado,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocalActasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalActasTable,
      LocalActa,
      $$LocalActasTableFilterComposer,
      $$LocalActasTableOrderingComposer,
      $$LocalActasTableAnnotationComposer,
      $$LocalActasTableCreateCompanionBuilder,
      $$LocalActasTableUpdateCompanionBuilder,
      (LocalActa, BaseReferences<_$AppDatabase, $LocalActasTable, LocalActa>),
      LocalActa,
      PrefetchHooks Function()
    >;
typedef $$LocalActaVotosTableCreateCompanionBuilder =
    LocalActaVotosCompanion Function({
      required String id,
      required String actaId,
      required String organizacionId,
      required int votos,
      Value<int> rowid,
    });
typedef $$LocalActaVotosTableUpdateCompanionBuilder =
    LocalActaVotosCompanion Function({
      Value<String> id,
      Value<String> actaId,
      Value<String> organizacionId,
      Value<int> votos,
      Value<int> rowid,
    });

class $$LocalActaVotosTableFilterComposer
    extends Composer<_$AppDatabase, $LocalActaVotosTable> {
  $$LocalActaVotosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get actaId => $composableBuilder(
    column: $table.actaId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get organizacionId => $composableBuilder(
    column: $table.organizacionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get votos => $composableBuilder(
    column: $table.votos,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocalActaVotosTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalActaVotosTable> {
  $$LocalActaVotosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get actaId => $composableBuilder(
    column: $table.actaId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get organizacionId => $composableBuilder(
    column: $table.organizacionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get votos => $composableBuilder(
    column: $table.votos,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalActaVotosTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalActaVotosTable> {
  $$LocalActaVotosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get actaId =>
      $composableBuilder(column: $table.actaId, builder: (column) => column);

  GeneratedColumn<String> get organizacionId => $composableBuilder(
    column: $table.organizacionId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get votos =>
      $composableBuilder(column: $table.votos, builder: (column) => column);
}

class $$LocalActaVotosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalActaVotosTable,
          LocalActaVoto,
          $$LocalActaVotosTableFilterComposer,
          $$LocalActaVotosTableOrderingComposer,
          $$LocalActaVotosTableAnnotationComposer,
          $$LocalActaVotosTableCreateCompanionBuilder,
          $$LocalActaVotosTableUpdateCompanionBuilder,
          (
            LocalActaVoto,
            BaseReferences<_$AppDatabase, $LocalActaVotosTable, LocalActaVoto>,
          ),
          LocalActaVoto,
          PrefetchHooks Function()
        > {
  $$LocalActaVotosTableTableManager(
    _$AppDatabase db,
    $LocalActaVotosTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalActaVotosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalActaVotosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalActaVotosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> actaId = const Value.absent(),
                Value<String> organizacionId = const Value.absent(),
                Value<int> votos = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalActaVotosCompanion(
                id: id,
                actaId: actaId,
                organizacionId: organizacionId,
                votos: votos,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String actaId,
                required String organizacionId,
                required int votos,
                Value<int> rowid = const Value.absent(),
              }) => LocalActaVotosCompanion.insert(
                id: id,
                actaId: actaId,
                organizacionId: organizacionId,
                votos: votos,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocalActaVotosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalActaVotosTable,
      LocalActaVoto,
      $$LocalActaVotosTableFilterComposer,
      $$LocalActaVotosTableOrderingComposer,
      $$LocalActaVotosTableAnnotationComposer,
      $$LocalActaVotosTableCreateCompanionBuilder,
      $$LocalActaVotosTableUpdateCompanionBuilder,
      (
        LocalActaVoto,
        BaseReferences<_$AppDatabase, $LocalActaVotosTable, LocalActaVoto>,
      ),
      LocalActaVoto,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LocalActasTableTableManager get localActas =>
      $$LocalActasTableTableManager(_db, _db.localActas);
  $$LocalActaVotosTableTableManager get localActaVotos =>
      $$LocalActaVotosTableTableManager(_db, _db.localActaVotos);
}
