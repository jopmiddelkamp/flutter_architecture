import 'package:flutter_architecture_api_auth_domain/domain.dart';
import 'package:flutter_architecture_api_shared_domain/domain.dart';

import '../models/output/usecase/register_use_case_output.dart';

class RegisterUserUseCase {
  const RegisterUserUseCase(
    this._authRepository,
    this._authUserIdGenerator,
    this._emailAddressValidator,
  );

  final AuthRepository _authRepository;
  final AuthUserIdGenerator _authUserIdGenerator;
  final EmailAddressValidator _emailAddressValidator;

  Future<RegisterUseCaseOutput> execute({
    required String emailAddress,
    required String password,
  }) async {
    final id = await _authUserIdGenerator.nextId();
    final validEmailAddress = _emailAddressValidator.validate(emailAddress);
    final user = AuthUser(
      id: id,
      emailAddress: validEmailAddress,
    );
    await _authRepository.register(user);
    return RegisterUseCaseOutput(
      user: user,
    );
  }
}
