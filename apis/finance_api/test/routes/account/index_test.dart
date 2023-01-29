import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../routes/account/index.dart' as route;

class _MockRequestContext extends Mock implements RequestContext {}

class _MockRequest extends Mock implements Request {}

void main() {
  group('POST /account', () {
    test('responds with a 200".', () async {
      // Arrange
      const accountId = '1';
      const signature = 'Zmx1dHRlcl9hcmNoaXRlY3R1cmU=';

      final requestContext = _MockRequestContext();
      final request = _MockRequest();
      when(() => requestContext.request).thenReturn(request);
      final data = <String, dynamic>{
        'account_data': {
          'account_id': accountId,
          'signature': signature,
        }
      };
      when(() => request.method).thenReturn(HttpMethod.post);
      when(request.json).thenAnswer((_) async => data as dynamic);

      // Act
      final response = await route.onRequest(requestContext);

      // Assert
      expect(response.statusCode, equals(HttpStatus.ok));

      final responseJson = await response.json() as Map<String, dynamic>;
      expect(
        responseJson['account_id'],
        equals(accountId),
      );
    });
  });
}
