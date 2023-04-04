import 'dart:convert';

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
  final dao = context.read<UserDao>();
  final users = await dao.getAll();

  return Response(
    body: jsonEncode(users.map((user) => user.toJson()).toList()),
  );
}
