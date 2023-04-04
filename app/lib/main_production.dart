import 'package:middelkamp_dev_app/src/main_delegate.dart';
import 'package:shared_domain/models.dart';

Future<void> main() async {
  await mainDelegate(
    environment: Environment.production,
    authMicroServiceBaseUrl: 'PRODUCTION_API_URL',
    userMicroServiceBaseUrl: 'PRODUCTION_API_URL',
    projectMicroServiceBaseUrl: 'PRODUCTION_API_URL',
  );
}
