// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reyting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reyting _$ReytingFromJson(Map<String, dynamic> json) => Reyting(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  surname: json['surname'] as String,
  totalReyting: (json['totalReyting'] as num).toInt(),
  image: json['image'] as String?,
);

Map<String, dynamic> _$ReytingToJson(Reyting instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'surname': instance.surname,
  'totalReyting': instance.totalReyting,
  'image': instance.image,
};
