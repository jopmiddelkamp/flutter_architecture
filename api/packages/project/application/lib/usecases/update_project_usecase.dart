import 'package:flutter_architecture_api_project_domain/domain.dart';
import 'package:flutter_architecture_api_shared_application/application.dart';

import '../models/output/project_output.dart';

class UpdateProjectUseCase {
  const UpdateProjectUseCase(
    this._projectRepository,
    this._projectMapper,
  );

  final ProjectRepository _projectRepository;
  final ApplicationMapper<Project, ProjectOutput> _projectMapper;

  Future<ProjectOutput> execute({
    required int id,
    required String name,
    required String description,
  }) async {
    final existingProject = await _projectRepository.getProject(id);
    if (existingProject == null) {
      throw Exception('Project not found');
    }

    final updatedProject = Project(
      id: existingProject.id,
      name: ProjectName.parse(name),
      description: ProjectDescription.parse(description),
      ownerId: existingProject.ownerId,
      createdAt: existingProject.createdAt,
      updatedAt: DateTime.now(),
      memberIds: existingProject.memberIds,
    );

    await _projectRepository.updateProject(updatedProject);

    final result = _projectMapper.toOutput(updatedProject);

    return result;
  }
}
