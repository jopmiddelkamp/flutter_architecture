import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

/// A [Response] with status code [HttpStatus.methodNotAllowed].
class MethodNotAllowedResponse extends Response {
  /// Creates a new [MethodNotAllowedResponse].
  MethodNotAllowedResponse({
    super.body,
    super.headers,
    super.encoding,
  }) : super(
          statusCode: HttpStatus.methodNotAllowed,
        );
}
