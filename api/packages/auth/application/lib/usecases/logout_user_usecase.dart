import 'package:flutter_architecture_api_auth_domain/domain.dart';

class LogoutUserUseCase {
  const LogoutUserUseCase(this._authRepository);

  final AuthRepository _authRepository;

  Future<void> execute() async {
    await _authRepository.logout();
  }
}
