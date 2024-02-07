import 'package:dio/dio.dart';
import 'package:shared_domain/repositories.dart';

class TokenInterceptor extends InterceptorsWrapper {
  TokenInterceptor(TokenRepository tokenRepository)
      : _tokenRepository = tokenRepository;

  final TokenRepository _tokenRepository;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final token = _tokenRepository.token;
    if (token != null) {
      options.headers['Authorization'] = token;
    }
    return handler.next(options);
  }
}
