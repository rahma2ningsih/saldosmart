
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;

class AuthService {
  final Account _account;

  AuthService(this._account);

  Future<models.User?> signUp(String email, String password) async {
    try {
      return await _account.create(
        userId: 'unique()', 
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<models.Session?> signIn(String email, String password) async {
    try {
      return await _account.createEmailPasswordSession(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }


  Future<void> signOut() async {
    try {
      await _account.deleteSession(sessionId: 'current');
    } catch (e) {
      rethrow;
    }
  }
}

