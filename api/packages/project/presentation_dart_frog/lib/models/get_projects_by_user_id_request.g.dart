// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_projects_by_user_id_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProjectsByUserIdRequest _$GetProjectsByUserIdRequestFromJson(
        Map<String, dynamic> json) =>
    GetProjectsByUserIdRequest(
      userId: (json['userId'] as num).toInt(),
    );

Map<String, dynamic> _$GetProjectsByUserIdRequestToJson(
        GetProjectsByUserIdRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
    };
