// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tests _$TestsFromJson(Map<String, dynamic> json) => Tests(
  id: (json['id'] as num).toInt(),
  question: json['question'] as String,
  variants: (json['variants'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  type: json['type'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  true_answer: (json['true_answer'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
);

Map<String, dynamic> _$TestsToJson(Tests instance) => <String, dynamic>{
  'id': instance.id,
  'question': instance.question,
  'variants': instance.variants,
  'type': instance.type,
  'true_answer': instance.true_answer,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};
