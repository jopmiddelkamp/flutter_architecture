import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_architecture_api_shared_presentation_dart_frog/presentation.dart';

import '../dependency_injection/application_module.dart';
import '../dependency_injection/infrastructure_module.dart';
import '../dependency_injection/presentation_module.dart';

Middleware dependencyInjectionMiddleware() {
  return (handler) {
    handler.use(requestLogger());

    final helper = DependencyInjectionHelper(handler);

    // Infrastructure setup
    AuthInfrastructureModule.registerAll(helper);

    // Application setup
    AuthApplicationModule.registerAll(helper);

    // Presentation setup
    AuthPresentationDartFrogModule.registerAll(helper);

    // Provide dependencies
    return helper.handler;
  };
}
