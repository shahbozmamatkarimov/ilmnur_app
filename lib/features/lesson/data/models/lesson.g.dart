// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lesson _$LessonFromJson(Map<String, dynamic> json) => Lesson(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  content: json['content'] as String,
  type: json['type'] as String,
  video: json['video'] as String?,
  is_liked: json['is_liked'] as bool?,
  is_finished: json['is_finished'] as bool?,
  tests_count: (json['tests_count'] as num?)?.toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  lessons: (json['lessons'] as List<dynamic>?)
      ?.map((e) => Lesson.fromJson(e as Map<String, dynamic>))
      .toList(),
  course: json['course'] == null
      ? null
      : Course.fromJson(json['course'] as Map<String, dynamic>),
  reyting: json['reyting'] == null
      ? null
      : ReytingData.fromJson(json['reyting'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LessonToJson(Lesson instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'content': instance.content,
  'type': instance.type,
  'video': instance.video,
  'is_liked': instance.is_liked,
  'is_finished': instance.is_finished,
  'tests_count': instance.tests_count,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'lessons': instance.lessons,
  'course': instance.course,
  'reyting': instance.reyting,
};
