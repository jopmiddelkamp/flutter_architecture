// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'put_project_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PutProjectRequest _$PutProjectRequestFromJson(Map<String, dynamic> json) =>
    PutProjectRequest(
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$PutProjectRequestToJson(PutProjectRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
    };
