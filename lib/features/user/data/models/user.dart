import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart'; // Ensure this matches your filename

@JsonSerializable()
class User {
  final int id;
  final String name;
  final String surname;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.surname,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  // Add this method
  String toJsonString() => jsonEncode(toJson());
}
