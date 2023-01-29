import '../entities/project.dart';

abstract class ProjectRepository {
  Future<int> getNextId();
  Future<Project?> getProject(int id);
  Future<List<Project>> getProjectsByUserId(int userId);
  Future<void> createProject(Project project);
  Future<void> updateProject(Project project);
  Future<void> deleteProject(int id);
}
