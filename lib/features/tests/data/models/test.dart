import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'test.g.dart'; // Ensure this matches your filename

@JsonSerializable()
class Tests {
  final int id;
  final String title;
  // final bool published;
  final String type;
  final DateTime createdAt;
  final DateTime updatedAt;

  Tests({
    required this.id,
    required this.title,
    required this.type,
    // required this.published,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Tests.fromJson(Map<String, dynamic> json) => _$TestsFromJson(json);
  Map<String, dynamic> toJson() => _$TestsToJson(this);

  // Add this method
  String toJsonString() => jsonEncode(toJson());
}
