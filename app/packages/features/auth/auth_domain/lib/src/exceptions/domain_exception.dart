import 'package:freezed_annotation/freezed_annotation.dart';

part 'domain_exception.freezed.dart';

@freezed
class DomainException with _$DomainException implements Exception {
  const factory DomainException.unauthenticated() =
      DomainUnauthenticatedException;
}
