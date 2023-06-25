import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

/// A [Response] with status code [HttpStatus.forbidden].
class ForbiddenResponse extends Response {
  /// Creates a new [ForbiddenResponse].
  ForbiddenResponse({
    super.body,
    super.headers,
    super.encoding,
  }) : super(
          statusCode: HttpStatus.forbidden,
        );
}
