import 'package:shared_domain/models.dart';

abstract class ProfileRepository {
  Stream<User?> getUser(String id);
  Future<void> fetchUser(String id);
  Future<void> updateUser(String id, UserUpdateData data);
}
