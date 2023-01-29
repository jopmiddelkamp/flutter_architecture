import 'package:flutter_architecture_api_auth_application/application.dart';
import 'package:flutter_architecture_api_shared_domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../helpers/mocks.dart';

void main() {
  const id = 1;

  setUpAll(() {
    registerFallbackValue(AuthUserFake());
  });

  late MockAuthRepository authRepository;

  late MockAuthUserIdGenerator authUserIdGenerator;
  late MockEmailAddressValidator emailAddressValidator;

  late RegisterUserUseCase useCase;

  setUp(() {
    authRepository = MockAuthRepository();
    authUserIdGenerator = MockAuthUserIdGenerator();
    emailAddressValidator = MockEmailAddressValidator();

    when(
      () => authUserIdGenerator.nextId(),
    ).thenAnswer(
      (_) async => id,
    );

    useCase = RegisterUserUseCase(
      authRepository,
      authUserIdGenerator,
      emailAddressValidator,
    );
  });

  test('should register user when email address is valid', () async {
    final emailAddress = EmailAddress.parse('test@example.com');
    when(
      () => emailAddressValidator.validate(any()),
    ).thenAnswer(
      (_) => emailAddress,
    );
    when(
      () => authRepository.register(any()),
    ).thenAnswer(
      (_) async => {},
    );
    final authUserOutput = AuthUser(
      id: 1,
      emailAddress: emailAddress,
    );

    final result = await useCase.execute(
      emailAddress: emailAddress.value,
      password: 'password123',
    );

    expect(
      result.user.id,
      equals(authUserOutput.id),
    );
    expect(
      result.user.emailAddress,
      equals(authUserOutput.emailAddress),
    );
    verify(
      () => emailAddressValidator.validate(any()),
    ).called(1);
    verify(
      () => authRepository.register(any()),
    ).called(1);
  });
}
