// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../domain/usecase/usecase.dart';

// class AuthProvider extends StateNotifier<AuthState> {
//   final AuthUseCase authUseCase;

//   AuthProvider(this.authUseCase) : super(AuthState());

//   String email = '';
//   String password = '';
//   String name = '';

//   Future<void> register() async {
//     await authUseCase.register(email, password, name);
//   }

//   Future<void> login() async {
//     await authUseCase.login(email, password);
//   }

//   Future<void> logout() async {
//     await authUseCase.logout();
//   }
// }

// class AuthState {
// }

// final authProvider = StateNotifierProvider<AuthProvider, AuthState>((ref) {
//   final authUseCase = ref.read(authUseCaseProvider);
//   return AuthProvider(authUseCase);
// });


// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../data/appwrite/auth.dart';
// import '../../data/repositories/user_repository.dart';
// import '../../domain/usecase/usecase.dart';

// final authServiceProvider = Provider((ref) => AuthService());
// final userRepositoryProvider = Provider((ref) => UserRepository(ref.read(authServiceProvider)));
// final authProvider = Provider((ref) => AuthUseCase(ref.read(userRepositoryProvider)));

import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/appwrite/auth.dart';
import '../../data/repositories/user_repository.dart';
import '../../domain/usecase/usecase.dart';

// Provider untuk Client Appwrite
final appwriteClientProvider = Provider<Client>((ref) {
  Client client = Client();
  client
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject('66e515170024113d12b5');
  return client;
});

// Provider untuk Account Appwrite
final accountProvider = Provider<Account>((ref) {
  return Account(ref.read(appwriteClientProvider));
});

// Provider untuk AuthService yang membutuhkan Account
final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(ref.read(accountProvider));
});

// Provider untuk UserRepository yang menggunakan AuthService
final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository(ref.read(authServiceProvider));
});

// Provider untuk AuthUseCase yang menggunakan UserRepository
final authProvider = Provider<AuthUseCase>((ref) {
  return AuthUseCase(ref.read(userRepositoryProvider));
});
