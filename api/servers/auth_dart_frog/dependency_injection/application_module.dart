import 'package:flutter_architecture_api_auth_application/application.dart';
import 'package:flutter_architecture_api_auth_domain/domain.dart';
import 'package:flutter_architecture_api_shared_application/application.dart';
import 'package:flutter_architecture_api_shared_domain/domain.dart';
import 'package:flutter_architecture_api_shared_presentation_dart_frog/presentation.dart';

class AuthApplicationModule {
  const AuthApplicationModule._();

  static void registerAll(DependencyInjectionHelper helper) {
    final authRepository = helper.resolve<AuthRepository>();
    final authUserIdGenerator = helper.resolve<AuthUserIdGenerator>();
    final emailAddressValidator = helper.resolve<EmailAddressValidator>();

    final tokenService = helper.resolve<TokenService>();

    helper
      ..register<RegisterUserUseCase>(
        RegisterUserUseCase(
          authRepository,
          authUserIdGenerator,
          emailAddressValidator,
        ),
      )
      ..register<LoginUserUseCase>(
        LoginUserUseCase(
          authRepository,
          tokenService,
        ),
      )
      ..register<LogoutUserUseCase>(
        LogoutUserUseCase(
          authRepository,
        ),
      );
  }
}
