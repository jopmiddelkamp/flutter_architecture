import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_architecture_api_auth_presentation_dart_frog/presentation.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../routes/profile/index.dart' as profile_route;
import '../../helpers/mocks.dart';

void main() {
  late MockRequestContext context;
  late MockGetProfileController controller;

  setUpAll(() {
    registerFallbackValue(RequestContextFake());
  });

  setUp(() {
    context = MockRequestContext();
    controller = MockGetProfileController();
    when(
      () => context.read<GetProfileController>(),
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

  group('Profile Route', () {
    test('returns called correct controller on GET request', () async {
      when(
        () => context.request,
      ).thenReturn(
        MockRequest(HttpMethod.get),
      );

      await profile_route.onRequest(context);

      verify(
        () => controller.handle(any()),
      ).called(1);
    });

    test('returns 405 if method should not exist', () async {
      final statusCodes = [
        HttpMethod.post,
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

        final response = await profile_route.onRequest(context);

        expect(response.statusCode, equals(405));
      }
    });
  });
}
