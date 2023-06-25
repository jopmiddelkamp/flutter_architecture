import 'package:freezed_annotation/freezed_annotation.dart';

part 'internal_user.freezed.dart';
part 'internal_user.g.dart';

@freezed
class InternalUser with _$InternalUser {
  const factory InternalUser({
    required String id,
    required String name,
    required String email,
  }) = _InternalUser;

  factory InternalUser.fromJson(Map<String, dynamic> json) =>
      _$InternalUserFromJson(json);
}
