import 'package:back_end/api_clients.dart';
import 'package:feature_auth_domain/repositories.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.authApiClient,
  });

  final AuthApiClient authApiClient;

  @override
  Future<String> login(
    String username,
    String password,
  ) async {
    final token = await authApiClient.login(
      username,
      password,
    );
    return token;
  }
}
