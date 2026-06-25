import '../repositories/auth_repository.dart';

class ChangePasswordUseCase {
  final AuthRepository _repository;
  ChangePasswordUseCase(this._repository);

  Future<void> call(String oldPassword, String newPassword) {
    return _repository.changePassword(oldPassword, newPassword);
  }
}
