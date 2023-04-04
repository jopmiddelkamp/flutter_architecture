import 'package:json_annotation/json_annotation.dart';

part 'login_response_dto.g.dart';

@JsonSerializable()
class LoginResponseDto {
  const LoginResponseDto({
    required this.token,
  });

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDtoFromJson(json);

  final String token;

  Map<String, dynamic> toJson() => _$LoginResponseDtoToJson(this);
}
