// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'createcourse.g.dart';

@JsonSerializable()
class CreateCourseModel {
  final String title;
  final String description;
  final String image;
  final int price;
  final int discount;
  final int group_id;

  CreateCourseModel({
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.discount,
    required this.group_id,
  });

  factory CreateCourseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateCourseModelFromJson(json);
  Map<String, dynamic> toJson() => _$CreateCourseModelToJson(this);

  // Add this method
  String toJsonString() => jsonEncode(toJson());
}
