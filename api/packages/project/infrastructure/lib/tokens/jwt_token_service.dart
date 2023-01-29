import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter_architecture_api_shared_application/application.dart';
import 'package:flutter_architecture_api_shared_domain/domain.dart';

/// Service to create and parse JWT tokens.
///
/// This service in a micro service architecture would be duplicate and
/// maintained in each seperate micro service.
///
/// Each microservice is independently deployable and should not depend on
/// the internal implementation of another service.
///
/// TokenService in each service is responsible for validating tokens
/// according to its own config (e.g., secret, public key, accepted claims).
class JwtTokenService implements TokenService {
  const JwtTokenService(
    this._jwtSecret,
  );

  final String _jwtSecret;

  @override
  Future<String> createTokenForUser(AuthUser user) async {
    final payload = {
      'id': user.id,
      'emailAddress': user.emailAddress,
    };

    final token = _encodeJwt(payload);
    return token;
  }

  @override
  Future<AuthUser> parseUserFromToken(String token) async {
    final payload = _decodeJwt(token);

    final id = payload['id'] as int?;
    final emailAddress = payload['emailAddress'] as String?;

    if (id == null || emailAddress == null) {
      throw Exception('Invalid token payload');
    }

    return AuthUser(
      id: id,
      emailAddress: EmailAddress.parse(emailAddress),
    );
  }

  String _encodeJwt(Map<String, dynamic> payload) {
    final jwt = JWT(payload);
    return jwt.sign(SecretKey(_jwtSecret));
  }

  Map<String, dynamic> _decodeJwt(String token) {
    try {
      final jwt = JWT.verify(token, SecretKey(_jwtSecret));
      return jwt.payload as Map<String, dynamic>;
    } on JWTExpiredException {
      throw Exception('JWT has expired');
    } on JWTException catch (e) {
      throw Exception('Invalid JWT: $e');
    }
  }
}
