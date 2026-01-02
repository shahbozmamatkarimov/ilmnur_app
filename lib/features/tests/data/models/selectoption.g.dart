// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selectoption.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelectedOption _$SelectedOptionFromJson(Map<String, dynamic> json) =>
    SelectedOption(
      id: (json['id'] as num?)?.toInt(),
      isTrue: json['isTrue'] as bool?,
    );

Map<String, dynamic> _$SelectedOptionToJson(SelectedOption instance) =>
    <String, dynamic>{'id': instance.id, 'isTrue': instance.isTrue};
