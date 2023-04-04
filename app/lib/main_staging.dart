import 'package:middelkamp_dev_app/src/main_delegate.dart';
import 'package:shared_domain/models.dart';

Future<void> main() async {
  await mainDelegate(
    environment: Environment.staging,
    authMicroServiceBaseUrl: 'STAGING_API_URL',
    userMicroServiceBaseUrl: 'STAGING_API_URL',
    projectMicroServiceBaseUrl: 'STAGING_API_URL',
  );
}
