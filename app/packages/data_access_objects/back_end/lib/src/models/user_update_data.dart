import 'package:back_end/src/models/update_field.dart';
import 'package:equatable/equatable.dart';

class UserUpdateData with EquatableMixin {
  const UserUpdateData({
    this.name,
    this.email,
  });

  final UpdateField<String>? name;
  final UpdateField<String>? email;

  @override
  List<Object?> get props => [name, email];

  bool get isEmpty => name != null || email != null;
}
