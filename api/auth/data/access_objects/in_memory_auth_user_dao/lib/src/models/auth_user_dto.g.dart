// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthUserDto _$$_AuthUserDtoFromJson(Map<String, dynamic> json) =>
    _$_AuthUserDto(
      username: json['username'] as String,
      password: json['password'] as String,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$$_AuthUserDtoToJson(_$_AuthUserDto instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'userId': instance.userId,
    };
