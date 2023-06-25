import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

/// A [Response] with status code [HttpStatus.internalServerError].
class InternalServerErrorResponse extends Response {
  /// Creates a new [InternalServerErrorResponse].
  InternalServerErrorResponse({
    super.body,
    super.headers,
    super.encoding,
  }) : super(
          statusCode: HttpStatus.internalServerError,
        );
}
