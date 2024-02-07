import 'package:feature_auth_domain/repositories.dart';

class AuthService {
  AuthService({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  Future<void> login(
    String username,
    String password,
  ) async {
    final result = await _authRepository.login(
      username,
      password,
    );
    return result;
  }

  Future<void> logout() async {
    await _authRepository.logout();
  }
}
