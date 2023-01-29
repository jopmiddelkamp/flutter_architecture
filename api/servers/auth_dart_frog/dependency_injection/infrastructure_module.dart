import 'package:flutter_architecture_api_auth_domain/domain.dart';
import 'package:flutter_architecture_api_auth_infrastructure/infrastructure.dart';
import 'package:flutter_architecture_api_auth_infrastructure/tokens/tokens.dart';
import 'package:flutter_architecture_api_shared_application/application.dart';
import 'package:flutter_architecture_api_shared_domain/domain.dart';
import 'package:flutter_architecture_api_shared_infrastructure/infrastructure.dart';
import 'package:flutter_architecture_api_shared_presentation_dart_frog/presentation.dart';

class AuthInfrastructureModule {
  const AuthInfrastructureModule._();

  static void registerAll(DependencyInjectionHelper helper) {
    final dataSource = InMemoryAuthUserLocalDataSource();
    const mapper = AuthUserInfrastructureMapper();

    helper
      ..register<AuthRepository>(
        AuthRepositoryImpl(dataSource, mapper),
      )
      ..register<AuthUserIdGenerator>(
        InMemoryAuthUserIdGenerator(dataSource),
      )
      ..register<EmailAddressValidator>(
        const EmailAddressValidatorImpl(),
      )
      ..register<TokenService>(
        // Make sure to use a secure secret in production and to configure
        // the same value in the other micro services so they can validate
        // the token and so validate the token generated in this micro service.
        const JwtTokenService('your-very-secure-secret-here'),
      );
  }
}
