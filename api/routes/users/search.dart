import 'package:dart_frog/dart_frog.dart';
import 'package:in_memory_user_dao/dao.dart';

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
  final requestJson = await context.request.json();
  if (requestJson is! Map<String, dynamic>) {
    return Response(statusCode: 400);
  }

  final query = requestJson['query'] as String?;
  if (query == null) {
    return Response(statusCode: 400, body: 'Missing query');
  }

  final dao = context.read<UserDao>();
  final users = await dao.getAll();

  return Response.json(
    body: users.map((user) => user.toJson()).toList(),
  );
}
