import 'dart:io';
import 'package:json_annotation/json_annotation.dart';
part 'create_employee_request.g.dart';

@JsonSerializable()
class CreateEmployeeRequest {
  final String full_name;
  final bool is_create_account;
  final String username;
  final String password;
  final String code;
  final int department_id;
  final String position;
  final String phone_number;
  final String email;
  final String gender;
  final String address;
  final String description;
  final String? avatar;

  CreateEmployeeRequest(
      {required this.full_name,
      required this.is_create_account,
      required this.password,
      required this.username,
      required this.code,
      required this.department_id,
      required this.position,
      required this.phone_number,
      required this.email,
      required this.gender,
      required this.address,
      required this.description,
      this.avatar = ''});

  factory CreateEmployeeRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateEmployeeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateEmployeeRequestToJson(this);
}
