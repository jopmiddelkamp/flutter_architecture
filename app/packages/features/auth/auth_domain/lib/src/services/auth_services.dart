import 'package:feature_auth_domain/repositories.dart';

class AuthService {
  AuthService({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  Stream<String?> get token => _authRepository.token;

  Future<void> login(String username, String password) async {
    await _authRepository.login(username, password);
  }

  Future<void> logout() async {
    await _authRepository.logout();
  }
}
