import 'package:flutter_architecture_api_shared_domain/domain.dart';
import 'package:flutter_architecture_api_shared_infrastructure/infrastructure.dart';

import '../models/auth_user_dto.dart';

class AuthUserInfrastructureMapper
    implements InfrastructureMapper<AuthUser, AuthUserDto> {
  const AuthUserInfrastructureMapper();

  @override
  AuthUserDto toDto(AuthUser entity) {
    return AuthUserDto(
      id: entity.id,
      emailAddress: entity.emailAddress.value,
    );
  }

  @override
  AuthUser toEntity(AuthUserDto dto) {
    return AuthUser(
      id: dto.id,
      emailAddress: EmailAddress.parse(dto.emailAddress),
    );
  }
}
