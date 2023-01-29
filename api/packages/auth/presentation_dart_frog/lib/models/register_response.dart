import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  const RegisterResponse({
    required this.id,
    required this.emailAddress,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  final int id;
  final String emailAddress;

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}
