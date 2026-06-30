import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> login(String cedula, String password);
  Future<void> changePassword(String oldPassword, String newPassword);
  Future<void> recoverPassword(String email);
  Future<void> logout();
  Future<UserEntity?> getCurrentUser();
  Future<void> markPasswordChanged();
  Future<bool> isPasswordChanged();
}
