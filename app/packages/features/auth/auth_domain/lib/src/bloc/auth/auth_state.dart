part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

class AuthAuthenticated extends AuthState {
  const AuthAuthenticated(this.token);

  final String token;
}

class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}
