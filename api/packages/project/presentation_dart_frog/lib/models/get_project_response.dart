import 'package:json_annotation/json_annotation.dart';

import 'project_response.dart';

part 'get_project_response.g.dart';

@JsonSerializable()
class GetProjectResponse {
  const GetProjectResponse({
    required this.project,
  });

  factory GetProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProjectResponseFromJson(json);

  final ProjectResponse project;

  Map<String, dynamic> toJson() => _$GetProjectResponseToJson(this);
}
