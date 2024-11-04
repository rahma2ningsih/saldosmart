
import '../../data/repositories/user_repository.dart';

class AuthUseCase {
  final UserRepository _userRepository;

  AuthUseCase(this._userRepository);

  Future<void> signUp(String email, String password) => _userRepository.signUp(email, password);

  Future<void> signIn(String email, String password) => _userRepository.signIn(email, password);

  Future<void> signOut() => _userRepository.signOut();
}
