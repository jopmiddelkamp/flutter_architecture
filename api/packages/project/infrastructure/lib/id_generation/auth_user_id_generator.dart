import 'package:flutter_architecture_api_project_domain/domain.dart';

import '../datasources/local/in_memory_project_local_datasource.dart';

class InMemoryProjectIdGenerator implements ProjectIdGenerator {
  const InMemoryProjectIdGenerator(this._dataSource);

  final InMemoryProjectLocalDataSource _dataSource;

  @override
  Future<int> nextId() => _dataSource.getNextId();
}
