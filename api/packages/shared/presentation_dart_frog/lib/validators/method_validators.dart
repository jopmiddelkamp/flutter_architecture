import 'package:dart_frog/dart_frog.dart';

import '../error_responses.dart';

Future<Response?> validatePostMethod(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return methodNotAllowed();
  }
  return null;
}

Future<Response?> validateGetMethod(RequestContext context) async {
  if (context.request.method != HttpMethod.get) {
    return methodNotAllowed();
  }
  return null;
}

Future<Response?> validatePutMethod(RequestContext context) async {
  if (context.request.method != HttpMethod.put) {
    return methodNotAllowed();
  }
  return null;
}

Future<Response?> validateDeleteMethod(RequestContext context) async {
  if (context.request.method != HttpMethod.delete) {
    return methodNotAllowed();
  }
  return null;
}

Future<Response?> validatePatchMethod(RequestContext context) async {
  if (context.request.method != HttpMethod.patch) {
    return methodNotAllowed();
  }
  return null;
}
