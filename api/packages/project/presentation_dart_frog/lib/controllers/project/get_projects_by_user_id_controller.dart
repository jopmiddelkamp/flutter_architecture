import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_architecture_api_project_application/application.dart';
import 'package:flutter_architecture_api_shared_presentation_dart_frog/presentation.dart';

import '../../models/get_projects_by_user_id_request.dart';
import '../../models/get_projects_by_user_id_response.dart';
import '../../models/project_response.dart';

class GetProjectsByUserIdController {
  const GetProjectsByUserIdController(
    this._getProjectsByUserIdUseCase,
  );

  final GetProjectsByUserIdUseCase _getProjectsByUserIdUseCase;

  Future<Response> handle(RequestContext context) async {
    final invalidMethod = await validateGetMethod(context);
    if (invalidMethod != null) {
      return invalidMethod;
    }

    late GetProjectsByUserIdRequest request;
    try {
      final body = await context.request.json() as Map<String, dynamic>;
      request = GetProjectsByUserIdRequest.fromJson(body);
    } on Exception catch (e) {
      return badRequest('Invalid request body: $e');
    }

    try {
      final result = await _getProjectsByUserIdUseCase.execute(
        request.userId,
      );

      return Response.json(
        body: GetProjectsByUserIdResponse(
          projects: result
              .map(
                (project) => ProjectResponse(
                  id: project.id,
                  name: project.name,
                  description: project.description,
                  ownerId: project.ownerId,
                  createdAt: project.createdAt,
                  updatedAt: project.updatedAt,
                  memberIds: project.memberIds,
                ),
              )
              .toList(),
        ).toJson(),
      );
    } on Exception catch (e) {
      return serverError('Get projects by user ID failed: $e');
    }
  }
}
