import 'package:dart_frog/dart_frog.dart';

import 'models/api_error_dto.dart';

Response methodNotAllowed() => Response.json(
      statusCode: 405,
      body: const ApiErrorDto(
        code: 'METHOD_NOT_ALLOWED',
        message: 'Method Not Allowed',
      ).toJson(),
    );

Response invalidRequest(String message) => Response.json(
      statusCode: 400,
      body: ApiErrorDto(
        code: 'INVALID_REQUEST',
        message: message,
      ).toJson(),
    );

Response unauthorized([String message = 'Unauthorized']) => Response.json(
      statusCode: 401,
      body: ApiErrorDto(
        code: 'UNAUTHORIZED',
        message: message,
      ).toJson(),
    );

Response serverError(String message) => Response.json(
      statusCode: 500,
      body: const ApiErrorDto(
        code: 'SERVER_ERROR',
        // Error message is for internal logging only
        message: '',
      ).toJson(),
    );

Response badRequest(String message) => Response.json(
      statusCode: 400,
      body: ApiErrorDto(
        code: 'BAD_REQUEST',
        message: message,
      ).toJson(),
    );

Response notFound(String message) {
  return Response(
    statusCode: 404,
    body: message,
  );
}
