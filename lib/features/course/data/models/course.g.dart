// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  cover: json['cover'] as String,
  price: (json['price'] as num).toInt(),
  discount: (json['discount'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  subscriptions_count: (json['subscriptions_count'] as num?)?.toInt(),
  likes_count: (json['likes_count'] as num?)?.toInt(),
  lessons_count: (json['lessons_count'] as num?)?.toInt(),
);

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'cover': instance.cover,
  'price': instance.price,
  'discount': instance.discount,
  'subscriptions_count': instance.subscriptions_count,
  'likes_count': instance.likes_count,
  'lessons_count': instance.lessons_count,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};
