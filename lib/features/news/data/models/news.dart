import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart'; // Ensure this matches your filename

@JsonSerializable()
class Reyting {
  final int id;
  final String name;
  final String surname;
  final DateTime createdAt;
  final DateTime updatedAt;

  Reyting({
    required this.id,
    required this.name,
    required this.surname,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Reyting.fromJson(Map<String, dynamic> json) => _$ReytingFromJson(json);
  Map<String, dynamic> toJson() => _$ReytingToJson(this);

  // Add this method
  String toJsonString() => jsonEncode(toJson());
}
