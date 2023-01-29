// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorDto _$ApiErrorDtoFromJson(Map<String, dynamic> json) => ApiErrorDto(
      code: json['code'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ApiErrorDtoToJson(ApiErrorDto instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
