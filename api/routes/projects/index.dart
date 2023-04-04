import 'package:dart_frog/dart_frog.dart';
import 'package:in_memory_project_dao/dao.dart';

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
  final dao = context.read<ProjectDao>();
  final projects = await dao.getAll();

  return Response.json(
    body: projects.map((project) => project.toJson()).toList(),
  );
}
