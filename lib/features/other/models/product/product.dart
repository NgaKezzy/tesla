import 'package:json_annotation/json_annotation.dart';
import 'package:telsa_mobile/features/other/models/product/category.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  int id;
  String name;
  String code;
  int? price;
  String unit;
  String? branch;
  String? specification;
  String? description;
  String? picture;
  dynamic files;
  @JsonKey(name: 'category_data')
  Category categoryData;

  Product({
    required this.id,
    required this.name,
    required this.code,
    required this.price,
    required this.unit,
    required this.branch,
    required this.specification,
    required this.description,
    required this.picture,
    required this.files,
    required this.categoryData,
  });
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
