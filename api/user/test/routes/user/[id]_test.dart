import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../routes/users/index.dart' as route;

class _MockRequestContext extends Mock implements RequestContext {}

class _MockRequest extends Mock implements Request {}

void main() {
  group('POST /user', () {
    test('responds with a 200".', () async {
      // Arrange
      const accountId = '1';
      const username = 'jop';
      const email = 'jop@foo.bar';
      const phoneNumber = '+31612345678';

      final requestContext = _MockRequestContext();
      final request = _MockRequest();
      when(() => requestContext.request).thenReturn(request);
      final data = <String, dynamic>{
        'account_id': accountId,
        'username': username,
        'email': email,
        'phone_number': phoneNumber,
      };
      when(() => request.method).thenReturn(HttpMethod.post);
      when(request.json).thenAnswer((_) async => data as dynamic);

      // Act
      final response = await route.onRequest(requestContext);

      // Assert
      expect(response.statusCode, equals(HttpStatus.ok));

      final responseJson = await response.json() as Map<String, dynamic>;
      expect(
        responseJson['user_id'],
        isNotEmpty,
      );
    });
  });
}
