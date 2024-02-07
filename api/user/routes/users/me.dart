import 'package:dart_frog/dart_frog.dart';
import 'package:in_memory_user_dao/dao.dart';
import 'package:middelkamp_dev_api_shared/extensions.dart';
import 'package:middelkamp_dev_api_shared/responses.dart';

Future<Response> onRequest(
  RequestContext context,
) async {
  final method = context.request.method;
  switch (method) {
    case HttpMethod.get:
      return _onGetRequest(context);
    default:
      return MethodNotAllowedResponse();
  }
}

Future<Response> _onGetRequest(
  RequestContext context,
) async {
  final token = context.token;
  if (token == null) {
    return UnauthorizedResponse();
  }

  // Note: in your application you would not call a dao directly but use a
  // service or use case class.
  final dao = context.read<UserDao>();
  final user = await dao.find(token.userId);
  if (user == null) {
    return NotFoundResponse();
  }

  return Response.json(
    body: user.toJson(),
  );
}
