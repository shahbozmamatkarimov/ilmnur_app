import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'answer.g.dart'; // Ensure this matches your filename

@JsonSerializable()
class AnswerReponse {
  final int lesson_id;
  final int user_id;
  final List<int?> answers;

  AnswerReponse({
    required this.lesson_id,
    required this.user_id,
    required this.answers,
  });

  factory AnswerReponse.fromJson(Map<String, dynamic> json) =>
      _$AnswerReponseFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerReponseToJson(this);

  // Add this method
  String toJsonString() => jsonEncode(toJson());
}
