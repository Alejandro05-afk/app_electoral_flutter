class UserEntity {
  final String id;
  final String cedula;
  final String nombres;
  final String apellidos;
  final String role;
  final bool mustChangePassword;
  final String? recintoId;

  const UserEntity({
    required this.id,
    required this.cedula,
    required this.nombres,
    required this.apellidos,
    required this.role,
    required this.mustChangePassword,
    this.recintoId,
  });

  UserEntity copyWith({
    String? id,
    String? cedula,
    String? nombres,
    String? apellidos,
    String? role,
    bool? mustChangePassword,
    String? recintoId,
  }) {
    return UserEntity(
      id: id ?? this.id,
      cedula: cedula ?? this.cedula,
      nombres: nombres ?? this.nombres,
      apellidos: apellidos ?? this.apellidos,
      role: role ?? this.role,
      mustChangePassword: mustChangePassword ?? this.mustChangePassword,
      recintoId: recintoId ?? this.recintoId,
    );
  }
}
