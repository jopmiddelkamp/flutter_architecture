import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_domain/mediators.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthUnauthenticated()) {
    on<AuthLogIn>((event, emit) async {
      emit(AuthAuthenticated(event.token));
    });
    on<AuthLogOut>((event, emit) {
      emit(const AuthUnauthenticated());
    });
    TokenMediator.instance.tokenStream.listen((token) {
      if (token != null) {
        add(AuthLogIn(token));
      } else {
        add(const AuthLogOut());
      }
    });
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {}

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
