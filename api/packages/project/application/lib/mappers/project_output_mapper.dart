import 'package:flutter_architecture_api_project_domain/domain.dart';
import 'package:flutter_architecture_api_shared_application/application.dart';

import '../models/output/project_output.dart';

class ProjectApplicationMapper
    implements ApplicationMapper<Project, ProjectOutput> {
  const ProjectApplicationMapper();

  @override
  ProjectOutput toOutput(Project project) {
    return ProjectOutput(
      id: project.id,
      name: project.name.value,
      description: project.description.value,
      ownerId: project.ownerId,
      createdAt: project.createdAt,
      updatedAt: project.updatedAt,
      memberIds: project.memberIds,
    );
  }
}
