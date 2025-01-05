// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:telsa_mobile/features/other/models/department/department_data.dart';
import 'package:telsa_mobile/features/other/models/department/permission_data.dart';

part 'employee.g.dart';

@JsonSerializable()
class Employee {
  int id;
  String? username;
  String email;
  @JsonKey(name: 'phone_number')
  String phoneNumber;
  String code;
  dynamic role;
  @JsonKey(name: 'full_name')
  String fullName;
  String? avatar;
  String position;
  String address;
  String gender;
  String description;
  @JsonKey(name: 'department_data')
  DepartmentData departmentData;
  String? dob;
  @JsonKey(name: 'permission_data')
  List<PermissionData> permissionData;
  bool isCreateAccount;

  Employee({
    this.id = -1,
    this.username = '',
    this.email = '',
    this.phoneNumber = '',
    this.code = '',
    this.role,
    this.fullName = '',
    this.avatar = '',
    this.position = '',
    this.address = '',
    this.gender = '',
    this.description = '',
    this.dob = '',
    required this.departmentData,
    this.permissionData = const [],
    this.isCreateAccount = false,
  });

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);

  @override
  String toString() {
    return 'Employee(id: $id, username: $username, email: $email, phoneNumber: $phoneNumber, code: $code, role: $role, fullName: $fullName, avatar: $avatar, position: $position, address: $address, gender: $gender, description: $description, departmentData: $departmentData, permissionData: $permissionData, isCreateAccount: $isCreateAccount,)';
  }
}
