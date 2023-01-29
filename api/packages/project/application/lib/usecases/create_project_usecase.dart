import 'package:flutter_architecture_api_project_domain/domain.dart';
import 'package:flutter_architecture_api_shared_application/application.dart';

import '../models/output/project_output.dart';

class CreateProjectUseCase {
  const CreateProjectUseCase(
    this._projectRepository,
    this._projectIdGenerator,
    this._projectNameValidator,
    this._projectDescriptionValidator,
    this._projectMapper,
  );

  final ProjectRepository _projectRepository;
  final ProjectIdGenerator _projectIdGenerator;
  final ProjectNameValidator _projectNameValidator;
  final ProjectDescriptionValidator _projectDescriptionValidator;
  final ApplicationMapper<Project, ProjectOutput> _projectMapper;

  Future<ProjectOutput> execute({
    required String name,
    required String description,
    required int ownerId,
  }) async {
    final id = await _projectIdGenerator.nextId();

    final validName = _projectNameValidator.validate(name);
    final validDescription = _projectDescriptionValidator.validate(description);

    final project = Project(
      id: id,
      name: validName,
      description: validDescription,
      ownerId: ownerId,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await _projectRepository.createProject(project);

    return _projectMapper.toOutput(project);
  }
}
