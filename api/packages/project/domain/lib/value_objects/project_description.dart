import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_description.freezed.dart';

@freezed
sealed class ProjectDescription with _$ProjectDescription {
  factory ProjectDescription.parse(String description) {
    if (description.isEmpty) {
      throw const FormatException(
        'Project description cannot be empty.',
      );
    }
    if (description.length > 500) {
      throw const FormatException(
        'Project description cannot exceed 500 characters.',
      );
    }
    return ProjectDescription._(description);
  }

  const factory ProjectDescription._(String value) = _ProjectDescription;
}
