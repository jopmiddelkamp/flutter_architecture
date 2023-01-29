import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_architecture_api_project_presentation_dart_frog/presentation.dart';
import 'package:flutter_architecture_api_shared_presentation_dart_frog/presentation.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  switch (context.request.method) {
    case HttpMethod.get:
      final controller = context.read<GetProjectController>();
      return controller.handle(context, id);
    case HttpMethod.put:
      final controller = context.read<PutProjectController>();
      return controller.handle(context, id);
    case HttpMethod.delete:
      final controller = context.read<DeleteProjectController>();
      return controller.handle(context, id);
    case HttpMethod.post:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
      return methodNotAllowed();
  }
}
