import 'package:back_end/api_clients.dart';
import 'package:feature_project_management_domain/repositories.dart';
import 'package:shared_data/mappers.dart';
import 'package:shared_domain/caching.dart';
import 'package:shared_domain/models.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({
    required this.userApiClient,
  }) : _userCache = ReactiveCache<Map<String, User>>(
          ttl: const Duration(minutes: 5),
        );

  final UserApiClient userApiClient;
  final ReactiveCache<Map<String, User>> _userCache;

  @override
  Stream<User?> getUser(String id) {
    return _userCache.stream.map((usersMap) => usersMap?[id]);
  }

  @override
  Future<void> fetchUser(String id) async {
    final response = await userApiClient.getUser(id);
    final user = response.toUser();
    _updateUserInCache(user);
  }

  void _updateUserInCache(User user) {
    final usersMap = _userCache.value ?? {};
    usersMap[user.id] = user;
    _userCache.setData(usersMap);
  }

  Future<void> close() async {
    await _userCache.close();
  }
}
