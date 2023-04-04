// ignore_for_file: public_member_api_docs

import 'package:dart_frog/dart_frog.dart';
import 'package:middelkamp_dev_api/models/models.dart';

extension RequestContextX on RequestContext {
  Token? get token {
    final token = request.headers['authorization'];
    if (token == null) {
      return null;
    }
    final result = Token.decode(token);
    return result;
  }
}
