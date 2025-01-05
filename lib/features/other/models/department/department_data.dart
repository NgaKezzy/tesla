import 'package:json_annotation/json_annotation.dart';
part 'department_data.g.dart';

@JsonSerializable()
class DepartmentData {
  int id;
  String name;
  DepartmentData({
    required this.id,
    required this.name,
  });

  factory DepartmentData.fromJson(Map<String, dynamic> json) =>
      _$DepartmentDataFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentDataToJson(this);
}
