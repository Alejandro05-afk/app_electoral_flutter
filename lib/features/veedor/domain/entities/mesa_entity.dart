class MesaEntity {
  final String id;
  final String recintoId;
  final int numeroMesa;
  final String? veedorId;
  final String estado;

  const MesaEntity({
    required this.id,
    required this.recintoId,
    required this.numeroMesa,
    this.veedorId,
    required this.estado,
  });
}
