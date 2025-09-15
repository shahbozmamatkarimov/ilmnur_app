import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart'; // Ensure this matches your filename

@JsonSerializable()
class Category {
  final int id;
  final String title;
  final DateTime createdAt;
  final DateTime updatedAt;

  Category({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  // Add this method
  String toJsonString() => jsonEncode(toJson());
}
