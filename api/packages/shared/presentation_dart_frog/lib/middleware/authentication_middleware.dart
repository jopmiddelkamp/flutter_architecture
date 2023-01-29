import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_auth/dart_frog_auth.dart';
import 'package:flutter_architecture_api_shared_application/application.dart';
import 'package:flutter_architecture_api_shared_domain/domain.dart';

Handler authenticationMiddleware(Handler handler) {
  return handler.use(
    bearerAuthentication<AuthUser>(
      authenticator: (context, token) async {
        final tokenService = context.read<TokenService>();
        final authUser = await tokenService.parseUserFromToken(token);
        return authUser;
      },
    ),
  );
}
