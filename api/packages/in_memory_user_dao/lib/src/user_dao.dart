import 'package:in_memory_user_dao/models.dart';

abstract class UserDao {
  Future<User> create(User user);

  Future<void> delete(String id);

  Future<User?> find(String id);

  Future<List<User>> getAll();

  Future<User> update(String id, User user);

  Future<List<User>> search(String query);
}

class UserDaoImpl implements UserDao {
  final _users = <String, User>{
    '1': const User(
      id: '1',
      name: 'Jop Middelkamp',
      email: 'jop@middelkamp.dev',
    ),
    '2': const User(
      id: '2',
      name: 'Kevin Mulder',
      email: 'kevin@topg.com',
    ),
    '3': const User(
      id: '3',
      name: 'Dennis Schippers',
      email: 'dennis@schippers.nl',
    ),
    '4': const User(
      id: '4',
      name: 'Niek Jansen',
      email: 'niek@sjansen.nl',
    ),
  };

  @override
  Future<User> create(User user) {
    _users[user.id] = user;
    return Future.value(user);
  }

  @override
  Future<void> delete(String id) {
    _users.remove(id);
    return Future.value();
  }

  @override
  Future<User?> find(String id) {
    return Future.value(_users[id]);
  }

  @override
  Future<List<User>> getAll() {
    return Future.value(_users.values.toList());
  }

  @override
  Future<User> update(String id, User user) {
    _users[id] = user;
    return Future.value(user);
  }

  @override
  Future<List<User>> search(String query) {
    return Future.value(
      _users.values
          .where(
            (user) => user.name.contains(query) || user.email.contains(query),
          )
          .toList(),
    );
  }
}
