class RecintoEntity {
  final String id;
  final String canton;
  final String parroquia;
  final String nombre;
  final int numJrv;
  final String? coordinadorId;
  final String createdBy;

  const RecintoEntity({
    required this.id,
    required this.canton,
    required this.parroquia,
    required this.nombre,
    required this.numJrv,
    this.coordinadorId,
    required this.createdBy,
  });
}
