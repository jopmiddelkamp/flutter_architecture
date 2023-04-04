import 'package:shared_domain/src/models/update_field.dart';

class User {
  const User({
    required this.id,
    required this.name,
    required this.email,
  });

  final String id;
  final String name;
  final String email;
}

class UserUpdateData {
  UserUpdateData({
    this.name,
    this.email,
  });

  final UpdateField<String>? name;
  final UpdateField<String>? email;

  Map<String, dynamic> toJson() {
    final result = {
      if (name != null)
        'name': {
          'value': name!.value,
        },
      if (email != null)
        'email': {
          'value': email!.value,
        },
    };
    return result;
  }
}
