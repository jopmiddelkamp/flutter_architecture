import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_architecture_api_auth_application/application.dart';
import 'package:flutter_architecture_api_auth_domain/domain.dart';
import 'package:flutter_architecture_api_shared_application/application.dart';
import 'package:flutter_architecture_api_shared_domain/domain.dart';
import 'package:mocktail/mocktail.dart';

// application
class MockLoginUserUseCase extends Mock implements LoginUserUseCase {}

class MockRegisterUserUseCase extends Mock implements RegisterUserUseCase {}

class MockLogoutUserUseCase extends Mock implements LogoutUserUseCase {}

// domain
class MockAuthRepository extends Mock implements AuthRepository {}

class FakeAuthUser extends Fake implements AuthUser {}

class MockTokenService extends Mock implements TokenService {}

// dart_frog
class MockRequestContext extends Mock implements RequestContext {}

class MockRequest extends Mock implements Request {
  MockRequest(
    HttpMethod method, {
    Map<String, dynamic>? body,
  })  : _method = method,
        _body = body;

  late final HttpMethod _method;
  late final Map<String, dynamic>? _body;

  @override
  HttpMethod get method => _method;

  @override
  Future<Map<String, dynamic>?> json() async => _body;
}
