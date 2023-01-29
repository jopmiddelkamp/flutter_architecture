// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthUserDto {
  int get id;
  String get emailAddress;

  /// Create a copy of AuthUserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthUserDtoCopyWith<AuthUserDto> get copyWith =>
      _$AuthUserDtoCopyWithImpl<AuthUserDto>(this as AuthUserDto, _$identity);

  /// Serializes this AuthUserDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthUserDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, emailAddress);

  @override
  String toString() {
    return 'AuthUserDto(id: $id, emailAddress: $emailAddress)';
  }
}

/// @nodoc
abstract mixin class $AuthUserDtoCopyWith<$Res> {
  factory $AuthUserDtoCopyWith(
          AuthUserDto value, $Res Function(AuthUserDto) _then) =
      _$AuthUserDtoCopyWithImpl;
  @useResult
  $Res call({int id, String emailAddress});
}

/// @nodoc
class _$AuthUserDtoCopyWithImpl<$Res> implements $AuthUserDtoCopyWith<$Res> {
  _$AuthUserDtoCopyWithImpl(this._self, this._then);

  final AuthUserDto _self;
  final $Res Function(AuthUserDto) _then;

  /// Create a copy of AuthUserDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? emailAddress = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      emailAddress: null == emailAddress
          ? _self.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AuthUserDto implements AuthUserDto {
  const _AuthUserDto({required this.id, required this.emailAddress});
  factory _AuthUserDto.fromJson(Map<String, dynamic> json) =>
      _$AuthUserDtoFromJson(json);

  @override
  final int id;
  @override
  final String emailAddress;

  /// Create a copy of AuthUserDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthUserDtoCopyWith<_AuthUserDto> get copyWith =>
      __$AuthUserDtoCopyWithImpl<_AuthUserDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AuthUserDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthUserDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, emailAddress);

  @override
  String toString() {
    return 'AuthUserDto(id: $id, emailAddress: $emailAddress)';
  }
}

/// @nodoc
abstract mixin class _$AuthUserDtoCopyWith<$Res>
    implements $AuthUserDtoCopyWith<$Res> {
  factory _$AuthUserDtoCopyWith(
          _AuthUserDto value, $Res Function(_AuthUserDto) _then) =
      __$AuthUserDtoCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String emailAddress});
}

/// @nodoc
class __$AuthUserDtoCopyWithImpl<$Res> implements _$AuthUserDtoCopyWith<$Res> {
  __$AuthUserDtoCopyWithImpl(this._self, this._then);

  final _AuthUserDto _self;
  final $Res Function(_AuthUserDto) _then;

  /// Create a copy of AuthUserDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? emailAddress = null,
  }) {
    return _then(_AuthUserDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      emailAddress: null == emailAddress
          ? _self.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
