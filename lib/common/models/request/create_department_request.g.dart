// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_department_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrEditDepartmentRequest _$CreateOrEditDepartmentRequestFromJson(
        Map<String, dynamic> json) =>
    CreateOrEditDepartmentRequest(
      name: json['name'] as String,
      code: json['code'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$CreateOrEditDepartmentRequestToJson(
        CreateOrEditDepartmentRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'description': instance.description,
    };
