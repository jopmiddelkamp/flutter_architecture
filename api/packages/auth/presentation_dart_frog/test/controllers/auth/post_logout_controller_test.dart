import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_architecture_api_auth_presentation_dart_frog/presentation.dart';
import 'package:flutter_architecture_api_shared_domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../helpers/mocks.dart';

void main() {
  // Mocks
  late MockRequestContext context;
  late MockLogoutUserUseCase logoutUserUseCase;

  // Controller
  late PostLogoutController controller;

  setUp(() {
    context = MockRequestContext();

    logoutUserUseCase = MockLogoutUserUseCase();

    controller = PostLogoutController(
      logoutUserUseCase,
    );
  });

  group('Logout Route', () {
    test('returns 405 if method is not POST', () async {
      when(
        () => context.request,
      ).thenReturn(
        MockRequest(HttpMethod.get),
      );

      final response = await controller.handle(context);

      expect(response.statusCode, equals(405));
    });

    test('returns 200 after logout', () async {
      when(
        () => context.request,
      ).thenReturn(
        MockRequest(HttpMethod.post),
      );
      when(
        () => context.read<AuthUser>(),
      ).thenReturn(
        AuthUser(
          id: 1,
          emailAddress: EmailAddress.parse('test@example.com'),
        ),
      );

      when(
        () => logoutUserUseCase.execute(),
      ).thenAnswer(
        (_) async {},
      );

      final response = await controller.handle(context);

      expect(response.statusCode, equals(200));
    });
  });
}
