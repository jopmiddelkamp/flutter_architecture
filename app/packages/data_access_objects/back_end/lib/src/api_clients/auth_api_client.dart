import 'package:back_end/src/dtos/login_response_dto.dart';
import 'package:dio/dio.dart';

class AuthApiClient {
  const AuthApiClient({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  Future<String> login(
    String username,
    String password,
  ) async {
    try {
      final response = await _dio.post<LoginResponseDto>(
        'login',
        data: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return response.data!.token;
      } else {
        throw Exception('Invalid username or password');
      }
    } catch (e) {
      rethrow;
    }
  }
}
