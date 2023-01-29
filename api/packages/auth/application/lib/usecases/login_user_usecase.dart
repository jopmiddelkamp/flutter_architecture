import 'package:flutter_architecture_api_auth_domain/domain.dart';
import 'package:flutter_architecture_api_shared_application/application.dart';

import '../models/output/usecase/login_use_case_output.dart';

class LoginUserUseCase {
  const LoginUserUseCase(
    this._authRepository,
    this._tokenService,
  );

  final AuthRepository _authRepository;
  final TokenService _tokenService;

  Future<LoginUseCaseOutput?> execute({
    required String emailAddress,
    required String password,
  }) async {
    final user = await _authRepository.login(
      emailAddress: emailAddress,
      password: password,
    );
    if (user == null) {
      return null;
    }
    final token = await _tokenService.createTokenForUser(user);
    return LoginUseCaseOutput(
      user: user,
      token: token,
    );
  }
}
