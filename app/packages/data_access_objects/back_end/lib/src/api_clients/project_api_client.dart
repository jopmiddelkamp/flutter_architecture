import 'package:back_end/src/models/project_update_data.dart';
import 'package:dio/dio.dart';

import '../models/project_dto.dart';

class ProjectApiClient {
  const ProjectApiClient({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  Future<ProjectDto> getProject(String id) async {
    final response = await _dio.get<ProjectDto>(id);
    return response.data!;
  }

  Future<ProjectDto> createProject(String id, ProjectDto project) async {
    final response = await _dio.post<ProjectDto>(
      id,
      data: project.toJson(),
    );
    return response.data!;
  }

  Future<ProjectDto> updateProject(
    String id, {
    required ProjectUpdateData data,
  }) async {
    if (data.isEmpty) {
      throw Exception('No data to update');
    }

    final response = await _dio.put<ProjectDto>(
      id,
      data: {
        if (data.name != null)
          'name': {
            'value': data.name!.value,
          },
        if (data.budget != null)
          'budget': {
            'value': data.budget!.value,
          },
        if (data.managerId != null)
          'managerId': {
            'value': data.managerId!.value,
          },
      },
    );
    return response.data!;
  }

  Future<void> deleteProject(String id) async {
    await _dio.delete<Object>(id);
  }

  Future<List<ProjectDto>> getProjects() async {
    final response = await _dio.get<List<ProjectDto>>('');
    return response.data!;
  }

  Future<List<ProjectDto>> searchProjects(String query) async {
    final response = await _dio.get<List<ProjectDto>>(
      'search',
      queryParameters: {'query': query},
    );
    return response.data!;
  }
}
