import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_architecture_api_auth_presentation_dart_frog/presentation.dart';
import 'package:flutter_architecture_api_shared_domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../helpers/mocks.dart';

void main() {
  // Mocks
  late MockRequestContext context;

  // Controller
  late GetProfileController controller;

  setUp(() {
    context = MockRequestContext();
    controller = const GetProfileController();
  });

  group('Profile Route', () {
    test('returns 200 with ProfileResponse', () async {
      when(
        () => context.request,
      ).thenReturn(
        MockRequest(HttpMethod.get),
      );

      when(
        () => context.read<AuthUser>(),
      ).thenReturn(
        AuthUser(
          id: 1,
          emailAddress: EmailAddress.parse('test@example.com'),
        ),
      );

      final response = await controller.handle(context);

      expect(response.statusCode, equals(200));
    });
  });
}
