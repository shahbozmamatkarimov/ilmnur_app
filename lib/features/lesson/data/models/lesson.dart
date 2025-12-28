import 'dart:convert';

import 'package:ilmnur_app/features/course/data/models/course.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lesson.g.dart'; // Ensure this matches your filename

@JsonSerializable()
class Lesson {
  final int id;
  final String title;
  final String content;
  final String type;
  final String? video;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Lesson>? lessons;
  final Course? course;

  Lesson({
    required this.id,
    required this.title,
    required this.content,
    required this.type,
    this.video,
    required this.createdAt,
    required this.updatedAt,
    this.lessons,
    this.course,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);
  Map<String, dynamic> toJson() => _$LessonToJson(this);

  // Add this method
  String toJsonString() => jsonEncode(toJson());
}
