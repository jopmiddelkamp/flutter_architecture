// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_project_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProjectResponse _$GetProjectResponseFromJson(Map<String, dynamic> json) =>
    GetProjectResponse(
      project:
          ProjectResponse.fromJson(json['project'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetProjectResponseToJson(GetProjectResponse instance) =>
    <String, dynamic>{
      'project': instance.project,
    };
