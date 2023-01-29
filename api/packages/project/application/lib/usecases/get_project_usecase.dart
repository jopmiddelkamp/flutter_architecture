import 'package:flutter_architecture_api_project_domain/domain.dart';
import 'package:flutter_architecture_api_shared_application/application.dart';

import '../models/output/project_output.dart';

class GetProjectUseCase {
  const GetProjectUseCase(
    this._projectRepository,
    this._projectMapper,
  );

  final ProjectRepository _projectRepository;
  final ApplicationMapper<Project, ProjectOutput> _projectMapper;

  Future<ProjectOutput?> execute(int id) async {
    final project = await _projectRepository.getProject(id);
    if (project == null) {
      return null;
    }
    return _projectMapper.toOutput(project);
  }
}
