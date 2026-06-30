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
  static const VerificationMeta _totalSufragantesLetrasMeta =
      const VerificationMeta('totalSufragantesLetras');
  @override
  late final GeneratedColumn<String> totalSufragantesLetras =
      GeneratedColumn<String>(
        'total_sufragantes_letras',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant(''),
      );
  static const VerificationMeta _totalSufragantesCentenaMeta =
      const VerificationMeta('totalSufragantesCentena');
  @override
  late final GeneratedColumn<int> totalSufragantesCentena =
      GeneratedColumn<int>(
        'total_sufragantes_centena',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      );
  static const VerificationMeta _totalSufragantesDecenaMeta =
      const VerificationMeta('totalSufragantesDecena');
  @override
  late final GeneratedColumn<int> totalSufragantesDecena = GeneratedColumn<int>(
    'total_sufragantes_decena',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalSufragantesUnidadMeta =
      const VerificationMeta('totalSufragantesUnidad');
  @override
  late final GeneratedColumn<int> totalSufragantesUnidad = GeneratedColumn<int>(
    'total_sufragantes_unidad',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _votosBlancosLetrasMeta =
      const VerificationMeta('votosBlancosLetras');
  @override
  late final GeneratedColumn<String> votosBlancosLetras =
      GeneratedColumn<String>(
        'votos_blancos_letras',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant(''),
      );
  static const VerificationMeta _votosBlancosCentenaMeta =
      const VerificationMeta('votosBlancosCentena');
  @override
  late final GeneratedColumn<int> votosBlancosCentena = GeneratedColumn<int>(
    'votos_blancos_centena',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _votosBlancosDecenaMeta =
      const VerificationMeta('votosBlancosDecena');
  @override
  late final GeneratedColumn<int> votosBlancosDecena = GeneratedColumn<int>(
    'votos_blancos_decena',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _votosBlancosUnidadMeta =
      const VerificationMeta('votosBlancosUnidad');
  @override
  late final GeneratedColumn<int> votosBlancosUnidad = GeneratedColumn<int>(
    'votos_blancos_unidad',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _votosNulosLetrasMeta = const VerificationMeta(
    'votosNulosLetras',
  );
  @override
  late final GeneratedColumn<String> votosNulosLetras = GeneratedColumn<String>(
    'votos_nulos_letras',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _votosNulosCentenaMeta = const VerificationMeta(
    'votosNulosCentena',
  );
  @override
  late final GeneratedColumn<int> votosNulosCentena = GeneratedColumn<int>(
    'votos_nulos_centena',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _votosNulosDecenaMeta = const VerificationMeta(
    'votosNulosDecena',
  );
  @override
  late final GeneratedColumn<int> votosNulosDecena = GeneratedColumn<int>(
    'votos_nulos_decena',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _votosNulosUnidadMeta = const VerificationMeta(
    'votosNulosUnidad',
  );
  @override
  late final GeneratedColumn<int> votosNulosUnidad = GeneratedColumn<int>(
    'votos_nulos_unidad',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
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
    totalSufragantesLetras,
    totalSufragantesCentena,
    totalSufragantesDecena,
    totalSufragantesUnidad,
    votosBlancosLetras,
    votosBlancosCentena,
    votosBlancosDecena,
    votosBlancosUnidad,
    votosNulosLetras,
    votosNulosCentena,
    votosNulosDecena,
    votosNulosUnidad,
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
    if (data.containsKey('total_sufragantes_letras')) {
      context.handle(
        _totalSufragantesLetrasMeta,
        totalSufragantesLetras.isAcceptableOrUnknown(
          data['total_sufragantes_letras']!,
          _totalSufragantesLetrasMeta,
        ),
      );
    }
    if (data.containsKey('total_sufragantes_centena')) {
      context.handle(
        _totalSufragantesCentenaMeta,
        totalSufragantesCentena.isAcceptableOrUnknown(
          data['total_sufragantes_centena']!,
          _totalSufragantesCentenaMeta,
        ),
      );
    }
    if (data.containsKey('total_sufragantes_decena')) {
      context.handle(
        _totalSufragantesDecenaMeta,
        totalSufragantesDecena.isAcceptableOrUnknown(
          data['total_sufragantes_decena']!,
          _totalSufragantesDecenaMeta,
        ),
      );
    }
    if (data.containsKey('total_sufragantes_unidad')) {
      context.handle(
        _totalSufragantesUnidadMeta,
        totalSufragantesUnidad.isAcceptableOrUnknown(
          data['total_sufragantes_unidad']!,
          _totalSufragantesUnidadMeta,
        ),
      );
    }
    if (data.containsKey('votos_blancos_letras')) {
      context.handle(
        _votosBlancosLetrasMeta,
        votosBlancosLetras.isAcceptableOrUnknown(
          data['votos_blancos_letras']!,
          _votosBlancosLetrasMeta,
        ),
      );
    }
    if (data.containsKey('votos_blancos_centena')) {
      context.handle(
        _votosBlancosCentenaMeta,
        votosBlancosCentena.isAcceptableOrUnknown(
          data['votos_blancos_centena']!,
          _votosBlancosCentenaMeta,
        ),
      );
    }
    if (data.containsKey('votos_blancos_decena')) {
      context.handle(
        _votosBlancosDecenaMeta,
        votosBlancosDecena.isAcceptableOrUnknown(
          data['votos_blancos_decena']!,
          _votosBlancosDecenaMeta,
        ),
      );
    }
    if (data.containsKey('votos_blancos_unidad')) {
      context.handle(
        _votosBlancosUnidadMeta,
        votosBlancosUnidad.isAcceptableOrUnknown(
          data['votos_blancos_unidad']!,
          _votosBlancosUnidadMeta,
        ),
      );
    }
    if (data.containsKey('votos_nulos_letras')) {
      context.handle(
        _votosNulosLetrasMeta,
        votosNulosLetras.isAcceptableOrUnknown(
          data['votos_nulos_letras']!,
          _votosNulosLetrasMeta,
        ),
      );
    }
    if (data.containsKey('votos_nulos_centena')) {
      context.handle(
        _votosNulosCentenaMeta,
        votosNulosCentena.isAcceptableOrUnknown(
          data['votos_nulos_centena']!,
          _votosNulosCentenaMeta,
        ),
      );
    }
    if (data.containsKey('votos_nulos_decena')) {
      context.handle(
        _votosNulosDecenaMeta,
        votosNulosDecena.isAcceptableOrUnknown(
          data['votos_nulos_decena']!,
          _votosNulosDecenaMeta,
        ),
      );
    }
    if (data.containsKey('votos_nulos_unidad')) {
      context.handle(
        _votosNulosUnidadMeta,
        votosNulosUnidad.isAcceptableOrUnknown(
          data['votos_nulos_unidad']!,
          _votosNulosUnidadMeta,
        ),
      );
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
      totalSufragantesLetras: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}total_sufragantes_letras'],
      )!,
      totalSufragantesCentena: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_sufragantes_centena'],
      )!,
      totalSufragantesDecena: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_sufragantes_decena'],
      )!,
      totalSufragantesUnidad: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_sufragantes_unidad'],
      )!,
      votosBlancosLetras: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}votos_blancos_letras'],
      )!,
      votosBlancosCentena: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}votos_blancos_centena'],
      )!,
      votosBlancosDecena: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}votos_blancos_decena'],
      )!,
      votosBlancosUnidad: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}votos_blancos_unidad'],
      )!,
      votosNulosLetras: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}votos_nulos_letras'],
      )!,
      votosNulosCentena: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}votos_nulos_centena'],
      )!,
      votosNulosDecena: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}votos_nulos_decena'],
      )!,
      votosNulosUnidad: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}votos_nulos_unidad'],
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
  final String totalSufragantesLetras;
  final int totalSufragantesCentena;
  final int totalSufragantesDecena;
  final int totalSufragantesUnidad;
  final String votosBlancosLetras;
  final int votosBlancosCentena;
  final int votosBlancosDecena;
  final int votosBlancosUnidad;
  final String votosNulosLetras;
  final int votosNulosCentena;
  final int votosNulosDecena;
  final int votosNulosUnidad;
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
    required this.totalSufragantesLetras,
    required this.totalSufragantesCentena,
    required this.totalSufragantesDecena,
    required this.totalSufragantesUnidad,
    required this.votosBlancosLetras,
    required this.votosBlancosCentena,
    required this.votosBlancosDecena,
    required this.votosBlancosUnidad,
    required this.votosNulosLetras,
    required this.votosNulosCentena,
    required this.votosNulosDecena,
    required this.votosNulosUnidad,
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
    map['total_sufragantes_letras'] = Variable<String>(totalSufragantesLetras);
    map['total_sufragantes_centena'] = Variable<int>(totalSufragantesCentena);
    map['total_sufragantes_decena'] = Variable<int>(totalSufragantesDecena);
    map['total_sufragantes_unidad'] = Variable<int>(totalSufragantesUnidad);
    map['votos_blancos_letras'] = Variable<String>(votosBlancosLetras);
    map['votos_blancos_centena'] = Variable<int>(votosBlancosCentena);
    map['votos_blancos_decena'] = Variable<int>(votosBlancosDecena);
    map['votos_blancos_unidad'] = Variable<int>(votosBlancosUnidad);
    map['votos_nulos_letras'] = Variable<String>(votosNulosLetras);
    map['votos_nulos_centena'] = Variable<int>(votosNulosCentena);
    map['votos_nulos_decena'] = Variable<int>(votosNulosDecena);
    map['votos_nulos_unidad'] = Variable<int>(votosNulosUnidad);
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
      totalSufragantesLetras: Value(totalSufragantesLetras),
      totalSufragantesCentena: Value(totalSufragantesCentena),
      totalSufragantesDecena: Value(totalSufragantesDecena),
      totalSufragantesUnidad: Value(totalSufragantesUnidad),
      votosBlancosLetras: Value(votosBlancosLetras),
      votosBlancosCentena: Value(votosBlancosCentena),
      votosBlancosDecena: Value(votosBlancosDecena),
      votosBlancosUnidad: Value(votosBlancosUnidad),
      votosNulosLetras: Value(votosNulosLetras),
      votosNulosCentena: Value(votosNulosCentena),
      votosNulosDecena: Value(votosNulosDecena),
      votosNulosUnidad: Value(votosNulosUnidad),
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
      totalSufragantesLetras: serializer.fromJson<String>(
        json['totalSufragantesLetras'],
      ),
      totalSufragantesCentena: serializer.fromJson<int>(
        json['totalSufragantesCentena'],
      ),
      totalSufragantesDecena: serializer.fromJson<int>(
        json['totalSufragantesDecena'],
      ),
      totalSufragantesUnidad: serializer.fromJson<int>(
        json['totalSufragantesUnidad'],
      ),
      votosBlancosLetras: serializer.fromJson<String>(
        json['votosBlancosLetras'],
      ),
      votosBlancosCentena: serializer.fromJson<int>(
        json['votosBlancosCentena'],
      ),
      votosBlancosDecena: serializer.fromJson<int>(json['votosBlancosDecena']),
      votosBlancosUnidad: serializer.fromJson<int>(json['votosBlancosUnidad']),
      votosNulosLetras: serializer.fromJson<String>(json['votosNulosLetras']),
      votosNulosCentena: serializer.fromJson<int>(json['votosNulosCentena']),
      votosNulosDecena: serializer.fromJson<int>(json['votosNulosDecena']),
      votosNulosUnidad: serializer.fromJson<int>(json['votosNulosUnidad']),
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
      'totalSufragantesLetras': serializer.toJson<String>(
        totalSufragantesLetras,
      ),
      'totalSufragantesCentena': serializer.toJson<int>(
        totalSufragantesCentena,
      ),
      'totalSufragantesDecena': serializer.toJson<int>(totalSufragantesDecena),
      'totalSufragantesUnidad': serializer.toJson<int>(totalSufragantesUnidad),
      'votosBlancosLetras': serializer.toJson<String>(votosBlancosLetras),
      'votosBlancosCentena': serializer.toJson<int>(votosBlancosCentena),
      'votosBlancosDecena': serializer.toJson<int>(votosBlancosDecena),
      'votosBlancosUnidad': serializer.toJson<int>(votosBlancosUnidad),
      'votosNulosLetras': serializer.toJson<String>(votosNulosLetras),
      'votosNulosCentena': serializer.toJson<int>(votosNulosCentena),
      'votosNulosDecena': serializer.toJson<int>(votosNulosDecena),
      'votosNulosUnidad': serializer.toJson<int>(votosNulosUnidad),
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
    String? totalSufragantesLetras,
    int? totalSufragantesCentena,
    int? totalSufragantesDecena,
    int? totalSufragantesUnidad,
    String? votosBlancosLetras,
    int? votosBlancosCentena,
    int? votosBlancosDecena,
    int? votosBlancosUnidad,
    String? votosNulosLetras,
    int? votosNulosCentena,
    int? votosNulosDecena,
    int? votosNulosUnidad,
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
    totalSufragantesLetras:
        totalSufragantesLetras ?? this.totalSufragantesLetras,
    totalSufragantesCentena:
        totalSufragantesCentena ?? this.totalSufragantesCentena,
    totalSufragantesDecena:
        totalSufragantesDecena ?? this.totalSufragantesDecena,
    totalSufragantesUnidad:
        totalSufragantesUnidad ?? this.totalSufragantesUnidad,
    votosBlancosLetras: votosBlancosLetras ?? this.votosBlancosLetras,
    votosBlancosCentena: votosBlancosCentena ?? this.votosBlancosCentena,
    votosBlancosDecena: votosBlancosDecena ?? this.votosBlancosDecena,
    votosBlancosUnidad: votosBlancosUnidad ?? this.votosBlancosUnidad,
    votosNulosLetras: votosNulosLetras ?? this.votosNulosLetras,
    votosNulosCentena: votosNulosCentena ?? this.votosNulosCentena,
    votosNulosDecena: votosNulosDecena ?? this.votosNulosDecena,
    votosNulosUnidad: votosNulosUnidad ?? this.votosNulosUnidad,
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
      totalSufragantesLetras: data.totalSufragantesLetras.present
          ? data.totalSufragantesLetras.value
          : this.totalSufragantesLetras,
      totalSufragantesCentena: data.totalSufragantesCentena.present
          ? data.totalSufragantesCentena.value
          : this.totalSufragantesCentena,
      totalSufragantesDecena: data.totalSufragantesDecena.present
          ? data.totalSufragantesDecena.value
          : this.totalSufragantesDecena,
      totalSufragantesUnidad: data.totalSufragantesUnidad.present
          ? data.totalSufragantesUnidad.value
          : this.totalSufragantesUnidad,
      votosBlancosLetras: data.votosBlancosLetras.present
          ? data.votosBlancosLetras.value
          : this.votosBlancosLetras,
      votosBlancosCentena: data.votosBlancosCentena.present
          ? data.votosBlancosCentena.value
          : this.votosBlancosCentena,
      votosBlancosDecena: data.votosBlancosDecena.present
          ? data.votosBlancosDecena.value
          : this.votosBlancosDecena,
      votosBlancosUnidad: data.votosBlancosUnidad.present
          ? data.votosBlancosUnidad.value
          : this.votosBlancosUnidad,
      votosNulosLetras: data.votosNulosLetras.present
          ? data.votosNulosLetras.value
          : this.votosNulosLetras,
      votosNulosCentena: data.votosNulosCentena.present
          ? data.votosNulosCentena.value
          : this.votosNulosCentena,
      votosNulosDecena: data.votosNulosDecena.present
          ? data.votosNulosDecena.value
          : this.votosNulosDecena,
      votosNulosUnidad: data.votosNulosUnidad.present
          ? data.votosNulosUnidad.value
          : this.votosNulosUnidad,
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
          ..write('totalSufragantesLetras: $totalSufragantesLetras, ')
          ..write('totalSufragantesCentena: $totalSufragantesCentena, ')
          ..write('totalSufragantesDecena: $totalSufragantesDecena, ')
          ..write('totalSufragantesUnidad: $totalSufragantesUnidad, ')
          ..write('votosBlancosLetras: $votosBlancosLetras, ')
          ..write('votosBlancosCentena: $votosBlancosCentena, ')
          ..write('votosBlancosDecena: $votosBlancosDecena, ')
          ..write('votosBlancosUnidad: $votosBlancosUnidad, ')
          ..write('votosNulosLetras: $votosNulosLetras, ')
          ..write('votosNulosCentena: $votosNulosCentena, ')
          ..write('votosNulosDecena: $votosNulosDecena, ')
          ..write('votosNulosUnidad: $votosNulosUnidad, ')
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
  int get hashCode => Object.hashAll([
    id,
    mesaId,
    recintoId,
    dignidad,
    totalSufragantesLetras,
    totalSufragantesCentena,
    totalSufragantesDecena,
    totalSufragantesUnidad,
    votosBlancosLetras,
    votosBlancosCentena,
    votosBlancosDecena,
    votosBlancosUnidad,
    votosNulosLetras,
    votosNulosCentena,
    votosNulosDecena,
    votosNulosUnidad,
    fotoLocalPath,
    fotoFileId,
    gpsLat,
    gpsLng,
    gpsAccuracy,
    registradoPor,
    sincronizado,
    updatedAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalActa &&
          other.id == this.id &&
          other.mesaId == this.mesaId &&
          other.recintoId == this.recintoId &&
          other.dignidad == this.dignidad &&
          other.totalSufragantesLetras == this.totalSufragantesLetras &&
          other.totalSufragantesCentena == this.totalSufragantesCentena &&
          other.totalSufragantesDecena == this.totalSufragantesDecena &&
          other.totalSufragantesUnidad == this.totalSufragantesUnidad &&
          other.votosBlancosLetras == this.votosBlancosLetras &&
          other.votosBlancosCentena == this.votosBlancosCentena &&
          other.votosBlancosDecena == this.votosBlancosDecena &&
          other.votosBlancosUnidad == this.votosBlancosUnidad &&
          other.votosNulosLetras == this.votosNulosLetras &&
          other.votosNulosCentena == this.votosNulosCentena &&
          other.votosNulosDecena == this.votosNulosDecena &&
          other.votosNulosUnidad == this.votosNulosUnidad &&
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
  final Value<String> totalSufragantesLetras;
  final Value<int> totalSufragantesCentena;
  final Value<int> totalSufragantesDecena;
  final Value<int> totalSufragantesUnidad;
  final Value<String> votosBlancosLetras;
  final Value<int> votosBlancosCentena;
  final Value<int> votosBlancosDecena;
  final Value<int> votosBlancosUnidad;
  final Value<String> votosNulosLetras;
  final Value<int> votosNulosCentena;
  final Value<int> votosNulosDecena;
  final Value<int> votosNulosUnidad;
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
    this.totalSufragantesLetras = const Value.absent(),
    this.totalSufragantesCentena = const Value.absent(),
    this.totalSufragantesDecena = const Value.absent(),
    this.totalSufragantesUnidad = const Value.absent(),
    this.votosBlancosLetras = const Value.absent(),
    this.votosBlancosCentena = const Value.absent(),
    this.votosBlancosDecena = const Value.absent(),
    this.votosBlancosUnidad = const Value.absent(),
    this.votosNulosLetras = const Value.absent(),
    this.votosNulosCentena = const Value.absent(),
    this.votosNulosDecena = const Value.absent(),
    this.votosNulosUnidad = const Value.absent(),
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
    this.totalSufragantesLetras = const Value.absent(),
    this.totalSufragantesCentena = const Value.absent(),
    this.totalSufragantesDecena = const Value.absent(),
    this.totalSufragantesUnidad = const Value.absent(),
    this.votosBlancosLetras = const Value.absent(),
    this.votosBlancosCentena = const Value.absent(),
    this.votosBlancosDecena = const Value.absent(),
    this.votosBlancosUnidad = const Value.absent(),
    this.votosNulosLetras = const Value.absent(),
    this.votosNulosCentena = const Value.absent(),
    this.votosNulosDecena = const Value.absent(),
    this.votosNulosUnidad = const Value.absent(),
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
       registradoPor = Value(registradoPor),
       updatedAt = Value(updatedAt);
  static Insertable<LocalActa> custom({
    Expression<String>? id,
    Expression<String>? mesaId,
    Expression<String>? recintoId,
    Expression<String>? dignidad,
    Expression<String>? totalSufragantesLetras,
    Expression<int>? totalSufragantesCentena,
    Expression<int>? totalSufragantesDecena,
    Expression<int>? totalSufragantesUnidad,
    Expression<String>? votosBlancosLetras,
    Expression<int>? votosBlancosCentena,
    Expression<int>? votosBlancosDecena,
    Expression<int>? votosBlancosUnidad,
    Expression<String>? votosNulosLetras,
    Expression<int>? votosNulosCentena,
    Expression<int>? votosNulosDecena,
    Expression<int>? votosNulosUnidad,
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
      if (totalSufragantesLetras != null)
        'total_sufragantes_letras': totalSufragantesLetras,
      if (totalSufragantesCentena != null)
        'total_sufragantes_centena': totalSufragantesCentena,
      if (totalSufragantesDecena != null)
        'total_sufragantes_decena': totalSufragantesDecena,
      if (totalSufragantesUnidad != null)
        'total_sufragantes_unidad': totalSufragantesUnidad,
      if (votosBlancosLetras != null)
        'votos_blancos_letras': votosBlancosLetras,
      if (votosBlancosCentena != null)
        'votos_blancos_centena': votosBlancosCentena,
      if (votosBlancosDecena != null)
        'votos_blancos_decena': votosBlancosDecena,
      if (votosBlancosUnidad != null)
        'votos_blancos_unidad': votosBlancosUnidad,
      if (votosNulosLetras != null) 'votos_nulos_letras': votosNulosLetras,
      if (votosNulosCentena != null) 'votos_nulos_centena': votosNulosCentena,
      if (votosNulosDecena != null) 'votos_nulos_decena': votosNulosDecena,
      if (votosNulosUnidad != null) 'votos_nulos_unidad': votosNulosUnidad,
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
    Value<String>? totalSufragantesLetras,
    Value<int>? totalSufragantesCentena,
    Value<int>? totalSufragantesDecena,
    Value<int>? totalSufragantesUnidad,
    Value<String>? votosBlancosLetras,
    Value<int>? votosBlancosCentena,
    Value<int>? votosBlancosDecena,
    Value<int>? votosBlancosUnidad,
    Value<String>? votosNulosLetras,
    Value<int>? votosNulosCentena,
    Value<int>? votosNulosDecena,
    Value<int>? votosNulosUnidad,
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
      totalSufragantesLetras:
          totalSufragantesLetras ?? this.totalSufragantesLetras,
      totalSufragantesCentena:
          totalSufragantesCentena ?? this.totalSufragantesCentena,
      totalSufragantesDecena:
          totalSufragantesDecena ?? this.totalSufragantesDecena,
      totalSufragantesUnidad:
          totalSufragantesUnidad ?? this.totalSufragantesUnidad,
      votosBlancosLetras: votosBlancosLetras ?? this.votosBlancosLetras,
      votosBlancosCentena: votosBlancosCentena ?? this.votosBlancosCentena,
      votosBlancosDecena: votosBlancosDecena ?? this.votosBlancosDecena,
      votosBlancosUnidad: votosBlancosUnidad ?? this.votosBlancosUnidad,
      votosNulosLetras: votosNulosLetras ?? this.votosNulosLetras,
      votosNulosCentena: votosNulosCentena ?? this.votosNulosCentena,
      votosNulosDecena: votosNulosDecena ?? this.votosNulosDecena,
      votosNulosUnidad: votosNulosUnidad ?? this.votosNulosUnidad,
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
    if (totalSufragantesLetras.present) {
      map['total_sufragantes_letras'] = Variable<String>(
        totalSufragantesLetras.value,
      );
    }
    if (totalSufragantesCentena.present) {
      map['total_sufragantes_centena'] = Variable<int>(
        totalSufragantesCentena.value,
      );
    }
    if (totalSufragantesDecena.present) {
      map['total_sufragantes_decena'] = Variable<int>(
        totalSufragantesDecena.value,
      );
    }
    if (totalSufragantesUnidad.present) {
      map['total_sufragantes_unidad'] = Variable<int>(
        totalSufragantesUnidad.value,
      );
    }
    if (votosBlancosLetras.present) {
      map['votos_blancos_letras'] = Variable<String>(votosBlancosLetras.value);
    }
    if (votosBlancosCentena.present) {
      map['votos_blancos_centena'] = Variable<int>(votosBlancosCentena.value);
    }
    if (votosBlancosDecena.present) {
      map['votos_blancos_decena'] = Variable<int>(votosBlancosDecena.value);
    }
    if (votosBlancosUnidad.present) {
      map['votos_blancos_unidad'] = Variable<int>(votosBlancosUnidad.value);
    }
    if (votosNulosLetras.present) {
      map['votos_nulos_letras'] = Variable<String>(votosNulosLetras.value);
    }
    if (votosNulosCentena.present) {
      map['votos_nulos_centena'] = Variable<int>(votosNulosCentena.value);
    }
    if (votosNulosDecena.present) {
      map['votos_nulos_decena'] = Variable<int>(votosNulosDecena.value);
    }
    if (votosNulosUnidad.present) {
      map['votos_nulos_unidad'] = Variable<int>(votosNulosUnidad.value);
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
          ..write('totalSufragantesLetras: $totalSufragantesLetras, ')
          ..write('totalSufragantesCentena: $totalSufragantesCentena, ')
          ..write('totalSufragantesDecena: $totalSufragantesDecena, ')
          ..write('totalSufragantesUnidad: $totalSufragantesUnidad, ')
          ..write('votosBlancosLetras: $votosBlancosLetras, ')
          ..write('votosBlancosCentena: $votosBlancosCentena, ')
          ..write('votosBlancosDecena: $votosBlancosDecena, ')
          ..write('votosBlancosUnidad: $votosBlancosUnidad, ')
          ..write('votosNulosLetras: $votosNulosLetras, ')
          ..write('votosNulosCentena: $votosNulosCentena, ')
          ..write('votosNulosDecena: $votosNulosDecena, ')
          ..write('votosNulosUnidad: $votosNulosUnidad, ')
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
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _votosLetrasMeta = const VerificationMeta(
    'votosLetras',
  );
  @override
  late final GeneratedColumn<String> votosLetras = GeneratedColumn<String>(
    'votos_letras',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _votosCentenaMeta = const VerificationMeta(
    'votosCentena',
  );
  @override
  late final GeneratedColumn<int> votosCentena = GeneratedColumn<int>(
    'votos_centena',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _votosDecenaMeta = const VerificationMeta(
    'votosDecena',
  );
  @override
  late final GeneratedColumn<int> votosDecena = GeneratedColumn<int>(
    'votos_decena',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _votosUnidadMeta = const VerificationMeta(
    'votosUnidad',
  );
  @override
  late final GeneratedColumn<int> votosUnidad = GeneratedColumn<int>(
    'votos_unidad',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    actaId,
    organizacionId,
    votos,
    votosLetras,
    votosCentena,
    votosDecena,
    votosUnidad,
  ];
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
    }
    if (data.containsKey('votos_letras')) {
      context.handle(
        _votosLetrasMeta,
        votosLetras.isAcceptableOrUnknown(
          data['votos_letras']!,
          _votosLetrasMeta,
        ),
      );
    }
    if (data.containsKey('votos_centena')) {
      context.handle(
        _votosCentenaMeta,
        votosCentena.isAcceptableOrUnknown(
          data['votos_centena']!,
          _votosCentenaMeta,
        ),
      );
    }
    if (data.containsKey('votos_decena')) {
      context.handle(
        _votosDecenaMeta,
        votosDecena.isAcceptableOrUnknown(
          data['votos_decena']!,
          _votosDecenaMeta,
        ),
      );
    }
    if (data.containsKey('votos_unidad')) {
      context.handle(
        _votosUnidadMeta,
        votosUnidad.isAcceptableOrUnknown(
          data['votos_unidad']!,
          _votosUnidadMeta,
        ),
      );
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
      votosLetras: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}votos_letras'],
      )!,
      votosCentena: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}votos_centena'],
      )!,
      votosDecena: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}votos_decena'],
      )!,
      votosUnidad: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}votos_unidad'],
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
  final String votosLetras;
  final int votosCentena;
  final int votosDecena;
  final int votosUnidad;
  const LocalActaVoto({
    required this.id,
    required this.actaId,
    required this.organizacionId,
    required this.votos,
    required this.votosLetras,
    required this.votosCentena,
    required this.votosDecena,
    required this.votosUnidad,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['acta_id'] = Variable<String>(actaId);
    map['organizacion_id'] = Variable<String>(organizacionId);
    map['votos'] = Variable<int>(votos);
    map['votos_letras'] = Variable<String>(votosLetras);
    map['votos_centena'] = Variable<int>(votosCentena);
    map['votos_decena'] = Variable<int>(votosDecena);
    map['votos_unidad'] = Variable<int>(votosUnidad);
    return map;
  }

  LocalActaVotosCompanion toCompanion(bool nullToAbsent) {
    return LocalActaVotosCompanion(
      id: Value(id),
      actaId: Value(actaId),
      organizacionId: Value(organizacionId),
      votos: Value(votos),
      votosLetras: Value(votosLetras),
      votosCentena: Value(votosCentena),
      votosDecena: Value(votosDecena),
      votosUnidad: Value(votosUnidad),
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
      votosLetras: serializer.fromJson<String>(json['votosLetras']),
      votosCentena: serializer.fromJson<int>(json['votosCentena']),
      votosDecena: serializer.fromJson<int>(json['votosDecena']),
      votosUnidad: serializer.fromJson<int>(json['votosUnidad']),
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
      'votosLetras': serializer.toJson<String>(votosLetras),
      'votosCentena': serializer.toJson<int>(votosCentena),
      'votosDecena': serializer.toJson<int>(votosDecena),
      'votosUnidad': serializer.toJson<int>(votosUnidad),
    };
  }

  LocalActaVoto copyWith({
    String? id,
    String? actaId,
    String? organizacionId,
    int? votos,
    String? votosLetras,
    int? votosCentena,
    int? votosDecena,
    int? votosUnidad,
  }) => LocalActaVoto(
    id: id ?? this.id,
    actaId: actaId ?? this.actaId,
    organizacionId: organizacionId ?? this.organizacionId,
    votos: votos ?? this.votos,
    votosLetras: votosLetras ?? this.votosLetras,
    votosCentena: votosCentena ?? this.votosCentena,
    votosDecena: votosDecena ?? this.votosDecena,
    votosUnidad: votosUnidad ?? this.votosUnidad,
  );
  LocalActaVoto copyWithCompanion(LocalActaVotosCompanion data) {
    return LocalActaVoto(
      id: data.id.present ? data.id.value : this.id,
      actaId: data.actaId.present ? data.actaId.value : this.actaId,
      organizacionId: data.organizacionId.present
          ? data.organizacionId.value
          : this.organizacionId,
      votos: data.votos.present ? data.votos.value : this.votos,
      votosLetras: data.votosLetras.present
          ? data.votosLetras.value
          : this.votosLetras,
      votosCentena: data.votosCentena.present
          ? data.votosCentena.value
          : this.votosCentena,
      votosDecena: data.votosDecena.present
          ? data.votosDecena.value
          : this.votosDecena,
      votosUnidad: data.votosUnidad.present
          ? data.votosUnidad.value
          : this.votosUnidad,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalActaVoto(')
          ..write('id: $id, ')
          ..write('actaId: $actaId, ')
          ..write('organizacionId: $organizacionId, ')
          ..write('votos: $votos, ')
          ..write('votosLetras: $votosLetras, ')
          ..write('votosCentena: $votosCentena, ')
          ..write('votosDecena: $votosDecena, ')
          ..write('votosUnidad: $votosUnidad')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    actaId,
    organizacionId,
    votos,
    votosLetras,
    votosCentena,
    votosDecena,
    votosUnidad,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalActaVoto &&
          other.id == this.id &&
          other.actaId == this.actaId &&
          other.organizacionId == this.organizacionId &&
          other.votos == this.votos &&
          other.votosLetras == this.votosLetras &&
          other.votosCentena == this.votosCentena &&
          other.votosDecena == this.votosDecena &&
          other.votosUnidad == this.votosUnidad);
}

class LocalActaVotosCompanion extends UpdateCompanion<LocalActaVoto> {
  final Value<String> id;
  final Value<String> actaId;
  final Value<String> organizacionId;
  final Value<int> votos;
  final Value<String> votosLetras;
  final Value<int> votosCentena;
  final Value<int> votosDecena;
  final Value<int> votosUnidad;
  final Value<int> rowid;
  const LocalActaVotosCompanion({
    this.id = const Value.absent(),
    this.actaId = const Value.absent(),
    this.organizacionId = const Value.absent(),
    this.votos = const Value.absent(),
    this.votosLetras = const Value.absent(),
    this.votosCentena = const Value.absent(),
    this.votosDecena = const Value.absent(),
    this.votosUnidad = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalActaVotosCompanion.insert({
    required String id,
    required String actaId,
    required String organizacionId,
    this.votos = const Value.absent(),
    this.votosLetras = const Value.absent(),
    this.votosCentena = const Value.absent(),
    this.votosDecena = const Value.absent(),
    this.votosUnidad = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       actaId = Value(actaId),
       organizacionId = Value(organizacionId);
  static Insertable<LocalActaVoto> custom({
    Expression<String>? id,
    Expression<String>? actaId,
    Expression<String>? organizacionId,
    Expression<int>? votos,
    Expression<String>? votosLetras,
    Expression<int>? votosCentena,
    Expression<int>? votosDecena,
    Expression<int>? votosUnidad,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (actaId != null) 'acta_id': actaId,
      if (organizacionId != null) 'organizacion_id': organizacionId,
      if (votos != null) 'votos': votos,
      if (votosLetras != null) 'votos_letras': votosLetras,
      if (votosCentena != null) 'votos_centena': votosCentena,
      if (votosDecena != null) 'votos_decena': votosDecena,
      if (votosUnidad != null) 'votos_unidad': votosUnidad,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalActaVotosCompanion copyWith({
    Value<String>? id,
    Value<String>? actaId,
    Value<String>? organizacionId,
    Value<int>? votos,
    Value<String>? votosLetras,
    Value<int>? votosCentena,
    Value<int>? votosDecena,
    Value<int>? votosUnidad,
    Value<int>? rowid,
  }) {
    return LocalActaVotosCompanion(
      id: id ?? this.id,
      actaId: actaId ?? this.actaId,
      organizacionId: organizacionId ?? this.organizacionId,
      votos: votos ?? this.votos,
      votosLetras: votosLetras ?? this.votosLetras,
      votosCentena: votosCentena ?? this.votosCentena,
      votosDecena: votosDecena ?? this.votosDecena,
      votosUnidad: votosUnidad ?? this.votosUnidad,
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
    if (votosLetras.present) {
      map['votos_letras'] = Variable<String>(votosLetras.value);
    }
    if (votosCentena.present) {
      map['votos_centena'] = Variable<int>(votosCentena.value);
    }
    if (votosDecena.present) {
      map['votos_decena'] = Variable<int>(votosDecena.value);
    }
    if (votosUnidad.present) {
      map['votos_unidad'] = Variable<int>(votosUnidad.value);
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
          ..write('votosLetras: $votosLetras, ')
          ..write('votosCentena: $votosCentena, ')
          ..write('votosDecena: $votosDecena, ')
          ..write('votosUnidad: $votosUnidad, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalMesasTable extends LocalMesas
    with TableInfo<$LocalMesasTable, LocalMesa> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalMesasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
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
  static const VerificationMeta _numeroMesaMeta = const VerificationMeta(
    'numeroMesa',
  );
  @override
  late final GeneratedColumn<int> numeroMesa = GeneratedColumn<int>(
    'numero_mesa',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _veedorIdMeta = const VerificationMeta(
    'veedorId',
  );
  @override
  late final GeneratedColumn<String> veedorId = GeneratedColumn<String>(
    'veedor_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _estadoMeta = const VerificationMeta('estado');
  @override
  late final GeneratedColumn<String> estado = GeneratedColumn<String>(
    'estado',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _veedorUserIdMeta = const VerificationMeta(
    'veedorUserId',
  );
  @override
  late final GeneratedColumn<String> veedorUserId = GeneratedColumn<String>(
    'veedor_user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    recintoId,
    numeroMesa,
    veedorId,
    estado,
    veedorUserId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_mesas';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalMesa> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('recinto_id')) {
      context.handle(
        _recintoIdMeta,
        recintoId.isAcceptableOrUnknown(data['recinto_id']!, _recintoIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recintoIdMeta);
    }
    if (data.containsKey('numero_mesa')) {
      context.handle(
        _numeroMesaMeta,
        numeroMesa.isAcceptableOrUnknown(data['numero_mesa']!, _numeroMesaMeta),
      );
    } else if (isInserting) {
      context.missing(_numeroMesaMeta);
    }
    if (data.containsKey('veedor_id')) {
      context.handle(
        _veedorIdMeta,
        veedorId.isAcceptableOrUnknown(data['veedor_id']!, _veedorIdMeta),
      );
    }
    if (data.containsKey('estado')) {
      context.handle(
        _estadoMeta,
        estado.isAcceptableOrUnknown(data['estado']!, _estadoMeta),
      );
    } else if (isInserting) {
      context.missing(_estadoMeta);
    }
    if (data.containsKey('veedor_user_id')) {
      context.handle(
        _veedorUserIdMeta,
        veedorUserId.isAcceptableOrUnknown(
          data['veedor_user_id']!,
          _veedorUserIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_veedorUserIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalMesa map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalMesa(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      recintoId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recinto_id'],
      )!,
      numeroMesa: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}numero_mesa'],
      )!,
      veedorId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}veedor_id'],
      ),
      estado: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}estado'],
      )!,
      veedorUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}veedor_user_id'],
      )!,
    );
  }

  @override
  $LocalMesasTable createAlias(String alias) {
    return $LocalMesasTable(attachedDatabase, alias);
  }
}

class LocalMesa extends DataClass implements Insertable<LocalMesa> {
  final String id;
  final String recintoId;
  final int numeroMesa;
  final String? veedorId;
  final String estado;
  final String veedorUserId;
  const LocalMesa({
    required this.id,
    required this.recintoId,
    required this.numeroMesa,
    this.veedorId,
    required this.estado,
    required this.veedorUserId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['recinto_id'] = Variable<String>(recintoId);
    map['numero_mesa'] = Variable<int>(numeroMesa);
    if (!nullToAbsent || veedorId != null) {
      map['veedor_id'] = Variable<String>(veedorId);
    }
    map['estado'] = Variable<String>(estado);
    map['veedor_user_id'] = Variable<String>(veedorUserId);
    return map;
  }

  LocalMesasCompanion toCompanion(bool nullToAbsent) {
    return LocalMesasCompanion(
      id: Value(id),
      recintoId: Value(recintoId),
      numeroMesa: Value(numeroMesa),
      veedorId: veedorId == null && nullToAbsent
          ? const Value.absent()
          : Value(veedorId),
      estado: Value(estado),
      veedorUserId: Value(veedorUserId),
    );
  }

  factory LocalMesa.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalMesa(
      id: serializer.fromJson<String>(json['id']),
      recintoId: serializer.fromJson<String>(json['recintoId']),
      numeroMesa: serializer.fromJson<int>(json['numeroMesa']),
      veedorId: serializer.fromJson<String?>(json['veedorId']),
      estado: serializer.fromJson<String>(json['estado']),
      veedorUserId: serializer.fromJson<String>(json['veedorUserId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'recintoId': serializer.toJson<String>(recintoId),
      'numeroMesa': serializer.toJson<int>(numeroMesa),
      'veedorId': serializer.toJson<String?>(veedorId),
      'estado': serializer.toJson<String>(estado),
      'veedorUserId': serializer.toJson<String>(veedorUserId),
    };
  }

  LocalMesa copyWith({
    String? id,
    String? recintoId,
    int? numeroMesa,
    Value<String?> veedorId = const Value.absent(),
    String? estado,
    String? veedorUserId,
  }) => LocalMesa(
    id: id ?? this.id,
    recintoId: recintoId ?? this.recintoId,
    numeroMesa: numeroMesa ?? this.numeroMesa,
    veedorId: veedorId.present ? veedorId.value : this.veedorId,
    estado: estado ?? this.estado,
    veedorUserId: veedorUserId ?? this.veedorUserId,
  );
  LocalMesa copyWithCompanion(LocalMesasCompanion data) {
    return LocalMesa(
      id: data.id.present ? data.id.value : this.id,
      recintoId: data.recintoId.present ? data.recintoId.value : this.recintoId,
      numeroMesa: data.numeroMesa.present
          ? data.numeroMesa.value
          : this.numeroMesa,
      veedorId: data.veedorId.present ? data.veedorId.value : this.veedorId,
      estado: data.estado.present ? data.estado.value : this.estado,
      veedorUserId: data.veedorUserId.present
          ? data.veedorUserId.value
          : this.veedorUserId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalMesa(')
          ..write('id: $id, ')
          ..write('recintoId: $recintoId, ')
          ..write('numeroMesa: $numeroMesa, ')
          ..write('veedorId: $veedorId, ')
          ..write('estado: $estado, ')
          ..write('veedorUserId: $veedorUserId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, recintoId, numeroMesa, veedorId, estado, veedorUserId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalMesa &&
          other.id == this.id &&
          other.recintoId == this.recintoId &&
          other.numeroMesa == this.numeroMesa &&
          other.veedorId == this.veedorId &&
          other.estado == this.estado &&
          other.veedorUserId == this.veedorUserId);
}

class LocalMesasCompanion extends UpdateCompanion<LocalMesa> {
  final Value<String> id;
  final Value<String> recintoId;
  final Value<int> numeroMesa;
  final Value<String?> veedorId;
  final Value<String> estado;
  final Value<String> veedorUserId;
  final Value<int> rowid;
  const LocalMesasCompanion({
    this.id = const Value.absent(),
    this.recintoId = const Value.absent(),
    this.numeroMesa = const Value.absent(),
    this.veedorId = const Value.absent(),
    this.estado = const Value.absent(),
    this.veedorUserId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalMesasCompanion.insert({
    required String id,
    required String recintoId,
    required int numeroMesa,
    this.veedorId = const Value.absent(),
    required String estado,
    required String veedorUserId,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       recintoId = Value(recintoId),
       numeroMesa = Value(numeroMesa),
       estado = Value(estado),
       veedorUserId = Value(veedorUserId);
  static Insertable<LocalMesa> custom({
    Expression<String>? id,
    Expression<String>? recintoId,
    Expression<int>? numeroMesa,
    Expression<String>? veedorId,
    Expression<String>? estado,
    Expression<String>? veedorUserId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recintoId != null) 'recinto_id': recintoId,
      if (numeroMesa != null) 'numero_mesa': numeroMesa,
      if (veedorId != null) 'veedor_id': veedorId,
      if (estado != null) 'estado': estado,
      if (veedorUserId != null) 'veedor_user_id': veedorUserId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalMesasCompanion copyWith({
    Value<String>? id,
    Value<String>? recintoId,
    Value<int>? numeroMesa,
    Value<String?>? veedorId,
    Value<String>? estado,
    Value<String>? veedorUserId,
    Value<int>? rowid,
  }) {
    return LocalMesasCompanion(
      id: id ?? this.id,
      recintoId: recintoId ?? this.recintoId,
      numeroMesa: numeroMesa ?? this.numeroMesa,
      veedorId: veedorId ?? this.veedorId,
      estado: estado ?? this.estado,
      veedorUserId: veedorUserId ?? this.veedorUserId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (recintoId.present) {
      map['recinto_id'] = Variable<String>(recintoId.value);
    }
    if (numeroMesa.present) {
      map['numero_mesa'] = Variable<int>(numeroMesa.value);
    }
    if (veedorId.present) {
      map['veedor_id'] = Variable<String>(veedorId.value);
    }
    if (estado.present) {
      map['estado'] = Variable<String>(estado.value);
    }
    if (veedorUserId.present) {
      map['veedor_user_id'] = Variable<String>(veedorUserId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalMesasCompanion(')
          ..write('id: $id, ')
          ..write('recintoId: $recintoId, ')
          ..write('numeroMesa: $numeroMesa, ')
          ..write('veedorId: $veedorId, ')
          ..write('estado: $estado, ')
          ..write('veedorUserId: $veedorUserId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalOrganizacionesTable extends LocalOrganizaciones
    with TableInfo<$LocalOrganizacionesTable, LocalOrganizacione> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalOrganizacionesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
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
  static const VerificationMeta _numeroListaMeta = const VerificationMeta(
    'numeroLista',
  );
  @override
  late final GeneratedColumn<int> numeroLista = GeneratedColumn<int>(
    'numero_lista',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _candidatoNombreMeta = const VerificationMeta(
    'candidatoNombre',
  );
  @override
  late final GeneratedColumn<String> candidatoNombre = GeneratedColumn<String>(
    'candidato_nombre',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    nombre,
    dignidad,
    numeroLista,
    candidatoNombre,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_organizaciones';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalOrganizacione> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _nombreMeta,
        nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta),
      );
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('dignidad')) {
      context.handle(
        _dignidadMeta,
        dignidad.isAcceptableOrUnknown(data['dignidad']!, _dignidadMeta),
      );
    } else if (isInserting) {
      context.missing(_dignidadMeta);
    }
    if (data.containsKey('numero_lista')) {
      context.handle(
        _numeroListaMeta,
        numeroLista.isAcceptableOrUnknown(
          data['numero_lista']!,
          _numeroListaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_numeroListaMeta);
    }
    if (data.containsKey('candidato_nombre')) {
      context.handle(
        _candidatoNombreMeta,
        candidatoNombre.isAcceptableOrUnknown(
          data['candidato_nombre']!,
          _candidatoNombreMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_candidatoNombreMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalOrganizacione map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalOrganizacione(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      nombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      )!,
      dignidad: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dignidad'],
      )!,
      numeroLista: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}numero_lista'],
      )!,
      candidatoNombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}candidato_nombre'],
      )!,
    );
  }

  @override
  $LocalOrganizacionesTable createAlias(String alias) {
    return $LocalOrganizacionesTable(attachedDatabase, alias);
  }
}

class LocalOrganizacione extends DataClass
    implements Insertable<LocalOrganizacione> {
  final String id;
  final String nombre;
  final String dignidad;
  final int numeroLista;
  final String candidatoNombre;
  const LocalOrganizacione({
    required this.id,
    required this.nombre,
    required this.dignidad,
    required this.numeroLista,
    required this.candidatoNombre,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['nombre'] = Variable<String>(nombre);
    map['dignidad'] = Variable<String>(dignidad);
    map['numero_lista'] = Variable<int>(numeroLista);
    map['candidato_nombre'] = Variable<String>(candidatoNombre);
    return map;
  }

  LocalOrganizacionesCompanion toCompanion(bool nullToAbsent) {
    return LocalOrganizacionesCompanion(
      id: Value(id),
      nombre: Value(nombre),
      dignidad: Value(dignidad),
      numeroLista: Value(numeroLista),
      candidatoNombre: Value(candidatoNombre),
    );
  }

  factory LocalOrganizacione.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalOrganizacione(
      id: serializer.fromJson<String>(json['id']),
      nombre: serializer.fromJson<String>(json['nombre']),
      dignidad: serializer.fromJson<String>(json['dignidad']),
      numeroLista: serializer.fromJson<int>(json['numeroLista']),
      candidatoNombre: serializer.fromJson<String>(json['candidatoNombre']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'nombre': serializer.toJson<String>(nombre),
      'dignidad': serializer.toJson<String>(dignidad),
      'numeroLista': serializer.toJson<int>(numeroLista),
      'candidatoNombre': serializer.toJson<String>(candidatoNombre),
    };
  }

  LocalOrganizacione copyWith({
    String? id,
    String? nombre,
    String? dignidad,
    int? numeroLista,
    String? candidatoNombre,
  }) => LocalOrganizacione(
    id: id ?? this.id,
    nombre: nombre ?? this.nombre,
    dignidad: dignidad ?? this.dignidad,
    numeroLista: numeroLista ?? this.numeroLista,
    candidatoNombre: candidatoNombre ?? this.candidatoNombre,
  );
  LocalOrganizacione copyWithCompanion(LocalOrganizacionesCompanion data) {
    return LocalOrganizacione(
      id: data.id.present ? data.id.value : this.id,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      dignidad: data.dignidad.present ? data.dignidad.value : this.dignidad,
      numeroLista: data.numeroLista.present
          ? data.numeroLista.value
          : this.numeroLista,
      candidatoNombre: data.candidatoNombre.present
          ? data.candidatoNombre.value
          : this.candidatoNombre,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalOrganizacione(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('dignidad: $dignidad, ')
          ..write('numeroLista: $numeroLista, ')
          ..write('candidatoNombre: $candidatoNombre')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, nombre, dignidad, numeroLista, candidatoNombre);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalOrganizacione &&
          other.id == this.id &&
          other.nombre == this.nombre &&
          other.dignidad == this.dignidad &&
          other.numeroLista == this.numeroLista &&
          other.candidatoNombre == this.candidatoNombre);
}

class LocalOrganizacionesCompanion extends UpdateCompanion<LocalOrganizacione> {
  final Value<String> id;
  final Value<String> nombre;
  final Value<String> dignidad;
  final Value<int> numeroLista;
  final Value<String> candidatoNombre;
  final Value<int> rowid;
  const LocalOrganizacionesCompanion({
    this.id = const Value.absent(),
    this.nombre = const Value.absent(),
    this.dignidad = const Value.absent(),
    this.numeroLista = const Value.absent(),
    this.candidatoNombre = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalOrganizacionesCompanion.insert({
    required String id,
    required String nombre,
    required String dignidad,
    required int numeroLista,
    required String candidatoNombre,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       nombre = Value(nombre),
       dignidad = Value(dignidad),
       numeroLista = Value(numeroLista),
       candidatoNombre = Value(candidatoNombre);
  static Insertable<LocalOrganizacione> custom({
    Expression<String>? id,
    Expression<String>? nombre,
    Expression<String>? dignidad,
    Expression<int>? numeroLista,
    Expression<String>? candidatoNombre,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombre != null) 'nombre': nombre,
      if (dignidad != null) 'dignidad': dignidad,
      if (numeroLista != null) 'numero_lista': numeroLista,
      if (candidatoNombre != null) 'candidato_nombre': candidatoNombre,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalOrganizacionesCompanion copyWith({
    Value<String>? id,
    Value<String>? nombre,
    Value<String>? dignidad,
    Value<int>? numeroLista,
    Value<String>? candidatoNombre,
    Value<int>? rowid,
  }) {
    return LocalOrganizacionesCompanion(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      dignidad: dignidad ?? this.dignidad,
      numeroLista: numeroLista ?? this.numeroLista,
      candidatoNombre: candidatoNombre ?? this.candidatoNombre,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (dignidad.present) {
      map['dignidad'] = Variable<String>(dignidad.value);
    }
    if (numeroLista.present) {
      map['numero_lista'] = Variable<int>(numeroLista.value);
    }
    if (candidatoNombre.present) {
      map['candidato_nombre'] = Variable<String>(candidatoNombre.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalOrganizacionesCompanion(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('dignidad: $dignidad, ')
          ..write('numeroLista: $numeroLista, ')
          ..write('candidatoNombre: $candidatoNombre, ')
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
  late final $LocalMesasTable localMesas = $LocalMesasTable(this);
  late final $LocalOrganizacionesTable localOrganizaciones =
      $LocalOrganizacionesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    localActas,
    localActaVotos,
    localMesas,
    localOrganizaciones,
  ];
}

typedef $$LocalActasTableCreateCompanionBuilder =
    LocalActasCompanion Function({
      required String id,
      required String mesaId,
      required String recintoId,
      required String dignidad,
      Value<String> totalSufragantesLetras,
      Value<int> totalSufragantesCentena,
      Value<int> totalSufragantesDecena,
      Value<int> totalSufragantesUnidad,
      Value<String> votosBlancosLetras,
      Value<int> votosBlancosCentena,
      Value<int> votosBlancosDecena,
      Value<int> votosBlancosUnidad,
      Value<String> votosNulosLetras,
      Value<int> votosNulosCentena,
      Value<int> votosNulosDecena,
      Value<int> votosNulosUnidad,
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
      Value<String> totalSufragantesLetras,
      Value<int> totalSufragantesCentena,
      Value<int> totalSufragantesDecena,
      Value<int> totalSufragantesUnidad,
      Value<String> votosBlancosLetras,
      Value<int> votosBlancosCentena,
      Value<int> votosBlancosDecena,
      Value<int> votosBlancosUnidad,
      Value<String> votosNulosLetras,
      Value<int> votosNulosCentena,
      Value<int> votosNulosDecena,
      Value<int> votosNulosUnidad,
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

  ColumnFilters<String> get totalSufragantesLetras => $composableBuilder(
    column: $table.totalSufragantesLetras,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalSufragantesCentena => $composableBuilder(
    column: $table.totalSufragantesCentena,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalSufragantesDecena => $composableBuilder(
    column: $table.totalSufragantesDecena,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalSufragantesUnidad => $composableBuilder(
    column: $table.totalSufragantesUnidad,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get votosBlancosLetras => $composableBuilder(
    column: $table.votosBlancosLetras,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get votosBlancosCentena => $composableBuilder(
    column: $table.votosBlancosCentena,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get votosBlancosDecena => $composableBuilder(
    column: $table.votosBlancosDecena,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get votosBlancosUnidad => $composableBuilder(
    column: $table.votosBlancosUnidad,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get votosNulosLetras => $composableBuilder(
    column: $table.votosNulosLetras,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get votosNulosCentena => $composableBuilder(
    column: $table.votosNulosCentena,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get votosNulosDecena => $composableBuilder(
    column: $table.votosNulosDecena,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get votosNulosUnidad => $composableBuilder(
    column: $table.votosNulosUnidad,
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

  ColumnOrderings<String> get totalSufragantesLetras => $composableBuilder(
    column: $table.totalSufragantesLetras,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalSufragantesCentena => $composableBuilder(
    column: $table.totalSufragantesCentena,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalSufragantesDecena => $composableBuilder(
    column: $table.totalSufragantesDecena,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalSufragantesUnidad => $composableBuilder(
    column: $table.totalSufragantesUnidad,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get votosBlancosLetras => $composableBuilder(
    column: $table.votosBlancosLetras,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get votosBlancosCentena => $composableBuilder(
    column: $table.votosBlancosCentena,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get votosBlancosDecena => $composableBuilder(
    column: $table.votosBlancosDecena,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get votosBlancosUnidad => $composableBuilder(
    column: $table.votosBlancosUnidad,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get votosNulosLetras => $composableBuilder(
    column: $table.votosNulosLetras,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get votosNulosCentena => $composableBuilder(
    column: $table.votosNulosCentena,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get votosNulosDecena => $composableBuilder(
    column: $table.votosNulosDecena,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get votosNulosUnidad => $composableBuilder(
    column: $table.votosNulosUnidad,
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

  GeneratedColumn<String> get totalSufragantesLetras => $composableBuilder(
    column: $table.totalSufragantesLetras,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalSufragantesCentena => $composableBuilder(
    column: $table.totalSufragantesCentena,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalSufragantesDecena => $composableBuilder(
    column: $table.totalSufragantesDecena,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalSufragantesUnidad => $composableBuilder(
    column: $table.totalSufragantesUnidad,
    builder: (column) => column,
  );

  GeneratedColumn<String> get votosBlancosLetras => $composableBuilder(
    column: $table.votosBlancosLetras,
    builder: (column) => column,
  );

  GeneratedColumn<int> get votosBlancosCentena => $composableBuilder(
    column: $table.votosBlancosCentena,
    builder: (column) => column,
  );

  GeneratedColumn<int> get votosBlancosDecena => $composableBuilder(
    column: $table.votosBlancosDecena,
    builder: (column) => column,
  );

  GeneratedColumn<int> get votosBlancosUnidad => $composableBuilder(
    column: $table.votosBlancosUnidad,
    builder: (column) => column,
  );

  GeneratedColumn<String> get votosNulosLetras => $composableBuilder(
    column: $table.votosNulosLetras,
    builder: (column) => column,
  );

  GeneratedColumn<int> get votosNulosCentena => $composableBuilder(
    column: $table.votosNulosCentena,
    builder: (column) => column,
  );

  GeneratedColumn<int> get votosNulosDecena => $composableBuilder(
    column: $table.votosNulosDecena,
    builder: (column) => column,
  );

  GeneratedColumn<int> get votosNulosUnidad => $composableBuilder(
    column: $table.votosNulosUnidad,
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
                Value<String> totalSufragantesLetras = const Value.absent(),
                Value<int> totalSufragantesCentena = const Value.absent(),
                Value<int> totalSufragantesDecena = const Value.absent(),
                Value<int> totalSufragantesUnidad = const Value.absent(),
                Value<String> votosBlancosLetras = const Value.absent(),
                Value<int> votosBlancosCentena = const Value.absent(),
                Value<int> votosBlancosDecena = const Value.absent(),
                Value<int> votosBlancosUnidad = const Value.absent(),
                Value<String> votosNulosLetras = const Value.absent(),
                Value<int> votosNulosCentena = const Value.absent(),
                Value<int> votosNulosDecena = const Value.absent(),
                Value<int> votosNulosUnidad = const Value.absent(),
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
                totalSufragantesLetras: totalSufragantesLetras,
                totalSufragantesCentena: totalSufragantesCentena,
                totalSufragantesDecena: totalSufragantesDecena,
                totalSufragantesUnidad: totalSufragantesUnidad,
                votosBlancosLetras: votosBlancosLetras,
                votosBlancosCentena: votosBlancosCentena,
                votosBlancosDecena: votosBlancosDecena,
                votosBlancosUnidad: votosBlancosUnidad,
                votosNulosLetras: votosNulosLetras,
                votosNulosCentena: votosNulosCentena,
                votosNulosDecena: votosNulosDecena,
                votosNulosUnidad: votosNulosUnidad,
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
                Value<String> totalSufragantesLetras = const Value.absent(),
                Value<int> totalSufragantesCentena = const Value.absent(),
                Value<int> totalSufragantesDecena = const Value.absent(),
                Value<int> totalSufragantesUnidad = const Value.absent(),
                Value<String> votosBlancosLetras = const Value.absent(),
                Value<int> votosBlancosCentena = const Value.absent(),
                Value<int> votosBlancosDecena = const Value.absent(),
                Value<int> votosBlancosUnidad = const Value.absent(),
                Value<String> votosNulosLetras = const Value.absent(),
                Value<int> votosNulosCentena = const Value.absent(),
                Value<int> votosNulosDecena = const Value.absent(),
                Value<int> votosNulosUnidad = const Value.absent(),
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
                totalSufragantesLetras: totalSufragantesLetras,
                totalSufragantesCentena: totalSufragantesCentena,
                totalSufragantesDecena: totalSufragantesDecena,
                totalSufragantesUnidad: totalSufragantesUnidad,
                votosBlancosLetras: votosBlancosLetras,
                votosBlancosCentena: votosBlancosCentena,
                votosBlancosDecena: votosBlancosDecena,
                votosBlancosUnidad: votosBlancosUnidad,
                votosNulosLetras: votosNulosLetras,
                votosNulosCentena: votosNulosCentena,
                votosNulosDecena: votosNulosDecena,
                votosNulosUnidad: votosNulosUnidad,
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
      Value<int> votos,
      Value<String> votosLetras,
      Value<int> votosCentena,
      Value<int> votosDecena,
      Value<int> votosUnidad,
      Value<int> rowid,
    });
typedef $$LocalActaVotosTableUpdateCompanionBuilder =
    LocalActaVotosCompanion Function({
      Value<String> id,
      Value<String> actaId,
      Value<String> organizacionId,
      Value<int> votos,
      Value<String> votosLetras,
      Value<int> votosCentena,
      Value<int> votosDecena,
      Value<int> votosUnidad,
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

  ColumnFilters<String> get votosLetras => $composableBuilder(
    column: $table.votosLetras,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get votosCentena => $composableBuilder(
    column: $table.votosCentena,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get votosDecena => $composableBuilder(
    column: $table.votosDecena,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get votosUnidad => $composableBuilder(
    column: $table.votosUnidad,
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

  ColumnOrderings<String> get votosLetras => $composableBuilder(
    column: $table.votosLetras,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get votosCentena => $composableBuilder(
    column: $table.votosCentena,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get votosDecena => $composableBuilder(
    column: $table.votosDecena,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get votosUnidad => $composableBuilder(
    column: $table.votosUnidad,
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

  GeneratedColumn<String> get votosLetras => $composableBuilder(
    column: $table.votosLetras,
    builder: (column) => column,
  );

  GeneratedColumn<int> get votosCentena => $composableBuilder(
    column: $table.votosCentena,
    builder: (column) => column,
  );

  GeneratedColumn<int> get votosDecena => $composableBuilder(
    column: $table.votosDecena,
    builder: (column) => column,
  );

  GeneratedColumn<int> get votosUnidad => $composableBuilder(
    column: $table.votosUnidad,
    builder: (column) => column,
  );
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
                Value<String> votosLetras = const Value.absent(),
                Value<int> votosCentena = const Value.absent(),
                Value<int> votosDecena = const Value.absent(),
                Value<int> votosUnidad = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalActaVotosCompanion(
                id: id,
                actaId: actaId,
                organizacionId: organizacionId,
                votos: votos,
                votosLetras: votosLetras,
                votosCentena: votosCentena,
                votosDecena: votosDecena,
                votosUnidad: votosUnidad,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String actaId,
                required String organizacionId,
                Value<int> votos = const Value.absent(),
                Value<String> votosLetras = const Value.absent(),
                Value<int> votosCentena = const Value.absent(),
                Value<int> votosDecena = const Value.absent(),
                Value<int> votosUnidad = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalActaVotosCompanion.insert(
                id: id,
                actaId: actaId,
                organizacionId: organizacionId,
                votos: votos,
                votosLetras: votosLetras,
                votosCentena: votosCentena,
                votosDecena: votosDecena,
                votosUnidad: votosUnidad,
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
typedef $$LocalMesasTableCreateCompanionBuilder =
    LocalMesasCompanion Function({
      required String id,
      required String recintoId,
      required int numeroMesa,
      Value<String?> veedorId,
      required String estado,
      required String veedorUserId,
      Value<int> rowid,
    });
typedef $$LocalMesasTableUpdateCompanionBuilder =
    LocalMesasCompanion Function({
      Value<String> id,
      Value<String> recintoId,
      Value<int> numeroMesa,
      Value<String?> veedorId,
      Value<String> estado,
      Value<String> veedorUserId,
      Value<int> rowid,
    });

class $$LocalMesasTableFilterComposer
    extends Composer<_$AppDatabase, $LocalMesasTable> {
  $$LocalMesasTableFilterComposer({
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

  ColumnFilters<String> get recintoId => $composableBuilder(
    column: $table.recintoId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get numeroMesa => $composableBuilder(
    column: $table.numeroMesa,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get veedorId => $composableBuilder(
    column: $table.veedorId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get estado => $composableBuilder(
    column: $table.estado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get veedorUserId => $composableBuilder(
    column: $table.veedorUserId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocalMesasTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalMesasTable> {
  $$LocalMesasTableOrderingComposer({
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

  ColumnOrderings<String> get recintoId => $composableBuilder(
    column: $table.recintoId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get numeroMesa => $composableBuilder(
    column: $table.numeroMesa,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get veedorId => $composableBuilder(
    column: $table.veedorId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get estado => $composableBuilder(
    column: $table.estado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get veedorUserId => $composableBuilder(
    column: $table.veedorUserId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalMesasTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalMesasTable> {
  $$LocalMesasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get recintoId =>
      $composableBuilder(column: $table.recintoId, builder: (column) => column);

  GeneratedColumn<int> get numeroMesa => $composableBuilder(
    column: $table.numeroMesa,
    builder: (column) => column,
  );

  GeneratedColumn<String> get veedorId =>
      $composableBuilder(column: $table.veedorId, builder: (column) => column);

  GeneratedColumn<String> get estado =>
      $composableBuilder(column: $table.estado, builder: (column) => column);

  GeneratedColumn<String> get veedorUserId => $composableBuilder(
    column: $table.veedorUserId,
    builder: (column) => column,
  );
}

class $$LocalMesasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalMesasTable,
          LocalMesa,
          $$LocalMesasTableFilterComposer,
          $$LocalMesasTableOrderingComposer,
          $$LocalMesasTableAnnotationComposer,
          $$LocalMesasTableCreateCompanionBuilder,
          $$LocalMesasTableUpdateCompanionBuilder,
          (
            LocalMesa,
            BaseReferences<_$AppDatabase, $LocalMesasTable, LocalMesa>,
          ),
          LocalMesa,
          PrefetchHooks Function()
        > {
  $$LocalMesasTableTableManager(_$AppDatabase db, $LocalMesasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalMesasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalMesasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalMesasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> recintoId = const Value.absent(),
                Value<int> numeroMesa = const Value.absent(),
                Value<String?> veedorId = const Value.absent(),
                Value<String> estado = const Value.absent(),
                Value<String> veedorUserId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalMesasCompanion(
                id: id,
                recintoId: recintoId,
                numeroMesa: numeroMesa,
                veedorId: veedorId,
                estado: estado,
                veedorUserId: veedorUserId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String recintoId,
                required int numeroMesa,
                Value<String?> veedorId = const Value.absent(),
                required String estado,
                required String veedorUserId,
                Value<int> rowid = const Value.absent(),
              }) => LocalMesasCompanion.insert(
                id: id,
                recintoId: recintoId,
                numeroMesa: numeroMesa,
                veedorId: veedorId,
                estado: estado,
                veedorUserId: veedorUserId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocalMesasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalMesasTable,
      LocalMesa,
      $$LocalMesasTableFilterComposer,
      $$LocalMesasTableOrderingComposer,
      $$LocalMesasTableAnnotationComposer,
      $$LocalMesasTableCreateCompanionBuilder,
      $$LocalMesasTableUpdateCompanionBuilder,
      (LocalMesa, BaseReferences<_$AppDatabase, $LocalMesasTable, LocalMesa>),
      LocalMesa,
      PrefetchHooks Function()
    >;
typedef $$LocalOrganizacionesTableCreateCompanionBuilder =
    LocalOrganizacionesCompanion Function({
      required String id,
      required String nombre,
      required String dignidad,
      required int numeroLista,
      required String candidatoNombre,
      Value<int> rowid,
    });
typedef $$LocalOrganizacionesTableUpdateCompanionBuilder =
    LocalOrganizacionesCompanion Function({
      Value<String> id,
      Value<String> nombre,
      Value<String> dignidad,
      Value<int> numeroLista,
      Value<String> candidatoNombre,
      Value<int> rowid,
    });

class $$LocalOrganizacionesTableFilterComposer
    extends Composer<_$AppDatabase, $LocalOrganizacionesTable> {
  $$LocalOrganizacionesTableFilterComposer({
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

  ColumnFilters<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dignidad => $composableBuilder(
    column: $table.dignidad,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get numeroLista => $composableBuilder(
    column: $table.numeroLista,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get candidatoNombre => $composableBuilder(
    column: $table.candidatoNombre,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocalOrganizacionesTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalOrganizacionesTable> {
  $$LocalOrganizacionesTableOrderingComposer({
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

  ColumnOrderings<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dignidad => $composableBuilder(
    column: $table.dignidad,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get numeroLista => $composableBuilder(
    column: $table.numeroLista,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get candidatoNombre => $composableBuilder(
    column: $table.candidatoNombre,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalOrganizacionesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalOrganizacionesTable> {
  $$LocalOrganizacionesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<String> get dignidad =>
      $composableBuilder(column: $table.dignidad, builder: (column) => column);

  GeneratedColumn<int> get numeroLista => $composableBuilder(
    column: $table.numeroLista,
    builder: (column) => column,
  );

  GeneratedColumn<String> get candidatoNombre => $composableBuilder(
    column: $table.candidatoNombre,
    builder: (column) => column,
  );
}

class $$LocalOrganizacionesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalOrganizacionesTable,
          LocalOrganizacione,
          $$LocalOrganizacionesTableFilterComposer,
          $$LocalOrganizacionesTableOrderingComposer,
          $$LocalOrganizacionesTableAnnotationComposer,
          $$LocalOrganizacionesTableCreateCompanionBuilder,
          $$LocalOrganizacionesTableUpdateCompanionBuilder,
          (
            LocalOrganizacione,
            BaseReferences<
              _$AppDatabase,
              $LocalOrganizacionesTable,
              LocalOrganizacione
            >,
          ),
          LocalOrganizacione,
          PrefetchHooks Function()
        > {
  $$LocalOrganizacionesTableTableManager(
    _$AppDatabase db,
    $LocalOrganizacionesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalOrganizacionesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalOrganizacionesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$LocalOrganizacionesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> nombre = const Value.absent(),
                Value<String> dignidad = const Value.absent(),
                Value<int> numeroLista = const Value.absent(),
                Value<String> candidatoNombre = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalOrganizacionesCompanion(
                id: id,
                nombre: nombre,
                dignidad: dignidad,
                numeroLista: numeroLista,
                candidatoNombre: candidatoNombre,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String nombre,
                required String dignidad,
                required int numeroLista,
                required String candidatoNombre,
                Value<int> rowid = const Value.absent(),
              }) => LocalOrganizacionesCompanion.insert(
                id: id,
                nombre: nombre,
                dignidad: dignidad,
                numeroLista: numeroLista,
                candidatoNombre: candidatoNombre,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocalOrganizacionesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalOrganizacionesTable,
      LocalOrganizacione,
      $$LocalOrganizacionesTableFilterComposer,
      $$LocalOrganizacionesTableOrderingComposer,
      $$LocalOrganizacionesTableAnnotationComposer,
      $$LocalOrganizacionesTableCreateCompanionBuilder,
      $$LocalOrganizacionesTableUpdateCompanionBuilder,
      (
        LocalOrganizacione,
        BaseReferences<
          _$AppDatabase,
          $LocalOrganizacionesTable,
          LocalOrganizacione
        >,
      ),
      LocalOrganizacione,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LocalActasTableTableManager get localActas =>
      $$LocalActasTableTableManager(_db, _db.localActas);
  $$LocalActaVotosTableTableManager get localActaVotos =>
      $$LocalActaVotosTableTableManager(_db, _db.localActaVotos);
  $$LocalMesasTableTableManager get localMesas =>
      $$LocalMesasTableTableManager(_db, _db.localMesas);
  $$LocalOrganizacionesTableTableManager get localOrganizaciones =>
      $$LocalOrganizacionesTableTableManager(_db, _db.localOrganizaciones);
}
