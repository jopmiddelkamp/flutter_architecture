import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_architecture_api_project_presentation_dart_frog/presentation.dart';
import 'package:flutter_architecture_api_shared_presentation_dart_frog/presentation.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.post:
      final controller = context.read<PostProjectController>();
      return controller.handle(context);
    case HttpMethod.get:
      final controller = context.read<GetProjectsByUserIdController>();
      return controller.handle(context);
    case HttpMethod.put:
    case HttpMethod.delete:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
      return methodNotAllowed();
  }
}
