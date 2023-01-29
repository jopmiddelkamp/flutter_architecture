import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_architecture_api_auth_application/application.dart';
import 'package:flutter_architecture_api_auth_presentation_dart_frog/presentation.dart';
import 'package:flutter_architecture_api_shared_domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../helpers/mocks.dart';

void main() {
  // Mocks
  late MockRequestContext context;
  late MockLoginUserUseCase loginUserUseCase;

  // Controller
  late PostLoginController controller;

  setUp(() {
    context = MockRequestContext();

    loginUserUseCase = MockLoginUserUseCase();

    controller = PostLoginController(
      loginUserUseCase,
    );
  });

  group('Login Route', () {
    test('returns 405 if method is not POST', () async {
      when(
        () => context.request,
      ).thenReturn(
        MockRequest(HttpMethod.get),
      );

      final response = await controller.handle(context);

      expect(response.statusCode, equals(405));
    });

    test('returns 400 if body is missing', () async {
      when(
        () => context.request,
      ).thenReturn(
        MockRequest(HttpMethod.post),
      );

      final response = await controller.handle(context);

      expect(response.statusCode, equals(400));
    });

    test('returns 401 if credentials are invalid', () async {
      when(
        () => context.request,
      ).thenReturn(
        MockRequest(
          HttpMethod.post,
          body: {
            'emailAddress': 'test@example.com',
            'password': 'wrong-password',
          },
        ),
      );

      when(
        () => loginUserUseCase.execute(
          emailAddress: any(named: 'emailAddress'),
          password: any(named: 'password'),
        ),
      ).thenAnswer(
        (_) async => null,
      );

      final response = await controller.handle(context);

      expect(response.statusCode, equals(401));
    });

    test('returns 200 with LoginResponse if credentials are valid', () async {
      final emailAddress = EmailAddress.parse('test@example.com');

      when(
        () => context.request,
      ).thenReturn(
        MockRequest(
          HttpMethod.post,
          body: {
            'emailAddress': emailAddress.value,
            'password': 'correct-password',
          },
        ),
      );

      when(
        () => loginUserUseCase.execute(
          emailAddress: any(named: 'emailAddress'),
          password: any(named: 'password'),
        ),
      ).thenAnswer(
        (_) async => LoginUseCaseOutput(
          user: AuthUser(
            id: 1,
            emailAddress: emailAddress,
          ),
          token: 'token-123',
        ),
      );

      final response = await controller.handle(context);

      expect(response.statusCode, equals(200));
    });
  });
}
