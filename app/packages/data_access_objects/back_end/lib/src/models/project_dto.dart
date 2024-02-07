import 'package:json_annotation/json_annotation.dart';

part 'project_dto.g.dart';

@JsonSerializable()
class ProjectDto {
  const ProjectDto({
    required this.id,
    required this.name,
    required this.budget,
    required this.managerId,
  });

  factory ProjectDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectDtoFromJson(json);

  final String id;
  final String name;
  final double budget;
  final String managerId;

  Map<String, dynamic> toJson() => _$ProjectDtoToJson(this);
}
