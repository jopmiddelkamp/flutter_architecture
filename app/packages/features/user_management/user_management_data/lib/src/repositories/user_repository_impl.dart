import 'package:back_end/api_clients.dart';
import 'package:feature_user_management_data/mappers.dart';
import 'package:feature_user_management_domain/models.dart';
import 'package:feature_user_management_domain/repositories.dart';
import 'package:shared_domain/caching.dart';
ß
class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({
    required this.userApiClient,
  })  : _usersCache = ReactiveCache<List<User>>(
          ttl: const Duration(minutes: 5),
        ),
        _userCache = ReactiveCache<Map<String, User>>(
          ttl: const Duration(minutes: 5),
        );

  final UserApiClient userApiClient;
  final ReactiveCache<List<User>> _usersCache;
  final ReactiveCache<Map<String, User>> _userCache;

  @override
  Stream<List<User>?> get users => _usersCache.stream;

  @override
  Stream<User?> getUser(String id) {
    return _userCache.stream.map((usersMap) => usersMap?[id]);
  }

  @override
  Future<void> fetchUsers() async {
    final response = await userApiClient.getUsers();
    final userList = response.map((userDto) => userDto.toUser()).toList();
    _usersCache.setData(userList);
  }

  @override
  Future<void> fetchUser(String id) async {
    final response = await userApiClient.getUser(id);
    final user = response.toUser();
    _updateUserInCache(user);
  }

  @override
  Future<User> createUser(String id, User user) async {
    final response = await userApiClient.createUser(id, user.toDto(),);
    final createdUser = response.toUser();
    _updateUserInCache(createdUser);
    return createdUser;
  }

  @override
  Future<User> updateUser(String id, UserUpdateData data) async {
    final response = await userApiClient.updateUser(id, data: data.toJson(),);
    final updatedUser = response.toUser();
    _updateUserInCache(updatedUser);
    return updatedUser;
  }

  @override
  Future<void> deleteUser(String id) async {
    await userApiClient.deleteUser(id);
    _deleteUserFromCache(id);
  }

  void _updateUserInCache(User user) {
    final usersMap = _userCache.value ?? {};
    usersMap[user.id] = user;
    _userCache.setData(usersMap);
  }

  void _deleteUserFromCache(String id) {
    final usersMap = (_userCache.value ?? {})..remove(id);
    _userCache.setData(usersMap);
  }

  Future<void> close() async {
    await _userCache.close();
    await _usersCache.close();
  }
}
