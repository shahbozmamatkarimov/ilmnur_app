// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestsReponse _$TestsReponseFromJson(Map<String, dynamic> json) => TestsReponse(
  lesson_id: (json['lesson_id'] as num).toInt(),
  user_id: (json['user_id'] as num).toInt(),
  lesson: Lesson.fromJson(json['lesson'] as Map<String, dynamic>),
  test: (json['test'] as List<dynamic>?)
      ?.map((e) => Tests.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TestsReponseToJson(TestsReponse instance) =>
    <String, dynamic>{
      'lesson_id': instance.lesson_id,
      'user_id': instance.user_id,
      'lesson': instance.lesson,
      'test': instance.test,
    };
