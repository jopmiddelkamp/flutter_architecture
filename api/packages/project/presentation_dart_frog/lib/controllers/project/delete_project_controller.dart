import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_architecture_api_project_application/application.dart';
import 'package:flutter_architecture_api_shared_presentation_dart_frog/presentation.dart';

class DeleteProjectController {
  const DeleteProjectController(
    this._deleteProjectUseCase,
  );

  final DeleteProjectUseCase _deleteProjectUseCase;

  Future<Response> handle(RequestContext context, String idParam) async {
    final invalidMethod = await validateDeleteMethod(context);
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
      await _deleteProjectUseCase.execute(id);
      return Response.json(
        body: {'message': 'Project deleted successfully'},
      );
    } on Exception catch (e) {
      return serverError('Delete project failed: $e');
    }
  }
}
