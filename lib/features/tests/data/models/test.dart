import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'test.g.dart'; // Ensure this matches your filename

@JsonSerializable()
class Tests {
  final int id;
  final String question;
  final List<String> variants;
  final String type;
  final List<int> true_answer;
  final DateTime createdAt;
  final DateTime updatedAt;

  Tests({
    required this.id,
    required this.question,
    required this.variants,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.true_answer,
  });

  factory Tests.fromJson(Map<String, dynamic> json) => _$TestsFromJson(json);
  Map<String, dynamic> toJson() => _$TestsToJson(this);

  // Add this method
  String toJsonString() => jsonEncode(toJson());
}
