// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:ilmnur_app/features/user/data/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group.g.dart';

@JsonSerializable()
class Group {
  final int id;
  final String title;
  final String description;
  final String cover;
  final int courses_count;
  final int users_count;
  final int low_price;
  final int high_price;
  final User user;
  final DateTime createdAt;
  final DateTime updatedAt;

  Group({
    required this.id,
    required this.title,
    required this.description,
    required this.cover,
    required this.courses_count,
    required this.users_count,
    required this.low_price,
    required this.high_price,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
  Map<String, dynamic> toJson() => _$GroupToJson(this);

  // Add this method
  String toJsonString() => jsonEncode(toJson());
}
