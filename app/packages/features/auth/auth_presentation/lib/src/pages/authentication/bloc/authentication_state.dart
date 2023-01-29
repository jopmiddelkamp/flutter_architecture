import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_state.freezed.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    String? username,
    @Default(false) bool authenticating,
  }) = _AuthenticationState;
}

extension AuthenticationStateX on AuthenticationState {
  bool get isAuthenticated => username != null;
}
