import 'package:control_electoral/features/auth/domain/entities/user_entity.dart';
import 'package:control_electoral/features/auth/domain/repositories/auth_repository.dart';
import '../datasources/appwrite_auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AppwriteAuthDatasource _datasource;

  AuthRepositoryImpl(this._datasource);

  @override
  Future<UserEntity> login(String cedula, String password) {
    return _datasource.login(cedula, password);
  }

  @override
  Future<void> changePassword(String oldPassword, String newPassword) {
    return _datasource.changePassword(oldPassword, newPassword);
  }

  @override
  Future<void> recoverPassword(String email) {
    return _datasource.recoverPassword(email);
  }

  @override
  Future<void> logout() {
    return _datasource.logout();
  }

  @override
  Future<UserEntity?> getCurrentUser() {
    return _datasource.getCurrentUser();
  }
}
