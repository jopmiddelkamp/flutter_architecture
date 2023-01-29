import '../value_objects/email_address.dart';

class AuthUser {
  const AuthUser({
    required this.id,
    required this.emailAddress,
  });

  final int id;
  final EmailAddress emailAddress;
}
