import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_architecture_api_auth_presentation_dart_frog/presentation.dart';
import 'package:flutter_architecture_api_shared_presentation_dart_frog/presentation.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.get:
      final controller = context.read<GetProfileController>();
      return controller.handle(context);
    case HttpMethod.delete:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.post:
    case HttpMethod.put:
      return methodNotAllowed();
  }
}
