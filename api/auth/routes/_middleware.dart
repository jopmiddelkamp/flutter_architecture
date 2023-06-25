import 'package:dart_frog/dart_frog.dart';
import 'package:in_memory_auth_user_dao/dao.dart';

final _authUserDao = AuthUserDaoImpl();

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(provider<AuthUserDao>((_) => _authUserDao));
  ;
}
