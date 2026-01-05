// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reyting_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReytingData _$ReytingDataFromJson(Map<String, dynamic> json) => ReytingData(
  id: (json['id'] as num).toInt(),
  ball: (json['ball'] as num).toInt(),
  is_finished: json['is_finished'] as bool,
);

Map<String, dynamic> _$ReytingDataToJson(ReytingData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ball': instance.ball,
      'is_finished': instance.is_finished,
    };
