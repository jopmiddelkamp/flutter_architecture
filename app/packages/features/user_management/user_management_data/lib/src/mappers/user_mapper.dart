import 'package:back_end/dtos.dart';
import 'package:feature_user_management_domain/models.dart';

class UserMapper {
  User fromDto(UserDto dto) {
    return User(
      id: dto.id,
      name: dto.name,
      email: dto.email,
    );
  }

  UserDto toDto(User user) {
    return UserDto(
      id: user.id,
      name: user.name,
      email: user.email,
    );
  }
}

extension UserDtoX on UserDto {
  User toUser() {
    return UserMapper().fromDto(this);
  }
}

extension UserX on User {
  UserDto toDto() {
    return UserMapper().toDto(this);
  }
}
