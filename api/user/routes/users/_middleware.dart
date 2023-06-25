import 'package:dart_frog/dart_frog.dart';
import 'package:in_memory_user_dao/dao.dart';

final _userDao = UserDaoImpl();

Handler middleware(Handler handler) {
  return handler
      // Note: in you real application you would not call a dao directly but use
      // a service or use case class.
      .use(provider<UserDao>((_) => _userDao));
}
