import 'package:flutter_architecture_api_auth_application/application.dart';
import 'package:flutter_architecture_api_auth_presentation_dart_frog/presentation.dart';
import 'package:flutter_architecture_api_shared_presentation_dart_frog/presentation.dart';

class AuthPresentationDartFrogModule {
  const AuthPresentationDartFrogModule._();

  static void registerAll(DependencyInjectionHelper helper) {
    final registerUserUseCase = helper.resolve<RegisterUserUseCase>();
    final loginUserUseCase = helper.resolve<LoginUserUseCase>();
    final logoutUserUseCase = helper.resolve<LogoutUserUseCase>();

    helper
      ..register<PostRegisterController>(
        PostRegisterController(registerUserUseCase),
      )
      ..register<PostLoginController>(
        PostLoginController(loginUserUseCase),
      )
      ..register<PostLogoutController>(
        PostLogoutController(logoutUserUseCase),
      )
      ..register<GetProfileController>(
        const GetProfileController(),
      );
  }
}
