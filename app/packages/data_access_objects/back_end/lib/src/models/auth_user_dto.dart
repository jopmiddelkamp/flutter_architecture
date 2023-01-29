import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_user_dto.g.dart';

@JsonSerializable()
class AuthUserDto extends Equatable {
  const AuthUserDto({
    required this.id,
    required this.username,
  });

  factory AuthUserDto.fromJson(Map<String, dynamic> json) =>
      _$AuthUserDtoFromJson(json);

  final int id;
  final String username;

  @override
  List<Object> get props => [id, username];

  Map<String, dynamic> toJson() => _$AuthUserDtoToJson(this);
}
