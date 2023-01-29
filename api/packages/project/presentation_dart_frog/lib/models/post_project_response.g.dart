// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_project_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostProjectResponse _$PostProjectResponseFromJson(Map<String, dynamic> json) =>
    PostProjectResponse(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      ownerId: (json['ownerId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      memberIds:
          (json['memberIds'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PostProjectResponseToJson(
        PostProjectResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'ownerId': instance.ownerId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'memberIds': instance.memberIds,
    };
