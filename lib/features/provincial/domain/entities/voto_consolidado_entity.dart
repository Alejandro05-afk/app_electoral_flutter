class VotoConsolidado {
  final String organizacionId;
  final String organizacionNombre;
  final int numeroLista;
  final String candidatoNombre;
  final int totalVotos;

  const VotoConsolidado({
    required this.organizacionId,
    required this.organizacionNombre,
    required this.numeroLista,
    required this.candidatoNombre,
    required this.totalVotos,
  });
}

class ConsolidadoRecinto {
  final String recintoId;
  final String recintoNombre;
  final List<VotoConsolidado> votos;

  const ConsolidadoRecinto({
    required this.recintoId,
    required this.recintoNombre,
    required this.votos,
  });
}

class ConsolidadoDignidad {
  final String dignidad;
  final List<VotoConsolidado> general;
  final List<ConsolidadoRecinto> porRecinto;

  const ConsolidadoDignidad({
    required this.dignidad,
    required this.general,
    required this.porRecinto,
  });
}
