import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'auth_user_dto.dart';

part 'log_in_response_dto.g.dart';

@JsonSerializable()
class LogInResponseDto extends Equatable {
  const LogInResponseDto({
    required this.token,
    required this.user,
  });

  factory LogInResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LogInResponseDtoFromJson(json);

  final String token;
  final AuthUserDto user;

  @override
  List<Object> get props => [token, user];
}
