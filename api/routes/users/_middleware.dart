import 'package:dart_frog/dart_frog.dart';
import 'package:in_memory_user_dao/dao.dart';

final _userDao = UserDaoImpl();

Handler middleware(Handler handler) {
  return handler.use(requestLogger()).use(provider<UserDao>((_) => _userDao));
}
