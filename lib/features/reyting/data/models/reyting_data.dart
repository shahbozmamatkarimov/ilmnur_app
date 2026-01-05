import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'reyting_data.g.dart'; // Ensure this matches your filename

@JsonSerializable()
class ReytingData {
  final int id;
  final int ball;
  final bool is_finished;

  ReytingData({
    required this.id,
    required this.ball,
    required this.is_finished,
  });

  factory ReytingData.fromJson(Map<String, dynamic> json) =>
      _$ReytingDataFromJson(json);
  Map<String, dynamic> toJson() => _$ReytingDataToJson(this);
  // Add this method
  String toJsonString() => jsonEncode(toJson());
}
