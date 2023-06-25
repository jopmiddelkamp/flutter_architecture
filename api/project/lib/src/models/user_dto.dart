import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

/// A DTO for a user.
@freezed
class UserDto with _$UserDto {
  /// A DTO for a user.
  const factory UserDto({
    required String id,
    required String name,
    required String email,
  }) = _UserDto;

  /// Converts JSON to a [UserDto].
  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}
