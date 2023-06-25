import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

/// A [Response] with status code [HttpStatus.notFound].
class NotFoundResponse extends Response {
  /// Creates a new [NotFoundResponse].
  NotFoundResponse({
    super.body,
    super.headers,
    super.encoding,
  }) : super(
          statusCode: HttpStatus.notFound,
        );
}
