import 'package:json_annotation/json_annotation.dart';

part 'put_project_request.g.dart';

@JsonSerializable()
class PutProjectRequest {
  const PutProjectRequest({
    required this.name,
    required this.description,
  });

  factory PutProjectRequest.fromJson(Map<String, dynamic> json) =>
      _$PutProjectRequestFromJson(json);

  final String name;
  final String description;

  Map<String, dynamic> toJson() => _$PutProjectRequestToJson(this);
}
