import 'package:dart_frog/dart_frog.dart';
import 'package:in_memory_project_dao/dao.dart';
import 'package:in_memory_project_dao/models.dart';
import 'package:internal_user_api_dao/dao.dart';
import 'package:middelkamp_dev_api_project/builders.dart';
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
  final dao = context.read<ProjectDao>();
  final project = await dao.find(id);

  if (project == null) {
    return NotFoundResponse();
  }

  // Note: in your application you would not call a dao directly but use a
  // service or use case class.
  final internalUserDao = context.read<InternalUserDao>();
  final manager = await internalUserDao.find(project.managerUserId);

  if (manager == null) {
    return InternalServerErrorResponse();
  }

  // Note: Getting the data and merging it is business logic and will normally
  // be done in a service or use case class.
  final result = ProjectDtoBuilder.build(project, manager);

  return Response.json(
    body: result.toJson(),
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
  final dao = context.read<ProjectDao>();
  var project = await dao.find(id);
  if (project == null) {
    return NotFoundResponse();
  }
  project = project.copyWith(
    name: requestJson['name'] as String,
    budget: requestJson['budget'] as double,
    managerUserId: requestJson['managerUserId'] as String,
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
  final dao = context.read<ProjectDao>();
  var project = await dao.find(id);
  if (project == null) {
    return NotFoundResponse();
  }
  final nameData = requestJson['name'] as Map<String, dynamic>?;
  final name = nameData?['value'] as String?;

  final budgetData = requestJson['budget'] as Map<String, dynamic>?;
  final budget = budgetData?['value'] as double?;

  final managerUserIdData =
      requestJson['managerUserId'] as Map<String, dynamic>?;
  final managerUserId = managerUserIdData?['value'] as String?;

  project = Project(
    id: project.id,
    name: name ?? project.name,
    budget: budget ?? project.budget,
    managerUserId: managerUserId ?? project.managerUserId,
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
  final dao = context.read<ProjectDao>();
  await dao.delete(id);

  return Response.json();
}
