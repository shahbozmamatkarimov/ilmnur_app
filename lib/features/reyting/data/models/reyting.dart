import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'reyting.g.dart'; // Ensure this matches your filename

@JsonSerializable()
class Reyting {
  final int id;
  final String name;
  final String surname;
  final int totalReyting;
  final String? image;

  Reyting({
    required this.id,
    required this.name,
    required this.surname,
    required this.totalReyting,
    this.image,
  });

  factory Reyting.fromJson(Map<String, dynamic> json) =>
      _$ReytingFromJson(json);
  Map<String, dynamic> toJson() => _$ReytingToJson(this);

  // Add this method
  String toJsonString() => jsonEncode(toJson());
}
