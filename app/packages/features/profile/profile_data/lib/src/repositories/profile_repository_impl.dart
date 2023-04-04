import 'package:back_end/api_clients.dart';
import 'package:feature_profile_domain/repositories.dart';
import 'package:shared_data/mappers.dart';
import 'package:shared_domain/caching.dart';
import 'package:shared_domain/models.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl({
    required this.userApiClient,
  }) : _userCache = ReactiveCache<User>(
          ttl: const Duration(minutes: 5),
        );

  final UserApiClient userApiClient;
  final ReactiveCache<User> _userCache;

  @override
  Stream<User?> getUser(String id) {
    return _userCache.stream.where((user) => user?.id == id);
  }

  @override
  Future<void> fetchUser(String id) async {
    final response = await userApiClient.getUser(id);
    final user = response.toUser();
    _userCache.setData(user);
  }

  @override
  Future<void> updateUser(String id, UserUpdateData data) async {
    final response = await userApiClient.updateUser(
      id,
      data: data.toJson(),
    );
    final updatedUser = response.toUser();
    _userCache.setData(updatedUser);
  }

  Future<void> close() async {
    await _userCache.close();
  }
}
