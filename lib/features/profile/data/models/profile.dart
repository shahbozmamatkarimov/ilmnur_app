import 'dart:convert';

import 'package:ilmnur_app/features/course/data/models/course.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart'; // Ensure this matches your filename

@JsonSerializable()
class Profile {
  final int id;
  final String title;
  final String content;
  final String type;
  final String? video;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Profile>? profiles;
  final Course? course;

  Profile({
    required this.id,
    required this.title,
    required this.content,
    required this.type,
    this.video,
    required this.createdAt,
    required this.updatedAt,
    this.profiles,
    this.course,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);

  // Add this method
  String toJsonString() => jsonEncode(toJson());
}
