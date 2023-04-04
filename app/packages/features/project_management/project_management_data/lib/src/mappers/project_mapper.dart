import 'package:back_end/dtos.dart';
import 'package:feature_project_management_domain/models.dart';

class ProjectMapper {
  Project fromDto(ProjectDto dto) {
    return Project(
      id: dto.id,
      name: dto.name,
      budget: dto.budget,
      managerId: dto.managerId,
    );
  }

  ProjectDto toDto(Project user) {
    return ProjectDto(
      id: user.id,
      name: user.name,
      budget: user.budget,
      managerId: user.managerId,
    );
  }
}

extension ProjectDtoX on ProjectDto {
  Project toProject() {
    return ProjectMapper().fromDto(this);
  }
}

extension ProjectX on Project {
  ProjectDto toDto() {
    return ProjectMapper().toDto(this);
  }
}
