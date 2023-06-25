import 'package:collection/collection.dart';
import 'package:in_memory_auth_user_dao/models.dart';

abstract class AuthUserDao {
  Future<AuthUserDto> create(AuthUserDto user);

  Future<void> delete(String id);

  Future<AuthUserDto?> find(String id);

  Future<AuthUserDto?> findByUsername(String username);

  Future<AuthUserDto> update(String id, AuthUserDto user);
}

class AuthUserDaoImpl implements AuthUserDao {
  final _users = <String, AuthUserDto>{
    '1': const AuthUserDto(
      userId: '1',
      username: 'jop',
      password: 'jop',
    ),
    '2': const AuthUserDto(
      userId: '2',
      username: 'topg',
      password: 'topg',
    ),
    '3': const AuthUserDto(
      userId: '3',
      username: 'ds',
      password: 'ds',
    ),
    '4': const AuthUserDto(
      userId: '4',
      username: 'ppj',
      password: 'ppj',
    ),
  };

  @override
  Future<AuthUserDto> create(AuthUserDto user) {
    _users[user.userId] = user;
    return Future.value(user);
  }

  @override
  Future<void> delete(String userId) {
    _users.remove(userId);
    return Future.value();
  }

  @override
  Future<AuthUserDto?> find(String userId) {
    return Future.value(_users[userId]);
  }

  @override
  Future<AuthUserDto?> findByUsername(String username) {
    return Future.value(
      _users.values.firstWhereOrNull((e) => e.username == username),
    );
  }

  @override
  Future<AuthUserDto> update(String userId, AuthUserDto user) {
    _users[userId] = user;
    return Future.value(user);
  }
}
