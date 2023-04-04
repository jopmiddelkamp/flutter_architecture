// ignore_for_file: public_member_api_docs

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'token.freezed.dart';

@freezed
class Token with _$Token {
  const factory Token({
    required String userId,
    required String username,
    required DateTime expirationDate,
  }) = _Token;

  factory Token.decode(String value) {
    final decoded = utf8.decode(base64Decode(value));
    final splitted = decoded.split(':');
    return Token(
      userId: splitted[0],
      username: splitted[1],
      expirationDate: DateTime.fromMicrosecondsSinceEpoch(
        int.parse(splitted[2]),
      ),
    );
  }
}

extension TokenX on Token {
  String encode() {
    return base64Encode(utf8.encode(
      '$userId:$username:${expirationDate.microsecondsSinceEpoch}',
    ));
  }
}
