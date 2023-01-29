import 'package:flutter_architecture_api_auth_domain/domain.dart';
import 'package:flutter_architecture_api_shared_domain/domain.dart';
import 'package:flutter_architecture_api_shared_infrastructure/infrastructure.dart';

import '../datasources/local/in_memory_auth_user_local_data_source.dart';
import '../models/auth_user_dto.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(
    this._dataSource,
    this._authUserMapper,
  );

  final InMemoryAuthUserLocalDataSource _dataSource;
  final InfrastructureMapper<AuthUser, AuthUserDto> _authUserMapper;

  /// Returns the user with the given email address and password.
  @override
  Future<AuthUser?> login({
    required String emailAddress,
    required String password,
  }) async {
    final dto = await _dataSource.findByEmailAddress(emailAddress);
    if (dto == null) {
      return null;
    }
    return _authUserMapper.toEntity(dto);
  }

  /// Logs out the current user.
  @override
  Future<void> logout() async {
    // No operation needed for fake memory logout
  }

  /// Registers a new user.
  @override
  Future<void> register(AuthUser user) async {
    final dto = _authUserMapper.toDto(user);
    await _dataSource.save(dto);
  }
}
