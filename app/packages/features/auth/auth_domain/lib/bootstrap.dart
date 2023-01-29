import 'package:feature_auth_domain/repositories.dart';
import 'package:feature_auth_domain/services.dart';
import 'package:shared_domain/dependency_injection.dart';

Future<void> bootstrap() async {
  final authService = AuthService(
    authRepository: Di.instance.get<AuthRepository>(),
  );

  Di.instance.registerSingleton<AuthService>(authService);
}
