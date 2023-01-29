import 'package:back_end/api_clients.dart';
import 'package:back_end/models.dart';
import 'package:dio/dio.dart';
import 'package:feature_auth_domain/exceptions.dart';
import 'package:feature_auth_domain/repositories.dart';
import 'package:shared_data/mediators.dart';
import 'package:shared_domain/mixin.dart';

class AuthRepositoryImpl with OnReadyMixin implements AuthRepository {
  AuthRepositoryImpl({
    required this.authApiClient,
    required TokenMediator tokenMediator,
    required AuthUserMediator authUserMediator,
  })  : _tokenMediator = tokenMediator,
        _authUserMediator = authUserMediator;

  final AuthApiClient authApiClient;

  final TokenMediator _tokenMediator;
  final AuthUserMediator _authUserMediator;

  Future<void> init() async {
    if (readyCompleter.isCompleted) {
      return;
    }
    await Future.wait([
      _tokenMediator.onReady,
      _authUserMediator.onReady,
    ]);
    readyCompleter.complete();
  }

  @override
  Future<void> login(
    String username,
    String password,
  ) async {
    LogInResponseDto? response;
    try {
      response = await authApiClient.login(
        username,
        password,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const DomainException.unauthenticated();
      }
      rethrow;
    }
    _tokenMediator.add(response.token);
    _authUserMediator.add(response.user);
  }

  @override
  Future<void> logout() async {
    _tokenMediator.clear();
    _authUserMediator.clear();
  }
}
