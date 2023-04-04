import 'package:back_end/api_clients.dart';
import 'package:feature_project_management_data/src/mappers/mappers.dart';
import 'package:feature_project_management_domain/models.dart';
import 'package:feature_project_management_domain/repositories.dart';
import 'package:shared_domain/caching.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  ProjectRepositoryImpl({
    required this.projectApiClient,
  })  : _projectsCache = ReactiveCache<List<Project>>(
          ttl: const Duration(minutes: 5),
        ),
        _projectCache = ReactiveCache<Map<String, Project>>(
          ttl: const Duration(minutes: 5),
        );

  final ProjectApiClient projectApiClient;
  final ReactiveCache<List<Project>> _projectsCache;
  final ReactiveCache<Map<String, Project>> _projectCache;

  @override
  Stream<List<Project>?> get projects => _projectsCache.stream;

  @override
  Stream<Project?> getProject(String id) {
    return _projectCache.stream.map((projectsMap) => projectsMap?[id]);
  }

  @override
  Future<void> fetchProjects() async {
    final response = await projectApiClient.getProjects();
    final projectList =
        response.map((projectDto) => projectDto.toProject()).toList();
    _projectsCache.setData(projectList);
  }

  @override
  Future<void> fetchProject(String id) async {
    final response = await projectApiClient.getProject(id);
    final project = response.toProject();
    _updateProjectInCache(project);
  }

  @override
  Future<Project> createProject(String id, Project project) async {
    final response = await projectApiClient.createProject(id, project.toDto());
    final createdProject = response.toProject();
    _updateProjectInCache(createdProject);
    return createdProject;
  }

  @override
  Future<Project> updateProject(String id, ProjectUpdateData data) async {
    final response =
        await projectApiClient.updateProject(id, data: data.toJson());
    final updatedProject = response.toProject();
    _updateProjectInCache(updatedProject);
    return updatedProject;
  }

  @override
  Future<void> deleteProject(String id) async {
    await projectApiClient.deleteProject(id);
    _deleteProjectFromCache(id);
  }

  void _updateProjectInCache(Project project) {
    final projectsMap = _projectCache.value ?? {};
    projectsMap[project.id] = project;
    _projectCache.setData(projectsMap);
  }

  void _deleteProjectFromCache(String id) {
    final projectsMap = (_projectCache.value ?? {})..remove(id);
    _projectCache.setData(projectsMap);
  }

  Future<void> close() async {
    await _projectsCache.close();
  }
}
