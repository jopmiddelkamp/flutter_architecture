import 'package:collection/collection.dart';
import 'package:in_memory_auth_user_dao/models.dart';

abstract class AuthUserDao {
  Future<AuthUser> create(AuthUser user);

  Future<void> delete(String id);

  Future<AuthUser?> find(String id);

  Future<AuthUser?> findByUsername(String username);

  Future<AuthUser> update(String id, AuthUser user);
}

class AuthUserDaoImpl implements AuthUserDao {
  final _users = <String, AuthUser>{
    '1': const AuthUser(
      userId: '1',
      username: 'jop',
      password: 'jop',
    ),
    '2': const AuthUser(
      userId: '2',
      username: 'topg',
      password: 'topg',
    ),
    '3': const AuthUser(
      userId: '3',
      username: 'ds',
      password: 'ds',
    ),
    '4': const AuthUser(
      userId: '4',
      username: 'ppj',
      password: 'ppj',
    ),
  };

  @override
  Future<AuthUser> create(AuthUser user) {
    _users[user.userId] = user;
    return Future.value(user);
  }

  @override
  Future<void> delete(String userId) {
    _users.remove(userId);
    return Future.value();
  }

  @override
  Future<AuthUser?> find(String userId) {
    return Future.value(_users[userId]);
  }

  @override
  Future<AuthUser?> findByUsername(String username) {
    return Future.value(
      _users.values.firstWhereOrNull((e) => e.username == username),
    );
  }

  @override
  Future<AuthUser> update(String userId, AuthUser user) {
    _users[userId] = user;
    return Future.value(user);
  }
}
