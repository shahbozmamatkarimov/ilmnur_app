import 'package:ilmnur_app/features/course/data/models/course.dart';
import 'package:ilmnur_app/features/home/data/models/group/group.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_group_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CourseGroupResponse {
  final List<Course> courses;
  final Group group;

  CourseGroupResponse({required this.courses, required this.group});

  factory CourseGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseGroupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseGroupResponseToJson(this);
}
