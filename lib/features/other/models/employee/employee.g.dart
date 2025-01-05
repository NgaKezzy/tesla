// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      id: (json['id'] as num?)?.toInt() ?? -1,
      username: json['username'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
      code: json['code'] as String? ?? '',
      role: json['role'],
      fullName: json['full_name'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
      position: json['position'] as String? ?? '',
      address: json['address'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      description: json['description'] as String? ?? '',
      dob: json['dob'] as String? ?? '',
      departmentData: DepartmentData.fromJson(
          json['department_data'] as Map<String, dynamic>),
      permissionData: (json['permission_data'] as List<dynamic>?)
              ?.map((e) => PermissionData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isCreateAccount: json['isCreateAccount'] as bool? ?? false,
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'code': instance.code,
      'role': instance.role,
      'full_name': instance.fullName,
      'avatar': instance.avatar,
      'position': instance.position,
      'address': instance.address,
      'gender': instance.gender,
      'description': instance.description,
      'department_data': instance.departmentData,
      'dob': instance.dob,
      'permission_data': instance.permissionData,
      'isCreateAccount': instance.isCreateAccount,
    };
