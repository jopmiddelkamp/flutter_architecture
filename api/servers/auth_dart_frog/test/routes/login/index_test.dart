import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_architecture_api_auth_presentation_dart_frog/presentation.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../routes/login/index.dart' as login_route;
import '../../helpers/mocks.dart';

void main() {
  late MockRequestContext context;
  late MockPostLoginController controller;

  setUpAll(() {
    registerFallbackValue(RequestContextFake());
  });

  setUp(() {
    context = MockRequestContext();
    controller = MockPostLoginController();
    when(
      () => context.read<PostLoginController>(),
    ).thenReturn(
      controller,
    );
    when(
      () => controller.handle(any()),
    ).thenAnswer(
      (_) async => Response.json(
        body: {},
      ),
    );
  });

  group('Login Route', () {
    test('returns called correct controller on POST request', () async {
      when(
        () => context.request,
      ).thenReturn(
        MockRequest(HttpMethod.post),
      );

      await login_route.onRequest(context);

      verify(
        () => controller.handle(any()),
      ).called(1);
    });

    test('returns 405 if method should not exist', () async {
      final statusCodes = [
        HttpMethod.get,
        HttpMethod.delete,
        HttpMethod.head,
        HttpMethod.options,
        HttpMethod.patch,
        HttpMethod.put,
      ];

      for (final statusCode in statusCodes) {
        when(
          () => context.request,
        ).thenReturn(
          MockRequest(statusCode),
        );

        final response = await login_route.onRequest(context);

        expect(response.statusCode, equals(405));
      }
    });
  });
}
