import 'package:dart_frog/dart_frog.dart';
import 'package:in_memory_project_dao/dao.dart';
import 'package:in_memory_project_dao/models.dart';
import 'package:middelkamp_dev_api/extensions/extensions.dart';

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
      return Response(statusCode: 405);
  }
}

Future<Response> _onGetRequest(
  RequestContext context,
  String id,
) async {
  final dao = context.read<ProjectDao>();
  final project = await dao.find(id);

  return Response.json(
    body: project?.toJson(),
  );
}

Future<Response> _onPostRequest(
  RequestContext context,
  String id,
) async {
  final requestJson = await context.request.json();
  if (requestJson is! Map<String, dynamic>) {
    return Response(statusCode: 400);
  }

  final token = context.token;
  if (token == null) {
    return Response(statusCode: 401);
  }
  if (token.userId != id) {
    return Response(statusCode: 403);
  }

  final dao = context.read<ProjectDao>();
  var project = await dao.find(id);
  if (project == null) {
    return Response(statusCode: 404);
  }
  project = project.copyWith(
    name: requestJson['name'] as String,
    budget: requestJson['budget'] as double,
    managerId: requestJson['managerId'] as String,
  );
  await dao.update(id, project);

  return Response.json(
    body: project.toJson(),
  );
}

Future<Response> _onPutRequest(
  RequestContext context,
  String id,
) async {
  final requestJson = await context.request.json();
  if (requestJson is! Map<String, dynamic>) {
    return Response(statusCode: 400);
  }

  final token = context.token;
  if (token == null) {
    return Response(statusCode: 401);
  }
  if (token.userId != id) {
    return Response(statusCode: 403);
  }

  final dao = context.read<ProjectDao>();
  var project = await dao.find(id);
  if (project == null) {
    return Response(statusCode: 404);
  }
  final nameData = requestJson['name'] as Map<String, dynamic>?;
  final name = nameData?['value'] as String?;

  final budgetData = requestJson['budget'] as Map<String, dynamic>?;
  final budget = budgetData?['value'] as double?;

  final managerIdData = requestJson['managerId'] as Map<String, dynamic>?;
  final managerId = managerIdData?['value'] as String?;

  project = Project(
    id: project.id,
    name: name ?? project.name,
    budget: budget ?? project.budget,
    managerId: managerId ?? project.managerId,
  );
  await dao.update(id, project);

  return Response.json(
    body: project.toJson(),
  );
}

Future<Response> _onDeleteRequest(
  RequestContext context,
  String id,
) async {
  final requestJson = await context.request.json();
  if (requestJson is! Map<String, dynamic>) {
    return Response(statusCode: 400);
  }

  final token = context.token;
  if (token == null) {
    return Response(statusCode: 401);
  }
  if (token.userId != id) {
    return Response(statusCode: 403);
  }

  final dao = context.read<ProjectDao>();
  await dao.delete(id);

  return Response.json();
}
