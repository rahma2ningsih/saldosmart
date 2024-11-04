
import '../appwrite/auth.dart';

class UserRepository {
  final AuthService _authService;

  UserRepository(this._authService);

  Future<void> signUp(String email, String password) => _authService.signUp(email, password);

  Future<void> signIn(String email, String password) => _authService.signIn(email, password);

  Future<void> signOut() => _authService.signOut();
}
