import 'package:flutter_architecture_api_auth_domain/domain.dart';

import '../datasources/local/in_memory_auth_user_local_data_source.dart';

class InMemoryAuthUserIdGenerator implements AuthUserIdGenerator {
  const InMemoryAuthUserIdGenerator(this._dataSource);

  final InMemoryAuthUserLocalDataSource _dataSource;

  @override
  Future<int> nextId() => _dataSource.getNextId();
}
