import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_architecture_api_project_application/application.dart';
import 'package:flutter_architecture_api_shared_presentation_dart_frog/presentation.dart';

import '../../models/post_project_request.dart';
import '../../models/post_project_response.dart';

class PostProjectController {
  const PostProjectController(
    this._createProjectUseCase,
  );

  final CreateProjectUseCase _createProjectUseCase;

  Future<Response> handle(RequestContext context) async {
    final invalidMethod = await validatePostMethod(context);
    if (invalidMethod != null) {
      return invalidMethod;
    }

    late PostProjectRequest request;
    try {
      final body = await context.request.json() as Map<String, dynamic>;
      request = PostProjectRequest.fromJson(body);
    } on Exception catch (e) {
      return badRequest('Invalid request body: $e');
    }

    try {
      final result = await _createProjectUseCase.execute(
        name: request.name,
        description: request.description,
        ownerId: request.ownerId,
      );

      return Response.json(
        body: PostProjectResponse(
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
      return serverError('Create project failed: $e');
    }
  }
}
