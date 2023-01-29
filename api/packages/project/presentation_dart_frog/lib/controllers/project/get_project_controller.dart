import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_architecture_api_project_application/application.dart';
import 'package:flutter_architecture_api_shared_presentation_dart_frog/presentation.dart';

import '../../models/get_project_response.dart';
import '../../models/project_response.dart';

class GetProjectController {
  const GetProjectController(
    this._getProjectUseCase,
  );

  final GetProjectUseCase _getProjectUseCase;

  Future<Response> handle(RequestContext context, String idParam) async {
    final invalidMethod = await validateGetMethod(context);
    if (invalidMethod != null) {
      return invalidMethod;
    }

    final int id;
    try {
      id = int.parse(idParam);
    } on Exception catch (_) {
      return notFound('Project not found');
    }

    try {
      final result = await _getProjectUseCase.execute(id);
      if (result == null) {
        return notFound('Project not found');
      }

      return Response.json(
        body: GetProjectResponse(
          project: ProjectResponse(
            id: result.id,
            name: result.name,
            description: result.description,
            ownerId: result.ownerId,
            createdAt: result.createdAt,
            updatedAt: result.updatedAt,
            memberIds: result.memberIds,
          ),
        ).toJson(),
      );
    } on Exception catch (e) {
      return serverError('Get project failed: $e');
    }
  }
}
