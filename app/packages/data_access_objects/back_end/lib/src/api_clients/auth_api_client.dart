import 'package:dio/dio.dart';

import '../models/log_in_response_dto.dart';

class AuthApiClient {
  const AuthApiClient({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  Future<LogInResponseDto> login(
    String username,
    String password,
  ) async {
    final response = await _dio.post<LogInResponseDto>(
      'login',
      data: {
        'username': username,
        'password': password,
      },
    );
    return response.data!;
  }
}
