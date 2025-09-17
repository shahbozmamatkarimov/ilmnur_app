// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tests _$TestsFromJson(Map<String, dynamic> json) => Tests(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  type: json['type'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$TestsToJson(Tests instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'type': instance.type,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};
