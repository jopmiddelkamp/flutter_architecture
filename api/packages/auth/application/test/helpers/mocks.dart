import 'package:flutter_architecture_api_auth_application/application.dart';
import 'package:flutter_architecture_api_auth_domain/domain.dart';
import 'package:flutter_architecture_api_shared_application/application.dart';
import 'package:flutter_architecture_api_shared_domain/domain.dart';
import 'package:mocktail/mocktail.dart';

// application
class MockLoginUserUseCase extends Mock implements LoginUserUseCase {}

class MockRegisterUserUseCase extends Mock implements RegisterUserUseCase {}

class MockLogoutUserUseCase extends Mock implements LogoutUserUseCase {}

class MockTokenService extends Mock implements TokenService {}

// domain
class MockEmailAddressValidator extends Mock implements EmailAddressValidator {}

class MockAuthUserIdGenerator extends Mock implements AuthUserIdGenerator {}

class MockAuthRepository extends Mock implements AuthRepository {}

class AuthUserFake extends Fake implements AuthUser {}
