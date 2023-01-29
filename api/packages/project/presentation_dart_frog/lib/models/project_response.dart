import 'package:json_annotation/json_annotation.dart';

part 'project_response.g.dart';

@JsonSerializable()
class ProjectResponse {
  const ProjectResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.ownerId,
    required this.createdAt,
    required this.updatedAt,
    required this.memberIds,
  });

  factory ProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectResponseFromJson(json);

  final int id;
  final String name;
  final String description;
  final int ownerId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<String> memberIds;

  Map<String, dynamic> toJson() => _$ProjectResponseToJson(this);
}
