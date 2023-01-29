import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_architecture_api_shared_presentation_dart_frog/presentation.dart';

Handler middleware(Handler handler) {
  return authenticationMiddleware(handler);
}
