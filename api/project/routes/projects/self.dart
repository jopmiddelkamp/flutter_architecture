import 'package:dart_frog/dart_frog.dart';
import 'package:in_memory_project_dao/dao.dart';
import 'package:internal_user_api_dao/dao.dart';
import 'package:middelkamp_dev_api_project/builders.dart';
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
  final dao = context.read<ProjectDao>();
  final projects = await dao.getByUserId(token.userId);

  // Note: in your application you would not call a dao directly but use a
  // service or use case class.
  final internalUserDao = context.read<InternalUserDao>();
  final managerUserIds = projects.map((e) => e.managerUserId).toList();
  final managers = await internalUserDao.getByIds(managerUserIds);

  // Note: Getting the data and merging it is business logic and will normally
  // be done in a service or use case class.
  final result = ProjectDtoBuilder.buildMany(projects, managers);

  return Response.json(
    body: result.map((project) => project.toJson()).toList(),
  );
}
