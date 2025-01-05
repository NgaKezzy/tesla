import 'package:json_annotation/json_annotation.dart';
import 'package:telsa_mobile/features/other/models/department/permission_data.dart';
part 'department.g.dart';

@JsonSerializable()
class Department {
  int id;
  String name;
  String code;
  String? description;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'permission_group_id')
  int permissionGroupId;
  String dob;
  bool active;
  bool access;
  dynamic role;
  @JsonKey(name: 'permission_data')
  List<PermissionData> permissionData;

  Department(
      {required this.id,
      required this.name,
      required this.code,
      this.description,
      this.updatedAt,
      this.createdAt,
      required this.permissionGroupId,
      this.active = false,
      this.access = false,
      this.dob = '',
      this.permissionData = const []});

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentToJson(this);
}
