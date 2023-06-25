import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:middelkamp_dev_api_project/src/models/models.dart';

part 'project_dto.freezed.dart';
part 'project_dto.g.dart';

/// A DTO for a project.
@freezed
class ProjectDto with _$ProjectDto {
  /// A DTO for a project.
  const factory ProjectDto({
    required String id,
    required String name,
    required double budget,
    required String managerUserId,
    required UserDto managerUser,
  }) = _ProjectDto;

  /// Converts JSON to a [ProjectDto].
  factory ProjectDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectDtoFromJson(json);
}
