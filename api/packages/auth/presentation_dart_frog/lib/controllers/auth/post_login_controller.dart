import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_architecture_api_auth_application/application.dart';
import 'package:flutter_architecture_api_shared_presentation_dart_frog/presentation.dart';

import '../../models/login_request.dart';
import '../../models/login_response.dart';

class PostLoginController {
  const PostLoginController(
    this._loginUseCase,
  );

  final LoginUserUseCase _loginUseCase;

  Future<Response> handle(RequestContext context) async {
    final invalidMethod = await validatePostMethod(context);
    if (invalidMethod != null) {
      return invalidMethod;
    }

    late LoginRequest loginRequest;
    try {
      final body = await context.request.json() as Map<String, dynamic>?;
      if (body == null) {
        return badRequest('Invalid request body');
      }
      loginRequest = LoginRequest.fromJson(body);
    } on Exception catch (e) {
      return badRequest('Invalid request body: $e');
    }

    try {
      final result = await _loginUseCase.execute(
        emailAddress: loginRequest.emailAddress,
        password: loginRequest.password,
      );

      if (result == null) {
        return unauthorized('Invalid email address or password');
      }

      return Response.json(
        body: LoginResponse(
          id: result.user.id,
          emailAddress: result.user.emailAddress.value,
          token: result.token,
        ).toJson(),
      );
    } on Exception catch (e) {
      return serverError('Login failed: $e');
    }
  }
}
