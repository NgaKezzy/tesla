// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_employee_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateEmployeeRequest _$CreateEmployeeRequestFromJson(
        Map<String, dynamic> json) =>
    CreateEmployeeRequest(
      full_name: json['full_name'] as String,
      is_create_account: json['is_create_account'] as bool,
      password: json['password'] as String,
      username: json['username'] as String,
      code: json['code'] as String,
      department_id: (json['department_id'] as num).toInt(),
      position: json['position'] as String,
      phone_number: json['phone_number'] as String,
      email: json['email'] as String,
      gender: json['gender'] as String,
      address: json['address'] as String,
      description: json['description'] as String,
      avatar: json['avatar'] as String? ?? '',
    );

Map<String, dynamic> _$CreateEmployeeRequestToJson(
        CreateEmployeeRequest instance) =>
    <String, dynamic>{
      'full_name': instance.full_name,
      'is_create_account': instance.is_create_account,
      'username': instance.username,
      'password': instance.password,
      'code': instance.code,
      'department_id': instance.department_id,
      'position': instance.position,
      'phone_number': instance.phone_number,
      'email': instance.email,
      'gender': instance.gender,
      'address': instance.address,
      'description': instance.description,
      'avatar': instance.avatar,
    };
