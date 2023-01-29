import 'package:dart_frog/dart_frog.dart';

import 'middleware/dependency_injection_middleware.dart';

Handler middleware(Handler handler) {
  return handler.use(dependencyInjectionMiddleware());
}
