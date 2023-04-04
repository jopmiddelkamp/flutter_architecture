import 'package:dio/dio.dart';
import 'package:shared_domain/mediators.dart';

class TokenInterceptor extends InterceptorsWrapper {
  TokenInterceptor();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final token = TokenMediator.instance.token;
    if (token != null) {
      options.headers['Authorization'] = token;
    }
    return handler.next(options);
  }
}
