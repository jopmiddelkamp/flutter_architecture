import 'package:flutter_architecture_api_shared_domain/domain.dart';

class EmailAddressValidatorImpl implements EmailAddressValidator {
  const EmailAddressValidatorImpl();

  @override
  EmailAddress validate(String value) {
    try {
      return EmailAddress.parse(value);
    } on FormatException {
      throw const ValidationException(
        'INVALID_EMAIL',
        'The provided email address is invalid.',
      );
    }
  }
}
