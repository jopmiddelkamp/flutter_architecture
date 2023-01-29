import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  return Response.json(
    body: {'message': 'Welcome to the Projects API!'},
  );
}
