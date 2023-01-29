import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_architecture_api_project_application/application.dart';
import 'package:flutter_architecture_api_shared_presentation_dart_frog/presentation.dart';

import '../../models/put_project_request.dart';
import '../../models/put_project_response.dart';

class PutProjectController {
  const PutProjectController(
    this._updateProjectUseCase,
  );

  final UpdateProjectUseCase _updateProjectUseCase;

  Future<Response> handle(RequestContext context, String idParam) async {
    final invalidMethod = await validatePutMethod(context);
    if (invalidMethod != null) {
      return invalidMethod;
    }

    final int id;
    try {
      id = int.parse(idParam);
    } on Exception catch (_) {
      return notFound('Project not found');
    }

    late PutProjectRequest request;
    try {
      final body = await context.request.json() as Map<String, dynamic>;
      request = PutProjectRequest.fromJson(body);
    } on Exception catch (e) {
      return badRequest('Invalid request body: $e');
    }

    try {
      final result = await _updateProjectUseCase.execute(
        id: id,
        name: request.name,
        description: request.description,
      );

      return Response.json(
        body: PutProjectResponse(
          id: result.id,
          name: result.name,
          description: result.description,
          ownerId: result.ownerId,
          createdAt: result.createdAt,
          updatedAt: result.updatedAt,
          memberIds: result.memberIds,
        ).toJson(),
      );
    } on Exception catch (e) {
      return serverError('Update project failed: $e');
    }
  }
}
