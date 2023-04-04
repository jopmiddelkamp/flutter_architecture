import 'package:dart_frog/dart_frog.dart';
import 'package:in_memory_user_dao/dao.dart';
import 'package:middelkamp_dev_api/extensions/extensions.dart';

Future<Response> onRequest(
  RequestContext context,
) async {
  final method = context.request.method;
  switch (method) {
    case HttpMethod.get:
      return _onGetRequest(context);
    default:
      return Response(statusCode: 405);
  }
}

Future<Response> _onGetRequest(
  RequestContext context,
) async {
  final token = context.token;
  if (token == null) {
    return Response(statusCode: 401);
  }

  final dao = context.read<UserDao>();
  final user = await dao.find(token.userId);
  if (user == null) {
    return Response(statusCode: 404);
  }

  return Response.json(
    body: user.toJson(),
  );
}
