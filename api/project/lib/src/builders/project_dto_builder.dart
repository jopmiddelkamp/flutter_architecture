import 'package:in_memory_project_dao/models.dart';
import 'package:internal_user_api_dao/models.dart';
import 'package:middelkamp_dev_api_project/src/builders/builders.dart';
import 'package:middelkamp_dev_api_project/src/models/models.dart';

/// Builds a [ProjectDto] from a [Project] and [InternalUser].
class ProjectDtoBuilder {
  /// Builds a [ProjectDto] from a [Project] and [InternalUser].
  static ProjectDto build(
    Project project,
    InternalUser manager,
  ) {
    return ProjectDto(
      id: project.id,
      name: project.name,
      budget: project.budget,
      managerUserId: project.managerUserId,
      managerUser: UserDtoBuilder.build(manager),
    );
  }

  /// Builds a [ProjectDto] from a [Project] and [InternalUser].
  static List<ProjectDto> buildMany(
    List<Project> projects,
    List<InternalUser> managers,
  ) {
    final managerMap = managers.fold<Map<String, InternalUser>>(
      {},
      (map, manager) => map..[manager.id] = manager,
    );
    final result = projects.map(
      (project) => build(
        project,
        managerMap[project.managerUserId]!,
      ),
    );
    return result.toList();
  }
}
