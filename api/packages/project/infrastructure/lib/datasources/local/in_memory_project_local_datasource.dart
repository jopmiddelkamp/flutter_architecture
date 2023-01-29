import 'dart:math';

import 'package:flutter_architecture_api_project_domain/domain.dart';

class InMemoryProjectLocalDataSource {
  final Map<int, Project> _projects = {};

  /// Normally this doesn't belong in the repository, but it's here for testing
  /// purposes.
  ///
  /// Returns the next available ID for a new project.
  Future<int> getNextId() async {
    final maxId = _projects.keys.fold(0, max);
    return maxId + 1;
  }

  /// Creates a new project.
  Future<void> createProject(Project project) async {
    _projects[project.id] = project;
  }

  /// Returns the project with the given ID.
  Future<Project?> getProject(int id) async {
    return _projects[id];
  }

  /// Returns all projects for the given user ID.
  Future<List<Project>> getProjectsByUserId(int userId) async {
    return _projects.values
        .where((project) => project.ownerId == userId)
        .toList();
  }

  /// Updates a project.
  Future<void> updateProject(Project project) async {
    if (!_projects.containsKey(project.id)) {
      throw Exception('Project not found');
    }
    _projects[project.id] = project;
  }

  /// Deletes a project with the given ID.
  Future<void> deleteProject(int id) async {
    if (!_projects.containsKey(id)) {
      throw Exception('Project not found');
    }
    _projects.remove(id);
  }
}
