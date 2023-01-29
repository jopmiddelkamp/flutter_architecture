import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_architecture_api_auth_presentation_dart_frog/presentation.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../routes/register/index.dart' as register_route;
import '../../helpers/mocks.dart';

void main() {
  late MockRequestContext context;
  late MockPostRegisterController controller;

  setUpAll(() {
    registerFallbackValue(RequestContextFake());
  });

  setUp(() {
    context = MockRequestContext();
    controller = MockPostRegisterController();
    when(
      () => context.read<PostRegisterController>(),
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

  group('Register Route', () {
    test('returns called correct controller on POST request', () async {
      when(
        () => context.request,
      ).thenReturn(
        MockRequest(HttpMethod.post),
      );

      await register_route.onRequest(context);

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

        final response = await register_route.onRequest(context);

        expect(response.statusCode, equals(405));
      }
    });
  });
}
