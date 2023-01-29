import 'package:json_annotation/json_annotation.dart';

part 'api_error_dto.g.dart';

@JsonSerializable()
class ApiErrorDto {
  const ApiErrorDto({
    required this.code,
    required this.message,
  });

  factory ApiErrorDto.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorDtoFromJson(json);

  final String code;
  final String message;

  Map<String, dynamic> toJson() => _$ApiErrorDtoToJson(this);
}
