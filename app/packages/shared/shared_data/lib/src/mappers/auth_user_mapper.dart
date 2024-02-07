import 'package:back_end/models.dart';
import 'package:shared_domain/models.dart';

class AuthUserMapper {
  AuthUser fromDto(AuthUserDto dto) {
    return AuthUser(
      id: dto.id,
      username: dto.username,
    );
  }

  AuthUserDto toDto(AuthUser user) {
    return AuthUserDto(
      id: user.id,
      username: user.username,
    );
  }
}

extension AuthUserDtoX on AuthUserDto {
  AuthUser toDomainModel() {
    return AuthUserMapper().fromDto(this);
  }
}

extension AuthUserX on AuthUser {
  AuthUserDto toDto() {
    return AuthUserMapper().toDto(this);
  }
}
