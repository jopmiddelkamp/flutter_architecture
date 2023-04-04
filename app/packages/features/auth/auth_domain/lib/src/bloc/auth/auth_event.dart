part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

@immutable
class AuthLogIn extends AuthEvent {
  const AuthLogIn(this.token);

  final String token;
}

@immutable
class AuthLogOut extends AuthEvent {
  const AuthLogOut();
}
