import 'package:json_annotation/json_annotation.dart';
part 'permission_data.g.dart';

@JsonSerializable()
class PermissionData {
  final int? id;
  final String? name;
  final String? group;
  bool? check;
  bool? isDepartment;

  PermissionData(
      {this.id = -1,
      this.name = '',
      this.group = '',
      this.check = false,
      this.isDepartment = false});
  factory PermissionData.fromJson(Map<String, dynamic> json) =>
      _$PermissionDataFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionDataToJson(this);
}
