import 'dart:convert';

import 'package:ilmnur_app/features/lesson/data/models/lesson.dart';
import 'package:ilmnur_app/features/tests/data/models/test.dart';
import 'package:json_annotation/json_annotation.dart';

part 'test_response.g.dart'; // Ensure this matches your filename

@JsonSerializable()
class TestsReponse {
  final int lesson_id;
  final int user_id;
  final Lesson lesson;
  final List<Tests>? test;

  TestsReponse({
    required this.lesson_id,
    required this.user_id,
    required this.lesson,
    this.test,
  });

  factory TestsReponse.fromJson(Map<String, dynamic> json) =>
      _$TestsReponseFromJson(json);
  Map<String, dynamic> toJson() => _$TestsReponseToJson(this);

  // Add this method
  String toJsonString() => jsonEncode(toJson());
}
