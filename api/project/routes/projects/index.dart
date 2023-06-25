import 'dart:developer';

import 'package:dart_frog/dart_frog.dart';
import 'package:in_memory_project_dao/dao.dart';
import 'package:internal_user_api_dao/dao.dart';
import 'package:middelkamp_dev_api_project/src/builders/project_dto_builder.dart';
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
  final dao = context.read<ProjectDao>();
  final projects = await dao.getAll();

  log('projects: $projects');

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
