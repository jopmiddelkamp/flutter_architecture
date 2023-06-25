import 'package:internal_user_api_dao/models.dart';
import 'package:middelkamp_dev_api_project/src/models/models.dart';

/// Builds a [UserDto] from a [InternalUser].
class UserDtoBuilder {
  /// Builds a [UserDto] from a [InternalUser].
  static UserDto build(
    InternalUser user,
  ) {
    return UserDto(
      id: user.id,
      name: user.name,
      email: user.email,
    );
  }
}
