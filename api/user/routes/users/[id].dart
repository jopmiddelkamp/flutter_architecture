import 'package:dart_frog/dart_frog.dart';
import 'package:in_memory_user_dao/dao.dart';
import 'package:in_memory_user_dao/models.dart';
import 'package:middelkamp_dev_api_shared/extensions.dart';
import 'package:middelkamp_dev_api_shared/responses.dart';

Future<Response> onRequest(
  RequestContext context,
  String id,
) async {
  final method = context.request.method;
  switch (method) {
    case HttpMethod.get:
      return _onGetRequest(context, id);
    case HttpMethod.post:
      return _onPostRequest(context, id);
    case HttpMethod.put:
      return _onPutRequest(context, id);
    case HttpMethod.delete:
      return _onDeleteRequest(context, id);
    default:
      return MethodNotAllowedResponse();
  }
}

Future<Response> _onGetRequest(
  RequestContext context,
  String id,
) async {
  // Note: in your application you would not call a dao directly but use a
  // service or use case class.
  final dao = context.read<UserDao>();
  final user = await dao.find(id);

  return Response.json(
    body: user?.toJson(),
  );
}

Future<Response> _onPostRequest(
  RequestContext context,
  String id,
) async {
  final requestJson = await context.request.json();
  if (requestJson is! Map<String, dynamic>) {
    return BadRequestResponse();
  }

  final token = context.token;
  if (token == null) {
    return UnauthorizedResponse();
  }
  if (token.userId != id) {
    return ForbiddenResponse();
  }

  // Note: in your application you would not call a dao directly but use a
  // service or use case class.
  final dao = context.read<UserDao>();
  var user = await dao.find(id);
  if (user == null) {
    return NotFoundResponse();
  }
  user = user.copyWith(
    name: requestJson['name'] as String,
    email: requestJson['email'] as String,
  );
  await dao.update(id, user);

  return Response.json(
    body: user.toJson(),
  );
}

Future<Response> _onPutRequest(
  RequestContext context,
  String id,
) async {
  final requestJson = await context.request.json();
  if (requestJson is! Map<String, dynamic>) {
    return BadRequestResponse();
  }

  final token = context.token;
  if (token == null) {
    return UnauthorizedResponse();
  }
  if (token.userId != id) {
    return ForbiddenResponse();
  }

  // Note: in your application you would not call a dao directly but use a
  // service or use case class.
  final dao = context.read<UserDao>();
  var user = await dao.find(id);
  if (user == null) {
    return NotFoundResponse();
  }
  final nameData = requestJson['name'] as Map<String, dynamic>?;
  final name = nameData?['value'] as String?;

  final emailData = requestJson['email'] as Map<String, dynamic>?;
  final email = emailData?['value'] as String?;

  user = User(
    id: user.id,
    name: name ?? user.name,
    email: email ?? user.email,
  );
  await dao.update(id, user);

  return Response.json(
    body: user.toJson(),
  );
}

Future<Response> _onDeleteRequest(
  RequestContext context,
  String id,
) async {
  final requestJson = await context.request.json();
  if (requestJson is! Map<String, dynamic>) {
    return BadRequestResponse();
  }

  final token = context.token;
  if (token == null) {
    return UnauthorizedResponse();
  }
  if (token.userId != id) {
    return ForbiddenResponse();
  }

  // Note: in your application you would not call a dao directly but use a
  // service or use case class.
  final dao = context.read<UserDao>();
  await dao.delete(id);

  return Response.json();
}
