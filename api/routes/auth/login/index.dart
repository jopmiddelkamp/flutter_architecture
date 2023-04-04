import 'package:dart_frog/dart_frog.dart';
import 'package:in_memory_auth_user_dao/dao.dart';
import 'package:middelkamp_dev_api/models/models.dart';

Future<Response> onRequest(
  RequestContext context,
) async {
  try {
    final method = context.request.method;
    switch (method) {
      case HttpMethod.post:
        return _onPostRequest(context);
      default:
        return Response(statusCode: 405);
    }
  } catch (e) {
    return Response(statusCode: 500);
  }
}

Future<Response> _onPostRequest(
  RequestContext context,
) async {
  final requestJson = await context.request.json();
  if (requestJson is! Map<String, dynamic>) {
    return Response(statusCode: 400);
  }
  final username = requestJson['username'];
  if (username == null || username is! String) {
    return Response(statusCode: 400, body: 'Invalid username value');
  }
  final password = requestJson['password'];
  if (password == null || password is! String) {
    return Response(statusCode: 400, body: 'Invalid password value');
  }

  final dao = context.read<AuthUserDao>();
  final user = await dao.findByUsername(username);
  if (user == null || user.password != password) {
    return Response(statusCode: 400, body: 'Invalid username or password');
  }
  final token = Token(
    userId: user.userId,
    username: user.username,
    expirationDate: DateTime.now().add(
      const Duration(days: 1),
    ),
  );
  return Response.json(
    body: {
      'token': token.encode(),
    },
  );
}
