import 'dart:developer';

import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) {
  return handler.use(requestLogger()).use(_logging);
}

Handler _logging(Handler handler) {
  return (context) async {
    // Execute code before request is handled.
    log(
      '${context.request.method} ${context.request.uri}',
      name: 'Custom Middleware',
    );

    // Forward the request to the respective handler.
    final response = await handler(context);

    // Execute code after request is handled.

    // Return a response.
    return response;
  };
}
