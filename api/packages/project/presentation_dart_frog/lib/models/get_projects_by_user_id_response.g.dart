// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_projects_by_user_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProjectsByUserIdResponse _$GetProjectsByUserIdResponseFromJson(
        Map<String, dynamic> json) =>
    GetProjectsByUserIdResponse(
      projects: (json['projects'] as List<dynamic>)
          .map((e) => ProjectResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetProjectsByUserIdResponseToJson(
        GetProjectsByUserIdResponse instance) =>
    <String, dynamic>{
      'projects': instance.projects,
    };
