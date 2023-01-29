import 'package:json_annotation/json_annotation.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  const ProfileResponse({
    required this.id,
    required this.emailAddress,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  final int id;
  final String emailAddress;

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}
