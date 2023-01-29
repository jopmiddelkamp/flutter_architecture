import 'package:json_annotation/json_annotation.dart';

part 'get_project_request.g.dart';

@JsonSerializable()
class GetProjectRequest {
  const GetProjectRequest();

  factory GetProjectRequest.fromJson(Map<String, dynamic> json) =>
      _$GetProjectRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetProjectRequestToJson(this);
}
