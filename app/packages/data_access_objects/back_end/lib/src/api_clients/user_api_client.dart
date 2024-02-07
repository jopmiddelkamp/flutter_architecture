import 'package:back_end/models.dart';
import 'package:dio/dio.dart';

class UserApiClient {
  const UserApiClient({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  Future<UserDto> getUser(String id) async {
    final response = await _dio.get<UserDto>(id);
    return response.data!;
  }

  Future<UserDto> createUser(String id, UserDto user) async {
    final response = await _dio.post<UserDto>(
      id,
      data: user.toJson(),
    );
    return response.data!;
  }

  Future<UserDto> updateUser(
    String id, {
    UpdateField<String>? name,
    UpdateField<String>? email,
  }) async {
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
    return response.data!;
  }

  Future<void> deleteUser(String id) async {
    await _dio.delete<Object>(id);
  }

  Future<List<UserDto>> getUsers() async {
    final response = await _dio.get<List<UserDto>>('');
    return response.data!;
  }

  Future<List<UserDto>> searchUsers(String query) async {
    final response = await _dio.get<List<UserDto>>(
      'search',
      queryParameters: {'query': query},
    );
    return response.data!;
  }

  Future<UserDto> getMe() async {
    final result = await getUser('me');
    return result;
  }

  Future<UserDto> updateMe({
    UpdateField<String>? name,
    UpdateField<String>? email,
  }) async {
    final result = await updateUser(
      'me',
      name: name,
      email: email,
    );
    return result;
  }
}
