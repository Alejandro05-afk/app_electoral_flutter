import 'package:appwrite/appwrite.dart';
import 'package:control_electoral/core/appwrite/appwrite_client.dart';
import 'package:control_electoral/features/auth/domain/entities/user_entity.dart';

class AppwriteAuthDatasource {
  final Account _account;
  final Databases _db;

  AppwriteAuthDatasource(this._account, this._db);

  Future<UserEntity> login(String cedula, String password) async {
    final email = '$cedula@controlelectoral.local';
    try {
      await _account.deleteSession(sessionId: 'current');
    } catch (_) {}
    await _account.createEmailPasswordSession(email: email, password: password);

    final appwriteUser = await _account.get();
    final docs = await _db.listDocuments(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.usersProfileCollection,
      queries: [Query.equal('user_id', appwriteUser.$id)],
    );
    final profile = docs.documents.first.data;

    return UserEntity(
      id: appwriteUser.$id,
      cedula: profile['cedula'],
      nombres: profile['nombres'],
      apellidos: profile['apellidos'],
      role: profile['role'],
      mustChangePassword: profile['must_change_password'] ?? false,
      recintoId: profile['recinto_id'],
    );
  }

  Future<void> changePassword(String oldPass, String newPass) async {
    await _account.updatePassword(password: newPass, oldPassword: oldPass);
  }

  Future<void> recoverPassword(String email) async {
    await _account.createRecovery(
      email: email,
      url: '${AppwriteConfig.recoveryUrl}/password-reset',
    );
  }

  Future<void> markPasswordChanged() async {
    await _account.updatePrefs(prefs: {'password_changed': true});
  }

  Future<bool> isPasswordChanged() async {
    try {
      final prefs = await _account.getPrefs();
      return prefs.data['password_changed'] == true;
    } catch (_) {
      return false;
    }
  }

  Future<void> logout() async {
    try {
      await _account.deleteSession(sessionId: 'current');
    } catch (_) {}
  }

  Future<UserEntity?> getCurrentUser() async {
    try {
      final appwriteUser = await _account.get();
      final docs = await _db.listDocuments(
        databaseId: AppwriteConfig.databaseId,
        collectionId: AppwriteConfig.usersProfileCollection,
      queries: [Query.equal('user_id', appwriteUser.$id)],
      );
      if (docs.documents.isEmpty) return null;
      final profile = docs.documents.first.data;
      return UserEntity(
        id: appwriteUser.$id,
        cedula: profile['cedula'],
        nombres: profile['nombres'],
        apellidos: profile['apellidos'],
        role: profile['role'],
        mustChangePassword: profile['must_change_password'] ?? false,
        recintoId: profile['recinto_id'],
      );
    } catch (_) {
      return null;
    }
  }
}
