import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_name.freezed.dart';

@freezed
sealed class ProjectName with _$ProjectName {
  factory ProjectName.parse(String name) {
    if (name.isEmpty) {
      throw const FormatException(
        'Project name cannot be empty.',
      );
    }
    if (name.length < 3) {
      throw const FormatException(
        'Project name must be at least 3 characters long.',
      );
    }
    if (name.length > 50) {
      throw const FormatException(
        'Project name cannot exceed 50 characters.',
      );
    }
    return ProjectName._(name);
  }

  const factory ProjectName._(String value) = _ProjectName;
}
