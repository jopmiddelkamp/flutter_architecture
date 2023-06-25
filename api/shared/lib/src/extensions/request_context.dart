// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:dart_frog/dart_frog.dart';
import 'package:middelkamp_dev_api_shared/api_secret.dart';
import 'package:middelkamp_dev_api_shared/src/models/token.dart';

extension RequestContextX on RequestContext {
  Token? get token {
    final token = request.headers['Authorization'];
    if (token == null) {
      return null;
    }
    final result = Token.decode(token);
    return result;
  }

  bool get validInternalApiRequest {
    final header = request.headers[kInternalApiHeaderName];
    log('header: $header');
    final result = header == kInternalApiSecret;
    log('$header == $kInternalApiSecret = $result');
    return result;
  }
}
