import 'package:feature_project_management_domain/models.dart';

abstract class ProjectRepository {
  Stream<List<Project>?> get projects;
  Stream<Project?> getProject(String id);
  Future<void> fetchProjects();
  Future<void> fetchProject(String id);
  Future<void> createProject(String id, ProjectCreateData data);
  Future<void> updateProject(String id, ProjectUpdateData data);
  Future<void> deleteProject(String id);
}
