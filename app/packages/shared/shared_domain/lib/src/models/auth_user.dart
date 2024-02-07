import 'package:freezed_annotation/freezed_annotation.dart';

import 'update_field.dart';

part 'auth_user.freezed.dart';

@freezed
class AuthUser with _$AuthUser {
  const factory AuthUser({
    required int id,
    required String username,
  }) = _AuthUser;
}

class AuthUserUpdateData {
  const AuthUserUpdateData({
    this.username,
  });

  final UpdateField<String>? username;
}
