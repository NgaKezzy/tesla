import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  @JsonKey(name: 'full_name')
  final String? fullName;
  final String username;
  final String email;
  @JsonKey(name: 'department_id')
  final int? departmentId;
  final String? avatar;
  final String? role;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;

  User(
      {required this.id,
      this.fullName,
      this.avatar,
      required this.username,
      required this.email,
      this.departmentId,
      this.phoneNumber,
      required this.role});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
