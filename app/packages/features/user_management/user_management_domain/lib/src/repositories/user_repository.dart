import 'package:feature_user_management_domain/src/models/user.dart';

abstract class UserRepository {
  Stream<List<User>?> get users;
  Stream<User?> getUser(String id);
  Future<void> fetchUsers();
  Future<void> fetchUser(String id);
  Future<void> createUser(String id, User user);
  Future<void> updateUser(String id, UserUpdateData data);
  Future<void> deleteUser(String id);
}
