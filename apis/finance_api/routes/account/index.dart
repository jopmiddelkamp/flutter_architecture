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
  final accountData = requestJson['account_data'];
  if (accountData is! Map<String, dynamic>) {
    return Response(statusCode: 400, body: 'Invalid account_data');
  }

  final accountId = accountData['account_id'];
  if (accountId is! String || accountId.isEmpty) {
    return Response(statusCode: 400, body: 'Invalid account_data.account_id');
  }
  final signature = accountData['signature'];
  if (signature is! String || signature.isEmpty) {
    return Response(statusCode: 400, body: 'Invalid account_data.signature');
  }

  return Response.json(
    body: {
      'account_id': accountId,
    },
  );
}
