// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Department _$DepartmentFromJson(Map<String, dynamic> json) => Department(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      code: json['code'] as String,
      description: json['description'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      permissionGroupId: (json['permission_group_id'] as num).toInt(),
      active: json['active'] as bool? ?? false,
      access: json['access'] as bool? ?? false,
      dob: json['dob'] as String? ?? '',
      permissionData: (json['permission_data'] as List<dynamic>?)
              ?.map((e) => PermissionData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    )..role = json['role'];

Map<String, dynamic> _$DepartmentToJson(Department instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'description': instance.description,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'permission_group_id': instance.permissionGroupId,
      'dob': instance.dob,
      'active': instance.active,
      'access': instance.access,
      'role': instance.role,
      'permission_data': instance.permissionData,
    };
