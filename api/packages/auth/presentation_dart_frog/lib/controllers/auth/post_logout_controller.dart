import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_architecture_api_auth_application/application.dart';
import 'package:flutter_architecture_api_shared_presentation_dart_frog/presentation.dart';

import '../../models/logout_response.dart';

class PostLogoutController {
  const PostLogoutController(
    this._logoutUseCase,
  );

  final LogoutUserUseCase _logoutUseCase;

  Future<Response> handle(RequestContext context) async {
    final invalidMethod = await validatePostMethod(context);
    if (invalidMethod != null) {
      return invalidMethod;
    }

    await _logoutUseCase.execute();

    return Response.json(
      body: const LogoutResponse(
        message: 'Logout successful.',
      ).toJson(),
    );
  }
}
