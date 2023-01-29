import 'package:json_annotation/json_annotation.dart';

part 'delete_project_request.g.dart';

@JsonSerializable()
class DeleteProjectRequest {
  const DeleteProjectRequest();

  factory DeleteProjectRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteProjectRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteProjectRequestToJson(this);
}
