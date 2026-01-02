import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart'; // Ensure this matches your filename

@JsonSerializable()
class News {
  final int id;
  final String name;
  final String surname;
  final DateTime createdAt;
  final DateTime updatedAt;

  News({
    required this.id,
    required this.name,
    required this.surname,
    required this.createdAt,
    required this.updatedAt,
  });

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  Map<String, dynamic> toJson() => _$NewsToJson(this);

  // Add this method
  String toJsonString() => jsonEncode(toJson());
}
