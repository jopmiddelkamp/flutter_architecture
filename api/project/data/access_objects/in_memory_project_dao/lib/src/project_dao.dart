import 'package:in_memory_project_dao/models.dart';

abstract class ProjectDao {
  Future<Project> create(Project user);

  Future<void> delete(String id);

  Future<Project?> find(String id);

  Future<List<Project>> getAll();

  Future<List<Project>> getByUserId(String userId);

  Future<Project> update(String id, Project user);

  Future<List<Project>> search(String query);
}

class ProjectDaoImpl implements ProjectDao {
  final _projects = <String, Project>{
    '1': const Project(
      id: '1',
      name: 'Project X',
      budget: 10000000,
      managerUserId: '1',
    ),
  };

  @override
  Future<Project> create(Project user) {
    _projects[user.id] = user;
    return Future.value(user);
  }

  @override
  Future<void> delete(String id) {
    _projects.remove(id);
    return Future.value();
  }

  @override
  Future<Project?> find(String id) {
    return Future.value(_projects[id]);
  }

  @override
  Future<List<Project>> getAll() {
    return Future.value(_projects.values.toList());
  }

  @override
  Future<Project> update(String id, Project user) {
    _projects[id] = user;
    return Future.value(user);
  }

  @override
  Future<List<Project>> search(String query) {
    return Future.value(
      _projects.values.where((user) => user.name.contains(query)).toList(),
    );
  }

  @override
  Future<List<Project>> getByUserId(String userId) {
    return Future.value(
      _projects.values.where((user) => user.managerUserId == userId).toList(),
    );
  }
}
