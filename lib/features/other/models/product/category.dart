
import 'package:json_annotation/json_annotation.dart';
part 'category.g.dart';
@JsonSerializable()
class Category {
    int id;
    String name;
    dynamic description;

    Category({
        required this.id,
        required this.name,
        required this.description,
    });
      factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);


}