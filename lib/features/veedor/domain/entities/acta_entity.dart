class ActaEntity {
  final String id;
  final String mesaId;
  final String recintoId;
  final String dignidad;
  final int totalSufragantes;
  final int votosNulos;
  final int votosBlancos;
  final String? fotoFileId;
  final String? fotoBucketId;
  final double? gpsLat;
  final double? gpsLng;
  final double? gpsAccuracy;
  final String registradoPor;
  final bool sincronizado;
  final DateTime updatedAt;
  final String? fotoLocalPath;
  final List<VotoEntity> votos;

  const ActaEntity({
    required this.id,
    required this.mesaId,
    required this.recintoId,
    required this.dignidad,
    required this.totalSufragantes,
    required this.votosNulos,
    required this.votosBlancos,
    this.fotoFileId,
    this.fotoBucketId,
    this.gpsLat,
    this.gpsLng,
    this.gpsAccuracy,
    required this.registradoPor,
    this.sincronizado = false,
    required this.updatedAt,
    this.fotoLocalPath,
    this.votos = const [],
  });

  ActaEntity copyWith({
    String? id,
    String? mesaId,
    String? recintoId,
    String? dignidad,
    int? totalSufragantes,
    int? votosNulos,
    int? votosBlancos,
    String? fotoFileId,
    String? fotoBucketId,
    double? gpsLat,
    double? gpsLng,
    double? gpsAccuracy,
    String? registradoPor,
    bool? sincronizado,
    DateTime? updatedAt,
    String? fotoLocalPath,
    List<VotoEntity>? votos,
  }) {
    return ActaEntity(
      id: id ?? this.id,
      mesaId: mesaId ?? this.mesaId,
      recintoId: recintoId ?? this.recintoId,
      dignidad: dignidad ?? this.dignidad,
      totalSufragantes: totalSufragantes ?? this.totalSufragantes,
      votosNulos: votosNulos ?? this.votosNulos,
      votosBlancos: votosBlancos ?? this.votosBlancos,
      fotoFileId: fotoFileId ?? this.fotoFileId,
      fotoBucketId: fotoBucketId ?? this.fotoBucketId,
      gpsLat: gpsLat ?? this.gpsLat,
      gpsLng: gpsLng ?? this.gpsLng,
      gpsAccuracy: gpsAccuracy ?? this.gpsAccuracy,
      registradoPor: registradoPor ?? this.registradoPor,
      sincronizado: sincronizado ?? this.sincronizado,
      updatedAt: updatedAt ?? this.updatedAt,
      fotoLocalPath: fotoLocalPath ?? this.fotoLocalPath,
      votos: votos ?? this.votos,
    );
  }
}

class VotoEntity {
  final String id;
  final String actaId;
  final String organizacionId;
  final int votos;

  const VotoEntity({
    required this.id,
    required this.actaId,
    required this.organizacionId,
    required this.votos,
  });
}
