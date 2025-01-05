import 'package:json_annotation/json_annotation.dart';
part 'create_department_request.g.dart';

@JsonSerializable()
class CreateOrEditDepartmentRequest {
  final String name;
  final String code;
  final String description;

  CreateOrEditDepartmentRequest(
      {required this.name, required this.code, required this.description});

  factory CreateOrEditDepartmentRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateOrEditDepartmentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOrEditDepartmentRequestToJson(this);
}
