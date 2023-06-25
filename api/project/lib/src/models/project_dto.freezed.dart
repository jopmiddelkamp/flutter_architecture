// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProjectDto _$ProjectDtoFromJson(Map<String, dynamic> json) {
  return _ProjectDto.fromJson(json);
}

/// @nodoc
mixin _$ProjectDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get budget => throw _privateConstructorUsedError;
  String get managerUserId => throw _privateConstructorUsedError;
  UserDto get managerUser => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectDtoCopyWith<ProjectDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectDtoCopyWith<$Res> {
  factory $ProjectDtoCopyWith(
          ProjectDto value, $Res Function(ProjectDto) then) =
      _$ProjectDtoCopyWithImpl<$Res, ProjectDto>;
  @useResult
  $Res call(
      {String id,
      String name,
      double budget,
      String managerUserId,
      UserDto managerUser});

  $UserDtoCopyWith<$Res> get managerUser;
}

/// @nodoc
class _$ProjectDtoCopyWithImpl<$Res, $Val extends ProjectDto>
    implements $ProjectDtoCopyWith<$Res> {
  _$ProjectDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? budget = null,
    Object? managerUserId = null,
    Object? managerUser = null,
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
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as double,
      managerUserId: null == managerUserId
          ? _value.managerUserId
          : managerUserId // ignore: cast_nullable_to_non_nullable
              as String,
      managerUser: null == managerUser
          ? _value.managerUser
          : managerUser // ignore: cast_nullable_to_non_nullable
              as UserDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res> get managerUser {
    return $UserDtoCopyWith<$Res>(_value.managerUser, (value) {
      return _then(_value.copyWith(managerUser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProjectDtoCopyWith<$Res>
    implements $ProjectDtoCopyWith<$Res> {
  factory _$$_ProjectDtoCopyWith(
          _$_ProjectDto value, $Res Function(_$_ProjectDto) then) =
      __$$_ProjectDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      double budget,
      String managerUserId,
      UserDto managerUser});

  @override
  $UserDtoCopyWith<$Res> get managerUser;
}

/// @nodoc
class __$$_ProjectDtoCopyWithImpl<$Res>
    extends _$ProjectDtoCopyWithImpl<$Res, _$_ProjectDto>
    implements _$$_ProjectDtoCopyWith<$Res> {
  __$$_ProjectDtoCopyWithImpl(
      _$_ProjectDto _value, $Res Function(_$_ProjectDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? budget = null,
    Object? managerUserId = null,
    Object? managerUser = null,
  }) {
    return _then(_$_ProjectDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as double,
      managerUserId: null == managerUserId
          ? _value.managerUserId
          : managerUserId // ignore: cast_nullable_to_non_nullable
              as String,
      managerUser: null == managerUser
          ? _value.managerUser
          : managerUser // ignore: cast_nullable_to_non_nullable
              as UserDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProjectDto implements _ProjectDto {
  const _$_ProjectDto(
      {required this.id,
      required this.name,
      required this.budget,
      required this.managerUserId,
      required this.managerUser});

  factory _$_ProjectDto.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectDtoFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double budget;
  @override
  final String managerUserId;
  @override
  final UserDto managerUser;

  @override
  String toString() {
    return 'ProjectDto(id: $id, name: $name, budget: $budget, managerUserId: $managerUserId, managerUser: $managerUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.managerUserId, managerUserId) ||
                other.managerUserId == managerUserId) &&
            (identical(other.managerUser, managerUser) ||
                other.managerUser == managerUser));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, budget, managerUserId, managerUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectDtoCopyWith<_$_ProjectDto> get copyWith =>
      __$$_ProjectDtoCopyWithImpl<_$_ProjectDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectDtoToJson(
      this,
    );
  }
}

abstract class _ProjectDto implements ProjectDto {
  const factory _ProjectDto(
      {required final String id,
      required final String name,
      required final double budget,
      required final String managerUserId,
      required final UserDto managerUser}) = _$_ProjectDto;

  factory _ProjectDto.fromJson(Map<String, dynamic> json) =
      _$_ProjectDto.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get budget;
  @override
  String get managerUserId;
  @override
  UserDto get managerUser;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectDtoCopyWith<_$_ProjectDto> get copyWith =>
      throw _privateConstructorUsedError;
}
