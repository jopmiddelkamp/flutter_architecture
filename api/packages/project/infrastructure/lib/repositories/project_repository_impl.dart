import 'package:flutter_architecture_api_project_domain/domain.dart';

import '../datasources/local/in_memory_project_local_datasource.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  const ProjectRepositoryImpl(this._dataSource);

  final InMemoryProjectLocalDataSource _dataSource;

  /// Normally this doesn't belong in the repository, but it's here for testing
  /// purposes.
  ///
  /// Returns the next available ID for a new project.
  @override
  Future<int> getNextId() async {
    final id = await _dataSource.getNextId();
    return id;
  }

  /// Creates a new project.
  @override
  Future<void> createProject(Project project) async {
    await _dataSource.createProject(project);
  }

  /// Returns the project with the given ID.
  @override
  Future<Project?> getProject(int id) {
    return _dataSource.getProject(id);
  }

  /// Returns all projects for the given user ID.
  @override
  Future<List<Project>> getProjectsByUserId(int userId) {
    return _dataSource.getProjectsByUserId(userId);
  }

  /// Updates a project.
  @override
  Future<void> updateProject(Project project) async {
    await _dataSource.updateProject(project);
  }

  /// Deletes a project with the given ID.
  @override
  Future<void> deleteProject(int id) async {
    await _dataSource.deleteProject(id);
  }
}
