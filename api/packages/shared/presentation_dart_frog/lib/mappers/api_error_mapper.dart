import 'package:flutter_architecture_api_shared_domain/errors/api_error.dart';

import '../models/api_error_dto.dart';

/// Maps [ApiErrorDto] to [ApiError] (domain) and vice versa.
class ApiErrorMapper {
  /// Converts an [ApiErrorDto] to a domain [ApiError].
  static ApiError toDomain(ApiErrorDto dto) {
    final error = ApiError(code: dto.code, message: dto.message);
    return error;
  }

  /// Converts a domain [ApiError] to an [ApiErrorDto].
  static ApiErrorDto fromDomain(ApiError error) {
    final dto = ApiErrorDto(code: error.code, message: error.message);
    return dto;
  }
}
