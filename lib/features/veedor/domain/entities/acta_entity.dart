class ActaEntity {
  final String id;
  final String mesaId;
  final String recintoId;
  final String dignidad;

  // Total sufragantes
  final String totalSufragantesLetras;
  final int totalSufragantesCentena;
  final int totalSufragantesDecena;
  final int totalSufragantesUnidad;

  // Votos blancos
  final String votosBlancosLetras;
  final int votosBlancosCentena;
  final int votosBlancosDecena;
  final int votosBlancosUnidad;

  // Votos nulos
  final String votosNulosLetras;
  final int votosNulosCentena;
  final int votosNulosDecena;
  final int votosNulosUnidad;

  // Existing fields
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

  // Computed totals from digit breakdown
  int get totalSufragantes =>
      totalSufragantesCentena * 100 + totalSufragantesDecena * 10 + totalSufragantesUnidad;
  int get votosBlancos =>
      votosBlancosCentena * 100 + votosBlancosDecena * 10 + votosBlancosUnidad;
  int get votosNulos =>
      votosNulosCentena * 100 + votosNulosDecena * 10 + votosNulosUnidad;

  const ActaEntity({
    required this.id,
    required this.mesaId,
    required this.recintoId,
    required this.dignidad,
    this.totalSufragantesLetras = '',
    this.totalSufragantesCentena = 0,
    this.totalSufragantesDecena = 0,
    this.totalSufragantesUnidad = 0,
    this.votosBlancosLetras = '',
    this.votosBlancosCentena = 0,
    this.votosBlancosDecena = 0,
    this.votosBlancosUnidad = 0,
    this.votosNulosLetras = '',
    this.votosNulosCentena = 0,
    this.votosNulosDecena = 0,
    this.votosNulosUnidad = 0,
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
      totalSufragantesLetras: totalSufragantesLetras ?? this.totalSufragantesLetras,
      totalSufragantesCentena: totalSufragantesCentena ?? this.totalSufragantesCentena,
      totalSufragantesDecena: totalSufragantesDecena ?? this.totalSufragantesDecena,
      totalSufragantesUnidad: totalSufragantesUnidad ?? this.totalSufragantesUnidad,
      votosBlancosLetras: votosBlancosLetras ?? this.votosBlancosLetras,
      votosBlancosCentena: votosBlancosCentena ?? this.votosBlancosCentena,
      votosBlancosDecena: votosBlancosDecena ?? this.votosBlancosDecena,
      votosBlancosUnidad: votosBlancosUnidad ?? this.votosBlancosUnidad,
      votosNulosLetras: votosNulosLetras ?? this.votosNulosLetras,
      votosNulosCentena: votosNulosCentena ?? this.votosNulosCentena,
      votosNulosDecena: votosNulosDecena ?? this.votosNulosDecena,
      votosNulosUnidad: votosNulosUnidad ?? this.votosNulosUnidad,
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
  final String votosLetras;
  final int votosCentena;
  final int votosDecena;
  final int votosUnidad;

  const VotoEntity({
    required this.id,
    required this.actaId,
    required this.organizacionId,
    this.votos = 0,
    this.votosLetras = '',
    this.votosCentena = 0,
    this.votosDecena = 0,
    this.votosUnidad = 0,
  });

  VotoEntity copyWith({
    String? id,
    String? actaId,
    String? organizacionId,
    int? votos,
    String? votosLetras,
    int? votosCentena,
    int? votosDecena,
    int? votosUnidad,
  }) {
    return VotoEntity(
      id: id ?? this.id,
      actaId: actaId ?? this.actaId,
      organizacionId: organizacionId ?? this.organizacionId,
      votos: votos ?? this.votos,
      votosLetras: votosLetras ?? this.votosLetras,
      votosCentena: votosCentena ?? this.votosCentena,
      votosDecena: votosDecena ?? this.votosDecena,
      votosUnidad: votosUnidad ?? this.votosUnidad,
    );
  }
}
