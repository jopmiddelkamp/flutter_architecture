// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_description.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectDescription {
  String get value;

  /// Create a copy of ProjectDescription
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectDescriptionCopyWith<ProjectDescription> get copyWith =>
      _$ProjectDescriptionCopyWithImpl<ProjectDescription>(
          this as ProjectDescription, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectDescription &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'ProjectDescription(value: $value)';
  }
}

/// @nodoc
abstract mixin class $ProjectDescriptionCopyWith<$Res> {
  factory $ProjectDescriptionCopyWith(
          ProjectDescription value, $Res Function(ProjectDescription) _then) =
      _$ProjectDescriptionCopyWithImpl;
  @useResult
  $Res call({String value});
}

/// @nodoc
class _$ProjectDescriptionCopyWithImpl<$Res>
    implements $ProjectDescriptionCopyWith<$Res> {
  _$ProjectDescriptionCopyWithImpl(this._self, this._then);

  final ProjectDescription _self;
  final $Res Function(ProjectDescription) _then;

  /// Create a copy of ProjectDescription
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

class _ProjectDescription implements ProjectDescription {
  const _ProjectDescription(this.value);

  @override
  final String value;

  /// Create a copy of ProjectDescription
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectDescriptionCopyWith<_ProjectDescription> get copyWith =>
      __$ProjectDescriptionCopyWithImpl<_ProjectDescription>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectDescription &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'ProjectDescription._(value: $value)';
  }
}

/// @nodoc
abstract mixin class _$ProjectDescriptionCopyWith<$Res>
    implements $ProjectDescriptionCopyWith<$Res> {
  factory _$ProjectDescriptionCopyWith(
          _ProjectDescription value, $Res Function(_ProjectDescription) _then) =
      __$ProjectDescriptionCopyWithImpl;
  @override
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$ProjectDescriptionCopyWithImpl<$Res>
    implements _$ProjectDescriptionCopyWith<$Res> {
  __$ProjectDescriptionCopyWithImpl(this._self, this._then);

  final _ProjectDescription _self;
  final $Res Function(_ProjectDescription) _then;

  /// Create a copy of ProjectDescription
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(_ProjectDescription(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
