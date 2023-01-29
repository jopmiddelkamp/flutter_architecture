import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  const LoginResponse({
    required this.id,
    required this.emailAddress,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  final int id;
  final String emailAddress;
  final String token;

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
