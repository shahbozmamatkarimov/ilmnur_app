import 'dart:convert';
import 'package:ilmnur_app/features/tests/data/models/selectoption.dart';
import 'package:json_annotation/json_annotation.dart';

part 'answer.g.dart';

@JsonSerializable(explicitToJson: true)
class AnswerReponse {
  final int lesson_id;
  final int user_id;
  final List<SelectedOption> answers;

  AnswerReponse({
    required this.lesson_id,
    required this.user_id,
    required this.answers,
  });

  factory AnswerReponse.fromJson(Map<String, dynamic> json) =>
      _$AnswerReponseFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerReponseToJson(this);

  String toJsonString() => jsonEncode(toJson());
}
