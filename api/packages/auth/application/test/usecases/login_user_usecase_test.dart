import 'package:flutter_architecture_api_auth_application/application.dart';
import 'package:flutter_architecture_api_shared_domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../helpers/mocks.dart';

void main() {
  late MockAuthRepository authRepository;
  late MockTokenService tokenService;
  late LoginUserUseCase useCase;

  setUpAll(() {
    registerFallbackValue(AuthUserFake());
  });

  setUp(() {
    authRepository = MockAuthRepository();
    tokenService = MockTokenService();

    useCase = LoginUserUseCase(
      authRepository,
      tokenService,
    );
  });

  test('should return AuthUser and token when login is successful', () async {
    const id = 1;
    const emailAddress = 'test@example.com';
    const password = 'password123';
    const token = 'fake-jwt-token';

    final fakeUser = AuthUser(
      id: id,
      emailAddress: EmailAddress.parse(emailAddress),
    );

    when(
      () => authRepository.login(
        emailAddress: any(named: 'emailAddress'),
        password: any(named: 'password'),
      ),
    ).thenAnswer(
      (_) async => fakeUser,
    );

    when(
      () => tokenService.createTokenForUser(any()),
    ).thenAnswer(
      (_) async => token,
    );

    final result = await useCase.execute(
      emailAddress: emailAddress,
      password: password,
    );

    expect(result, isNotNull);
    expect(result?.user, equals(fakeUser));
    expect(result?.token, equals(token));

    verify(
      () => authRepository.login(
        emailAddress: any(named: 'emailAddress'),
        password: any(named: 'password'),
      ),
    ).called(1);

    verify(
      () => tokenService.createTokenForUser(fakeUser),
    ).called(1);
  });

  test('should return null when login fails', () async {
    when(
      () => authRepository.login(
        emailAddress: any(named: 'emailAddress'),
        password: any(named: 'password'),
      ),
    ).thenAnswer((_) async => null);

    final result = await useCase.execute(
      emailAddress: 'wrong@example.com',
      password: 'wrongpass',
    );

    expect(result, isNull);

    verify(
      () => authRepository.login(
        emailAddress: any(named: 'emailAddress'),
        password: any(named: 'password'),
      ),
    ).called(1);

    verifyNever(
      () => tokenService.createTokenForUser(any()),
    );
  });
}
