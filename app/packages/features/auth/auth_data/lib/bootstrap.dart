import 'package:back_end/api_clients.dart';
import 'package:dio/dio.dart';
import 'package:feature_auth_data/src/repositories/repositories.dart';
import 'package:feature_auth_domain/repositories.dart';
import 'package:shared_data/mediators.dart';
import 'package:shared_domain/dependency_injection.dart';

Future<void> bootstrap({
  required String authApiBaseUrl,
}) async {
  final authClient = AuthApiClient(
    dio: Dio(
      BaseOptions(
        baseUrl: authApiBaseUrl,
      ),
    ),
  );

  Di.instance.registerSingletonAsync<AuthRepository>(
    () async => AuthRepositoryImpl(
      authApiClient: authClient,
      authUserMediator: Di.instance.get<AuthUserMediator>(),
      tokenMediator: Di.instance.get<TokenMediator>(),
    ),
  );
}
