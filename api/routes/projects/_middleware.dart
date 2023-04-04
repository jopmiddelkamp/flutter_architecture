import 'package:dart_frog/dart_frog.dart';
import 'package:in_memory_project_dao/dao.dart';

final _projectDao = ProjectDaoImpl();

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(provider<ProjectDao>((_) => _projectDao));
}
