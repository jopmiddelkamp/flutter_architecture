class ApiError {
  const ApiError({
    required this.code,
    required this.message,
  });

  final String code;
  final String message;
}
