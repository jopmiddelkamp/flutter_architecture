import 'package:back_end/api_clients.dart';
import 'package:dio/dio.dart';
import 'package:feature_auth_data/src/repositories/repositories.dart';
import 'package:feature_auth_domain/repositories.dart';
import 'package:shared_domain/dependency_injection.dart';

Future<void> bootstrap({
  required Dio dio,
}) async {
  final authRepository = AuthRepositoryImpl(
    authApiClient: AuthApiClient(
      dio: dio,
    ),
  );
  Di.instance.registerSingleton<AuthRepository>(authRepository);
}
