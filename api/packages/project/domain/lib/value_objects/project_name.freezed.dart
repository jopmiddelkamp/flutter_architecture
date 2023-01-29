// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_name.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectName {
  String get value;

  /// Create a copy of ProjectName
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectNameCopyWith<ProjectName> get copyWith =>
      _$ProjectNameCopyWithImpl<ProjectName>(this as ProjectName, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectName &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'ProjectName(value: $value)';
  }
}

/// @nodoc
abstract mixin class $ProjectNameCopyWith<$Res> {
  factory $ProjectNameCopyWith(
          ProjectName value, $Res Function(ProjectName) _then) =
      _$ProjectNameCopyWithImpl;
  @useResult
  $Res call({String value});
}

/// @nodoc
class _$ProjectNameCopyWithImpl<$Res> implements $ProjectNameCopyWith<$Res> {
  _$ProjectNameCopyWithImpl(this._self, this._then);

  final ProjectName _self;
  final $Res Function(ProjectName) _then;

  /// Create a copy of ProjectName
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_self.copyWith(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _ProjectName implements ProjectName {
  const _ProjectName(this.value);

  @override
  final String value;

  /// Create a copy of ProjectName
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectNameCopyWith<_ProjectName> get copyWith =>
      __$ProjectNameCopyWithImpl<_ProjectName>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectName &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'ProjectName._(value: $value)';
  }
}

/// @nodoc
abstract mixin class _$ProjectNameCopyWith<$Res>
    implements $ProjectNameCopyWith<$Res> {
  factory _$ProjectNameCopyWith(
          _ProjectName value, $Res Function(_ProjectName) _then) =
      __$ProjectNameCopyWithImpl;
  @override
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$ProjectNameCopyWithImpl<$Res> implements _$ProjectNameCopyWith<$Res> {
  __$ProjectNameCopyWithImpl(this._self, this._then);

  final _ProjectName _self;
  final $Res Function(_ProjectName) _then;

  /// Create a copy of ProjectName
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(_ProjectName(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
