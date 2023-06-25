import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';
import 'package:in_memory_user_dao/dao.dart';
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
  // Note: in your application you would not call a dao directly but use a
  // service or use case class.
  final dao = context.read<UserDao>();
  final users = await dao.getAll();

  return Response(
    body: jsonEncode(users.map((user) => user.toJson()).toList()),
  );
}
