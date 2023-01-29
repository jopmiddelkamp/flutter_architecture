import 'dart:math';

import '../../models/auth_user_dto.dart';

class InMemoryAuthUserLocalDataSource {
  InMemoryAuthUserLocalDataSource();

  final List<AuthUserDto> _storage = [];

  /// Normally this doesn't belong in the repository, but it's here for testing
  /// purposes.
  ///
  /// Returns the next available ID for a new user.
  Future<int> getNextId() async {
    final maxId = _storage.map((e) => e.id).fold(0, max);
    return maxId + 1;
  }

  /// Returns the user with the given email address.
  Future<AuthUserDto?> findByEmailAddress(String emailAddress) async {
    try {
      return _storage.firstWhere(
        (u) => u.emailAddress == emailAddress,
      );
    } on Exception catch (_) {
      return null;
    }
  }

  /// Saves a new user.
  Future<void> save(AuthUserDto dto) async {
    _storage.add(dto);
  }

  /// Deletes a user with the given email address.
  Future<void> deleteByEmailAddress(String emailAddress) async {
    _storage.removeWhere(
      (u) => u.emailAddress == emailAddress,
    );
  }
}
