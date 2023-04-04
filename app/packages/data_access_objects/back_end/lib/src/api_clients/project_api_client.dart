import 'package:back_end/src/dtos/project_dto.dart';
import 'package:back_end/src/models/project_update_data.dart';
import 'package:dio/dio.dart';

class ProjectApiClient {
  const ProjectApiClient({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  Future<ProjectDto> getProject(String id) async {
    try {
      final response = await _dio.get<ProjectDto>(id);

      if (response.statusCode == 200) {
        return response.data!;
      } else {
        throw Exception('Failed to fetch project data');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ProjectDto> createProject(String id, ProjectDto project) async {
    try {
      final response = await _dio.post<ProjectDto>(
        id,
        data: project.toJson(),
      );

      if (response.statusCode == 200) {
        return response.data!;
      } else {
        throw Exception('Failed to create project');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ProjectDto> updateProject(
    String id, {
    required ProjectUpdateData data,
  }) async {
    try {
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

      if (response.statusCode == 200) {
        return response.data!;
      } else {
        throw Exception('Failed to update project');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteProject(String id) async {
    try {
      await _dio.delete<Object>(id);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ProjectDto>> getProjects() async {
    try {
      final response = await _dio.get<List<ProjectDto>>('');
      if (response.statusCode == 200) {
        return response.data!;
      } else {
        throw Exception('Failed to fetch projects');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ProjectDto>> searchProjects(String query) async {
    try {
      final response = await _dio.get<List<ProjectDto>>(
        'search',
        queryParameters: {'query': query},
      );

      if (response.statusCode == 200) {
        return response.data!;
      } else {
        throw Exception('Failed to fetch projects');
      }
    } catch (e) {
      rethrow;
    }
  }
}
