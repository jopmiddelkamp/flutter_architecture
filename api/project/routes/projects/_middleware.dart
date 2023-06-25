import 'package:dart_frog/dart_frog.dart';
import 'package:in_memory_project_dao/dao.dart';
import 'package:internal_user_api_dao/dao.dart';
import 'package:middelkamp_dev_api_shared/api_secret.dart';

final _projectDao = ProjectDaoImpl();
final _internalUserDao = InternalUserDaoImpl(
  // Note: in your application you would not hardcode the URL and secret.
  baseUrl: 'http://192.168.2.183:7300/internal',
  defaultHeaders: {
    kInternalApiHeaderName: kInternalApiSecret,
  },
);

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      // Note: in you real application you would not call a dao directly but use
      // a service or use case class.
      .use(provider<ProjectDao>((_) => _projectDao))
      .use(provider<InternalUserDao>((_) => _internalUserDao));
}
