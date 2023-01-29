import 'package:json_annotation/json_annotation.dart';

part 'get_projects_by_user_id_request.g.dart';

@JsonSerializable()
class GetProjectsByUserIdRequest {
  const GetProjectsByUserIdRequest({
    required this.userId,
  });

  factory GetProjectsByUserIdRequest.fromJson(Map<String, dynamic> json) =>
      _$GetProjectsByUserIdRequestFromJson(json);

  final int userId;

  Map<String, dynamic> toJson() => _$GetProjectsByUserIdRequestToJson(this);
}
