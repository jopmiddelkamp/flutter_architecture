import 'package:feature_user_management_domain/repositories.dart';
import 'package:feature_user_management_domain/src/models/user.dart';

class UserService {
  UserService({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  final UserRepository _userRepository;

  Stream<List<User>?> get users => _userRepository.users;

  Stream<User?> getUser(String id) {
    return _userRepository.getUser(id);
  }

  Future<void> fetchUsers() async {
    await _userRepository.fetchUsers();
  }

  Future<void> fetchUser(String id) async {
    await _userRepository.fetchUser(id);
  }

  Future<void> createUser(String id, User user) async {
    await _userRepository.createUser(id, user);
  }

  Future<void> updateUser(String id, UserUpdateData data) async {
    await _userRepository.updateUser(id, data);
  }

  Future<void> deleteUser(String id) async {
    await _userRepository.deleteUser(id);
  }
}
