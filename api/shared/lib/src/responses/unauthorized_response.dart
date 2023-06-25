import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

/// A [Response] with status code [HttpStatus.unauthorized].
class UnauthorizedResponse extends Response {
  /// Creates a new [UnauthorizedResponse].
  UnauthorizedResponse({
    super.body,
    super.headers,
    super.encoding,
  }) : super(
          statusCode: HttpStatus.unauthorized,
        );
}
