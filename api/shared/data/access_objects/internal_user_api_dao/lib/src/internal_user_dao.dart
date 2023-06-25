import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:internal_user_api_dao/models.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class InternalUserDao {
  Future<List<InternalUser>> getByIds(List<String> ids);
  Future<InternalUser?> find(String id);
}

class InternalUserDaoImpl implements InternalUserDao {
  final Dio _dio;

  InternalUserDaoImpl({
    required String baseUrl,
    Map<String, dynamic>? defaultHeaders,
  }) : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            headers: defaultHeaders,
          ),
        ) {
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      maxWidth: 90,
    ));
  }

  @override
  Future<List<InternalUser>> getByIds(List<String> ids) async {
    final response = await _dio.post(
      '/users',
      data: {
        'type': 'get',
        'ids': ids,
      },
    );
    final json = jsonDecode(response.data) as List<dynamic>;
    final result = json.map(
      (e) => InternalUser.fromJson(e as Map<String, dynamic>),
    );
    return result.toList();
  }

  @override
  Future<InternalUser?> find(String id) async {
    try {
      final response = await _dio.post(
        '/users',
        data: {
          'type': 'find',
          'id': id,
        },
      );
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      final result = InternalUser.fromJson(json);
      return result;
    } on DioException catch (e) {
      if (e.response?.statusCode == HttpStatus.notFound) {
        return null;
      }
      rethrow;
    }
  }
}
