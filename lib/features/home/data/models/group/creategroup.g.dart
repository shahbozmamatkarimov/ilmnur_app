// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creategroup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateGroupModel _$CreateGroupModelFromJson(Map<String, dynamic> json) =>
    CreateGroupModel(
      title: json['title'] as String,
      description: json['description'] as String,
      cover: json['cover'] as String,
    );

Map<String, dynamic> _$CreateGroupModelToJson(CreateGroupModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'cover': instance.cover,
    };
