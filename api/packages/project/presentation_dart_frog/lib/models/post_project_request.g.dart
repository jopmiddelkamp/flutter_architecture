// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_project_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostProjectRequest _$PostProjectRequestFromJson(Map<String, dynamic> json) =>
    PostProjectRequest(
      name: json['name'] as String,
      description: json['description'] as String,
      ownerId: (json['ownerId'] as num).toInt(),
    );

Map<String, dynamic> _$PostProjectRequestToJson(PostProjectRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'ownerId': instance.ownerId,
    };
