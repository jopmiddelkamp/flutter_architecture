import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_architecture_api_auth_application/application.dart';
import 'package:flutter_architecture_api_shared_presentation_dart_frog/presentation.dart';

import '../../models/register_request.dart';
import '../../models/register_response.dart';

class PostRegisterController {
  const PostRegisterController(
    this._registerUseCase,
  );

  final RegisterUserUseCase _registerUseCase;

  Future<Response> handle(RequestContext context) async {
    final invalidMethod = await validatePostMethod(context);
    if (invalidMethod != null) {
      return invalidMethod;
    }

    final body = await context.request.json() as Map<String, dynamic>?;

    if (body == null ||
        body['emailAddress'] == null ||
        body['password'] == null) {
      return badRequest('Missing email address or password');
    }

    final registerRequest = RegisterRequest.fromJson(body);

    try {
      final result = await _registerUseCase.execute(
        emailAddress: registerRequest.emailAddress,
        password: registerRequest.password,
      );

      return Response.json(
        body: RegisterResponse(
          id: result.user.id,
          emailAddress: result.user.emailAddress.value,
        ),
      );
    } on Exception catch (e) {
      return serverError('Registration failed: $e');
    }
  }
}
