import 'package:json_annotation/json_annotation.dart';

import 'project_response.dart';

part 'get_projects_by_user_id_response.g.dart';

@JsonSerializable()
class GetProjectsByUserIdResponse {
  const GetProjectsByUserIdResponse({
    required this.projects,
  });

  factory GetProjectsByUserIdResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProjectsByUserIdResponseFromJson(json);

  final List<ProjectResponse> projects;

  Map<String, dynamic> toJson() => _$GetProjectsByUserIdResponseToJson(this);
}
