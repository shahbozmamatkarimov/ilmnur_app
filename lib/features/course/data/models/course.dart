// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'course.g.dart'; // Ensure this matches your filename

@JsonSerializable()
class Course {
  final int id;
  final String title;
  final String description;
  final String cover;
  final int price;
  final int discount;
  final int? subscriptions_count;
  final int? likes_count;
  final int? lessons_count;
  // final int group_id;
  final DateTime createdAt;
  final DateTime updatedAt;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.cover,
    required this.price,
    required this.discount,
    required this.createdAt,
    required this.updatedAt,
    this.subscriptions_count,
    this.likes_count,
    this.lessons_count,
    // required this.group_id,
  });

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
  Map<String, dynamic> toJson() => _$CourseToJson(this);

  // Add this method
  String toJsonString() => jsonEncode(toJson());
}
