// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmailAddress {
  String get value;

  /// Create a copy of EmailAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EmailAddressCopyWith<EmailAddress> get copyWith =>
      _$EmailAddressCopyWithImpl<EmailAddress>(
          this as EmailAddress, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EmailAddress &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'EmailAddress(value: $value)';
  }
}

/// @nodoc
abstract mixin class $EmailAddressCopyWith<$Res> {
  factory $EmailAddressCopyWith(
          EmailAddress value, $Res Function(EmailAddress) _then) =
      _$EmailAddressCopyWithImpl;
  @useResult
  $Res call({String value});
}

/// @nodoc
class _$EmailAddressCopyWithImpl<$Res> implements $EmailAddressCopyWith<$Res> {
  _$EmailAddressCopyWithImpl(this._self, this._then);

  final EmailAddress _self;
  final $Res Function(EmailAddress) _then;

  /// Create a copy of EmailAddress
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

class _EmailAddress implements EmailAddress {
  const _EmailAddress(this.value);

  @override
  final String value;

  /// Create a copy of EmailAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EmailAddressCopyWith<_EmailAddress> get copyWith =>
      __$EmailAddressCopyWithImpl<_EmailAddress>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EmailAddress &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'EmailAddress._(value: $value)';
  }
}

/// @nodoc
abstract mixin class _$EmailAddressCopyWith<$Res>
    implements $EmailAddressCopyWith<$Res> {
  factory _$EmailAddressCopyWith(
          _EmailAddress value, $Res Function(_EmailAddress) _then) =
      __$EmailAddressCopyWithImpl;
  @override
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$EmailAddressCopyWithImpl<$Res>
    implements _$EmailAddressCopyWith<$Res> {
  __$EmailAddressCopyWithImpl(this._self, this._then);

  final _EmailAddress _self;
  final $Res Function(_EmailAddress) _then;

  /// Create a copy of EmailAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(_EmailAddress(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
