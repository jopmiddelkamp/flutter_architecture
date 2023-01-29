import 'package:flutter_architecture_api_project_domain/domain.dart';
import 'package:flutter_architecture_api_shared_application/application.dart';

import '../models/output/project_output.dart';

class GetProjectsByUserIdUseCase {
  const GetProjectsByUserIdUseCase(
    this._projectRepository,
    this._projectMapper,
  );

  final ProjectRepository _projectRepository;
  final ApplicationMapper<Project, ProjectOutput> _projectMapper;

  Future<List<ProjectOutput>> execute(int userId) async {
    final projects = await _projectRepository.getProjectsByUserId(userId);
    final result = [
      for (final project in projects) _projectMapper.toOutput(project),
    ];
    return result;
  }
}
