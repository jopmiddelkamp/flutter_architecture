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
  late MockRegisterUserUseCase registerUserUseCase;
  // Controller
  late PostRegisterController controller;

  setUp(() {
    context = MockRequestContext();

    registerUserUseCase = MockRegisterUserUseCase();

    controller = PostRegisterController(
      registerUserUseCase,
    );
  });

  group('Register Route', () {
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

    test('returns 200 with RegisterResponse if registration succeeds',
        () async {
      final emailAddress = EmailAddress.parse('new@example.com');

      when(
        () => context.request,
      ).thenReturn(
        MockRequest(
          HttpMethod.post,
          body: {
            'emailAddress': emailAddress.value,
            'password': 'password123',
          },
        ),
      );

      when(
        () => registerUserUseCase.execute(
          emailAddress: any(named: 'emailAddress'),
          password: any(named: 'password'),
        ),
      ).thenAnswer(
        (_) async => RegisterUseCaseOutput(
          user: AuthUser(
            id: 1,
            emailAddress: emailAddress,
          ),
        ),
      );

      final response = await controller.handle(context);

      expect(response.statusCode, equals(200));
    });
  });
}
