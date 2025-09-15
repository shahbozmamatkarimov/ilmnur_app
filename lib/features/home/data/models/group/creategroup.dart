// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'creategroup.g.dart';

@JsonSerializable()
class CreateGroupModel {
  final String title;
  final String description;
  final String cover;

  CreateGroupModel({
    required this.title,
    required this.description,
    required this.cover,
  });

  factory CreateGroupModel.fromJson(Map<String, dynamic> json) =>
      _$CreateGroupModelFromJson(json);
  Map<String, dynamic> toJson() => _$CreateGroupModelToJson(this);

  // Add this method
  String toJsonString() => jsonEncode(toJson());
}
