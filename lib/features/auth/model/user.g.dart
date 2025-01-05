// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num).toInt(),
      fullName: json['full_name'] as String?,
      avatar: json['avatar'] as String?,
      username: json['username'] as String,
      email: json['email'] as String,
      departmentId: (json['department_id'] as num?)?.toInt(),
      phoneNumber: json['phone_number'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'username': instance.username,
      'email': instance.email,
      'department_id': instance.departmentId,
      'avatar': instance.avatar,
      'role': instance.role,
      'phone_number': instance.phoneNumber,
    };
