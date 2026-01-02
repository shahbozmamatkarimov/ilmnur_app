// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerReponse _$AnswerReponseFromJson(Map<String, dynamic> json) =>
    AnswerReponse(
      lesson_id: (json['lesson_id'] as num).toInt(),
      user_id: (json['user_id'] as num).toInt(),
      answers: (json['answers'] as List<dynamic>)
          .map((e) => SelectedOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnswerReponseToJson(AnswerReponse instance) =>
    <String, dynamic>{
      'lesson_id': instance.lesson_id,
      'user_id': instance.user_id,
      'answers': instance.answers.map((e) => e.toJson()).toList(),
    };
