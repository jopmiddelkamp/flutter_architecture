import 'package:flutter_architecture_api_shared_domain/domain.dart';

class RegisterUseCaseOutput {
  const RegisterUseCaseOutput({
    required this.user,
  });

  final AuthUser user;
}
