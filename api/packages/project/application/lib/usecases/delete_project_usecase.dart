import 'package:flutter_architecture_api_project_domain/domain.dart';

class DeleteProjectUseCase {
  const DeleteProjectUseCase(this._projectRepository);

  final ProjectRepository _projectRepository;

  Future<void> execute(int id) async {
    await _projectRepository.deleteProject(id);
  }
}
