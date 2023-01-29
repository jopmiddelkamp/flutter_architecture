import 'package:flutter_architecture_api_shared_domain/domain.dart';

abstract class AuthRepository {
  Future<AuthUser?> login({
    required String emailAddress,
    required String password,
  });

  Future<void> logout();

  Future<void> register(AuthUser user);
}
