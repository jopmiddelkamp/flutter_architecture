// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthUserDto _$AuthUserDtoFromJson(Map<String, dynamic> json) {
  return _AuthUserDto.fromJson(json);
}

/// @nodoc
mixin _$AuthUserDto {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthUserDtoCopyWith<AuthUserDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthUserDtoCopyWith<$Res> {
  factory $AuthUserDtoCopyWith(
          AuthUserDto value, $Res Function(AuthUserDto) then) =
      _$AuthUserDtoCopyWithImpl<$Res, AuthUserDto>;
  @useResult
  $Res call({String username, String password, String userId});
}

/// @nodoc
class _$AuthUserDtoCopyWithImpl<$Res, $Val extends AuthUserDto>
    implements $AuthUserDtoCopyWith<$Res> {
  _$AuthUserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthUserDtoCopyWith<$Res>
    implements $AuthUserDtoCopyWith<$Res> {
  factory _$$_AuthUserDtoCopyWith(
          _$_AuthUserDto value, $Res Function(_$_AuthUserDto) then) =
      __$$_AuthUserDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String password, String userId});
}

/// @nodoc
class __$$_AuthUserDtoCopyWithImpl<$Res>
    extends _$AuthUserDtoCopyWithImpl<$Res, _$_AuthUserDto>
    implements _$$_AuthUserDtoCopyWith<$Res> {
  __$$_AuthUserDtoCopyWithImpl(
      _$_AuthUserDto _value, $Res Function(_$_AuthUserDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? userId = null,
  }) {
    return _then(_$_AuthUserDto(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthUserDto implements _AuthUserDto {
  const _$_AuthUserDto(
      {required this.username, required this.password, required this.userId});

  factory _$_AuthUserDto.fromJson(Map<String, dynamic> json) =>
      _$$_AuthUserDtoFromJson(json);

  @override
  final String username;
  @override
  final String password;
  @override
  final String userId;

  @override
  String toString() {
    return 'AuthUserDto(username: $username, password: $password, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthUserDto &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, username, password, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthUserDtoCopyWith<_$_AuthUserDto> get copyWith =>
      __$$_AuthUserDtoCopyWithImpl<_$_AuthUserDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthUserDtoToJson(
      this,
    );
  }
}

abstract class _AuthUserDto implements AuthUserDto {
  const factory _AuthUserDto(
      {required final String username,
      required final String password,
      required final String userId}) = _$_AuthUserDto;

  factory _AuthUserDto.fromJson(Map<String, dynamic> json) =
      _$_AuthUserDto.fromJson;

  @override
  String get username;
  @override
  String get password;
  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$$_AuthUserDtoCopyWith<_$_AuthUserDto> get copyWith =>
      throw _privateConstructorUsedError;
}
