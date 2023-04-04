import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../routes/auth/login/index.dart' as route;

class _MockRequestContext extends Mock implements RequestContext {}

class _MockRequest extends Mock implements Request {}

void main() {
  group('POST /account', () {
    test('responds with a 200".', () async {
      // Arrange
      const username = 'admin';
      const password = 'admin';

      final requestContext = _MockRequestContext();
      final request = _MockRequest();
      when(() => requestContext.request).thenReturn(request);
      final data = <String, dynamic>{
        'username': username,
        'password': password,
      };
      when(() => request.method).thenReturn(HttpMethod.post);
      when(request.json).thenAnswer((_) async => data as dynamic);

      // Act
      final response = await route.onRequest(requestContext);

      // Assert
      expect(response.statusCode, equals(HttpStatus.ok));

      final responseJson = await response.json() as Map<String, dynamic>;
      final expectedToken = base64Encode(utf8.encode('1:$username:$password'));
      expect(
        responseJson['token'],
        equals(expectedToken),
      );
    });

    test('responds with a 400 invalid username or password".', () async {
      // Arrange
      const username = 'foo';
      const password = 'bar';

      final requestContext = _MockRequestContext();
      final request = _MockRequest();
      when(() => requestContext.request).thenReturn(request);
      final data = <String, dynamic>{
        'username': username,
        'password': password,
      };
      when(() => request.method).thenReturn(HttpMethod.post);
      when(request.json).thenAnswer((_) async => data as dynamic);

      // Act
      final response = await route.onRequest(requestContext);

      // Assert
      expect(response.statusCode, equals(HttpStatus.badRequest));
    });
  });
}
