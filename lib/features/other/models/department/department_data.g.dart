// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepartmentData _$DepartmentDataFromJson(Map<String, dynamic> json) =>
    DepartmentData(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$DepartmentDataToJson(DepartmentData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
