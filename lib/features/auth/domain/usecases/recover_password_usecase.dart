import '../repositories/auth_repository.dart';

class RecoverPasswordUseCase {
  final AuthRepository _repository;
  RecoverPasswordUseCase(this._repository);

  Future<void> call(String email) {
    return _repository.recoverPassword(email);
  }
}
