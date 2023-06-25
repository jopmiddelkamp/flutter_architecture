import 'dart:convert';
import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:in_memory_user_dao/dao.dart';
import 'package:middelkamp_dev_api_shared/extensions.dart';
import 'package:middelkamp_dev_api_shared/responses.dart';

/// Setup like this because otherwise there is a max of user ids a GET request
/// can handle.
enum InternalUsersOperation {
  get,
  find;

  static InternalUsersOperation? tryParse(String? value) {
    if (value == null) {
      return null;
    }
    return InternalUsersOperation.values.firstWhereOrNull(
      (element) => element.name == value,
    );
  }
}

Future<Response> onRequest(
  RequestContext context,
) async {
  final method = context.request.method;
  switch (method) {

    /// Setup like this because otherwise there is a max of user ids a GET
    /// request can handle.
    case HttpMethod.post:
      return _onPostRequest(context);
    default:
      return MethodNotAllowedResponse();
  }
}

Future<Response> _onPostRequest(
  RequestContext context,
) async {
  log('${context.request.method} ${context.request.uri}');
  final requestJson = await context.request.json();
  if (requestJson is! Map<String, dynamic>) {
    return BadRequestResponse();
  }

  if (!context.validInternalApiRequest) {
    return ForbiddenResponse();
  }

  /// Setup like this because otherwise there is a max of user ids a GET request
  /// can handle.
  final type = InternalUsersOperation.tryParse(requestJson['type'] as String?);
  if (type == null) {
    return BadRequestResponse(body: 'Missing type');
  }
  switch (type) {
    case InternalUsersOperation.get:
      return _onInternalGetUsersRequest(context, requestJson: requestJson);
    case InternalUsersOperation.find:
      return _onInternalFindUsersRequest(context, requestJson: requestJson);
  }
}

/// Setup like this because otherwise there is a max of user ids a GET request
/// can handle.
Future<Response> _onInternalGetUsersRequest(
  RequestContext context, {
  required Map<String, dynamic> requestJson,
}) async {
  final idsValue = requestJson['ids'] as List<dynamic>?;
  if (idsValue == null) {
    return BadRequestResponse(body: 'Missing ids');
  }
  final ids = idsValue.cast<String>();

  // Note: in your application you would not call a dao directly but use a
  // service or use case class.
  final dao = context.read<UserDao>();
  final users = await dao.getByUserIds(ids);

  return Response(
    body: jsonEncode(users.map((user) => user.toJson()).toList()),
  );
}

/// Setup like this because otherwise there is a max of user ids a GET request
/// can handle.
Future<Response> _onInternalFindUsersRequest(
  RequestContext context, {
  required Map<String, dynamic> requestJson,
}) async {
  final id = requestJson['id'] as String?;
  if (id == null) {
    return BadRequestResponse(body: 'Missing id');
  }

  // Note: in your application you would not call a dao directly but use a
  // service or use case class.
  final dao = context.read<UserDao>();
  final user = await dao.find(id);

  if (user == null) {
    return NotFoundResponse();
  }

  return Response(
    body: jsonEncode(user.toJson()),
  );
}
