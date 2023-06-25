// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'internal_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InternalUser _$InternalUserFromJson(Map<String, dynamic> json) {
  return _InternalUser.fromJson(json);
}

/// @nodoc
mixin _$InternalUser {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InternalUserCopyWith<InternalUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InternalUserCopyWith<$Res> {
  factory $InternalUserCopyWith(
          InternalUser value, $Res Function(InternalUser) then) =
      _$InternalUserCopyWithImpl<$Res, InternalUser>;
  @useResult
  $Res call({String id, String name, String email});
}

/// @nodoc
class _$InternalUserCopyWithImpl<$Res, $Val extends InternalUser>
    implements $InternalUserCopyWith<$Res> {
  _$InternalUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InternalUserCopyWith<$Res>
    implements $InternalUserCopyWith<$Res> {
  factory _$$_InternalUserCopyWith(
          _$_InternalUser value, $Res Function(_$_InternalUser) then) =
      __$$_InternalUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String email});
}

/// @nodoc
class __$$_InternalUserCopyWithImpl<$Res>
    extends _$InternalUserCopyWithImpl<$Res, _$_InternalUser>
    implements _$$_InternalUserCopyWith<$Res> {
  __$$_InternalUserCopyWithImpl(
      _$_InternalUser _value, $Res Function(_$_InternalUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_$_InternalUser(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InternalUser implements _InternalUser {
  const _$_InternalUser(
      {required this.id, required this.name, required this.email});

  factory _$_InternalUser.fromJson(Map<String, dynamic> json) =>
      _$$_InternalUserFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String email;

  @override
  String toString() {
    return 'InternalUser(id: $id, name: $name, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InternalUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InternalUserCopyWith<_$_InternalUser> get copyWith =>
      __$$_InternalUserCopyWithImpl<_$_InternalUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InternalUserToJson(
      this,
    );
  }
}

abstract class _InternalUser implements InternalUser {
  const factory _InternalUser(
      {required final String id,
      required final String name,
      required final String email}) = _$_InternalUser;

  factory _InternalUser.fromJson(Map<String, dynamic> json) =
      _$_InternalUser.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_InternalUserCopyWith<_$_InternalUser> get copyWith =>
      throw _privateConstructorUsedError;
}
