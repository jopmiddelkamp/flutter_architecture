import 'package:flutter_architecture_api_shared_domain/domain.dart';

class LoginUseCaseOutput {
  const LoginUseCaseOutput({
    required this.user,
    required this.token,
  });

  final AuthUser user;
  final String token;
}
