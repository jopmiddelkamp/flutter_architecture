import 'package:flutter_architecture_api_shared_domain/domain.dart';

abstract class TokenService {
  Future<String> createTokenForUser(AuthUser user);
  Future<AuthUser> parseUserFromToken(String token);
}
