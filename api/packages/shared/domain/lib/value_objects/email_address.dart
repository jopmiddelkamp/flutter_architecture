import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_address.freezed.dart';

@freezed
sealed class EmailAddress with _$EmailAddress {
  factory EmailAddress.parse(String emailAddress) {
    if (emailAddress.isEmpty) {
      throw const FormatException('Email address cannot be empty.');
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(emailAddress)) {
      throw const FormatException('Invalid email address format.');
    }
    return EmailAddress._(emailAddress);
  }

  const factory EmailAddress._(String value) = _EmailAddress;
}
