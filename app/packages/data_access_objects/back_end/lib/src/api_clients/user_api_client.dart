import 'package:back_end/dtos.dart';
import 'package:back_end/models.dart';
import 'package:dio/dio.dart';

class UserApiClient {
  const UserApiClient({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  Future<UserDto> getUser(String id) async {
    try {
      final response = await _dio.get<UserDto>(id);

      if (response.statusCode == 200) {
        return response.data!;
      } else {
        throw Exception('Failed to fetch user data');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserDto> createUser(String id, UserDto user) async {
    try {
      final response = await _dio.post<UserDto>(
        id,
        data: user.toJson(),
      );

      if (response.statusCode == 200) {
        return response.data!;
      } else {
        throw Exception('Failed to create user');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserDto> updateUser(
    String id, {
    UpdateField<String>? name,
    UpdateField<String>? email,
  }) async {
    try {
      if (name == null && email == null) {
        throw Exception('No data to update');
      }

      final response = await _dio.put<UserDto>(
        id,
        data: {
          if (name != null)
            'name': {
              'value': name.value,
            },
          if (email != null)
            'email': {
              'value': email.value,
            },
        },
      );

      if (response.statusCode == 200) {
        return response.data!;
      } else {
        throw Exception('Failed to update user');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteUser(String id) async {
    try {
      await _dio.delete<Object>(id);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserDto>> getUsers() async {
    try {
      final response = await _dio.get<List<UserDto>>('');

      if (response.statusCode == 200) {
        return response.data!;
      } else {
        throw Exception('Failed to fetch users');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserDto>> searchUsers(String query) async {
    try {
      final response = await _dio.get<List<UserDto>>(
        'search',
        queryParameters: {'query': query},
      );

      if (response.statusCode == 200) {
        return response.data!;
      } else {
        throw Exception('Failed to fetch users');
      }
    } catch (e) {
      rethrow;
    }
  }
}
