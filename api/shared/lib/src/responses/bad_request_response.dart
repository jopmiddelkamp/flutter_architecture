import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

/// A [Response] with status code [HttpStatus.badRequest].
class BadRequestResponse extends Response {
  /// Creates a new [BadRequestResponse].
  BadRequestResponse({
    super.body,
    super.headers,
    super.encoding,
  }) : super(
          statusCode: HttpStatus.badRequest,
        );
}
