class ValidationException implements Exception {
  const ValidationException(this.code, this.message);

  final String code;
  final String message;

  @override
  String toString() => '[$code] $message';
}
