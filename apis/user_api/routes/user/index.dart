import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  try {
    final method = context.request.method;
    switch (method) {
      case HttpMethod.post:
        return _onPostRequest(context);
      case HttpMethod.get:
      case HttpMethod.put:
      case HttpMethod.delete:
      case HttpMethod.patch:
      case HttpMethod.head:
      case HttpMethod.options:
        return Response(statusCode: 405);
    }
  } catch (e) {
    return Response(statusCode: 500);
  }
}

Future<Response> _onPostRequest(RequestContext context) async {
  final requestJson = await context.request.json();
  if (requestJson is! Map<String, dynamic>) {
    return Response(statusCode: 400);
  }

  final accountId = requestJson['account_id'];
  if (accountId is! String || accountId.isEmpty) {
    return Response(statusCode: 400, body: 'Invalid account_id');
  }
  final username = requestJson['username'];
  if (username is! String || username.isEmpty) {
    return Response(statusCode: 400, body: 'Invalid username');
  }
  final email = requestJson['email'];
  if (email is! String || email.isEmpty) {
    return Response(statusCode: 400, body: 'Invalid email');
  }
  final phoneNumber = requestJson['phone_number'];
  if (phoneNumber is! String || phoneNumber.isEmpty) {
    return Response(statusCode: 400, body: 'Invalid phone_number');
  }

  return Response.json(
    body: {
      'user_id': '1',
    },
  );
}
