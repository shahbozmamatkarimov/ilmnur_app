// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_group_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseGroupResponse _$CourseGroupResponseFromJson(Map<String, dynamic> json) =>
    CourseGroupResponse(
      courses: (json['courses'] as List<dynamic>)
          .map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
      group: Group.fromJson(json['group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CourseGroupResponseToJson(
  CourseGroupResponse instance,
) => <String, dynamic>{
  'courses': instance.courses.map((e) => e.toJson()).toList(),
  'group': instance.group.toJson(),
};
