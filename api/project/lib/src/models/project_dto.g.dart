// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProjectDto _$$_ProjectDtoFromJson(Map<String, dynamic> json) =>
    _$_ProjectDto(
      id: json['id'] as String,
      name: json['name'] as String,
      budget: (json['budget'] as num).toDouble(),
      managerUserId: json['managerUserId'] as String,
      managerUser:
          UserDto.fromJson(json['managerUser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProjectDtoToJson(_$_ProjectDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'budget': instance.budget,
      'managerUserId': instance.managerUserId,
      'managerUser': instance.managerUser,
    };
