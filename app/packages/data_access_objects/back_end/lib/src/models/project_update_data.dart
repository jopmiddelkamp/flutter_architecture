import 'package:back_end/src/models/update_field.dart';
import 'package:equatable/equatable.dart';

class ProjectUpdateData with EquatableMixin {
  const ProjectUpdateData({
    this.name,
    this.budget,
    this.managerId,
  });

  final UpdateField<String>? name;
  final UpdateField<double>? budget;
  final UpdateField<String>? managerId;

  @override
  List<Object?> get props => [name, budget, managerId];

  bool get isEmpty => name != null || budget != null || managerId != null;
}
