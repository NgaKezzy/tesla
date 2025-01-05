// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermissionData _$PermissionDataFromJson(Map<String, dynamic> json) =>
    PermissionData(
      id: (json['id'] as num?)?.toInt() ?? -1,
      name: json['name'] as String? ?? '',
      group: json['group'] as String? ?? '',
      check: json['check'] as bool? ?? false,
      isDepartment: json['isDepartment'] as bool? ?? false,
    );

Map<String, dynamic> _$PermissionDataToJson(PermissionData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'group': instance.group,
      'check': instance.check,
      'isDepartment': instance.isDepartment,
    };
