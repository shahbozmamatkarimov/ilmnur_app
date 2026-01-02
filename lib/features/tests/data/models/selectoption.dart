import 'package:json_annotation/json_annotation.dart';

part 'selectoption.g.dart';

@JsonSerializable()
class SelectedOption {
  final int? id;
  final bool? isTrue;

  SelectedOption({this.id, this.isTrue});

  factory SelectedOption.fromJson(Map<String, dynamic> json) =>
      _$SelectedOptionFromJson(json);

  Map<String, dynamic> toJson() => _$SelectedOptionToJson(this);
}
