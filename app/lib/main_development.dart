import 'package:middelkamp_dev_app/src/main_delegate.dart';
import 'package:shared_domain/models.dart';

Future<void> main() async {
  await mainDelegate(
    environment: Environment.development,
    authMicroServiceBaseUrl: 'http://localhost:7100/auth',
    userMicroServiceBaseUrl: 'http://localhost:7300/user',
    projectMicroServiceBaseUrl: 'http://localhost:7200/project',
  );
}
