import 'package:json_annotation/json_annotation.dart';

part 'logout_response.g.dart';

@JsonSerializable()
class LogoutResponse {
  const LogoutResponse({
    required this.message,
  });

  factory LogoutResponse.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseFromJson(json);

  final String message;

  Map<String, dynamic> toJson() => _$LogoutResponseToJson(this);
}
