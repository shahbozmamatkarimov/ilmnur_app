// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  cover: json['cover'] as String,
  courses_count: (json['courses_count'] as num).toInt(),
  users_count: (json['users_count'] as num).toInt(),
  low_price: (json['low_price'] as num).toInt(),
  high_price: (json['high_price'] as num).toInt(),
  user: User.fromJson(json['user'] as Map<String, dynamic>),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'cover': instance.cover,
  'courses_count': instance.courses_count,
  'users_count': instance.users_count,
  'low_price': instance.low_price,
  'high_price': instance.high_price,
  'user': instance.user,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};
