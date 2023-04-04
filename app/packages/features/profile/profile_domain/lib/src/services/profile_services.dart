import 'package:feature_profile_domain/repositories.dart';
import 'package:shared_domain/models.dart';

class ProfileService {
  ProfileService({
    required ProfileRepository profileRepository,
  }) : _profileRepository = profileRepository;

  final ProfileRepository _profileRepository;

  Stream<User?> getUser(String id) {
    return _profileRepository.getUser(id);
  }

  Future<void> fetchUser(String id) async {
    await _profileRepository.fetchUser(id);
  }

  Future<void> updateUser(String id, UserUpdateData data) async {
    await _profileRepository.updateUser(id, data);
  }
}
