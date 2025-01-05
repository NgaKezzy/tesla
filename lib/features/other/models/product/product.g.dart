// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      code: json['code'] as String,
      price: (json['price'] as num?)?.toInt(),
      unit: json['unit'] as String,
      branch: json['branch'] as String?,
      specification: json['specification'] as String?,
      description: json['description'] as String?,
      picture: json['picture'] as String?,
      files: json['files'],
      categoryData:
          Category.fromJson(json['category_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'price': instance.price,
      'unit': instance.unit,
      'branch': instance.branch,
      'specification': instance.specification,
      'description': instance.description,
      'picture': instance.picture,
      'files': instance.files,
      'category_data': instance.categoryData,
    };
