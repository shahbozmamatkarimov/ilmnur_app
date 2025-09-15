// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'createcourse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCourseModel _$CreateCourseModelFromJson(Map<String, dynamic> json) =>
    CreateCourseModel(
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      price: (json['price'] as num).toInt(),
      discount: (json['discount'] as num).toInt(),
      group_id: (json['group_id'] as num).toInt(),
    );

Map<String, dynamic> _$CreateCourseModelToJson(CreateCourseModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'price': instance.price,
      'discount': instance.discount,
      'group_id': instance.group_id,
    };
