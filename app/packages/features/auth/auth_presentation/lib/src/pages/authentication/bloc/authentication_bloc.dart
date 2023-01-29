import 'package:feature_auth_domain/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit({
    required AuthService authService,
  })  : _authService = authService,
        super(const AuthenticationState());

  final AuthService _authService;

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    await _authService.login(
      username,
      password,
    );
    emit(state.copyWith(
      username: username,
    ));
  }
}
