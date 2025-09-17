// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reyting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reyting _$ReytingFromJson(Map<String, dynamic> json) => Reyting(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  surname: json['surname'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$ReytingToJson(Reyting instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'surname': instance.surname,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};
