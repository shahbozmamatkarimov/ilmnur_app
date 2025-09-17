import 'package:ilmnur_app/features/course/data/models/course.dart';
import 'package:ilmnur_app/features/lesson/data/models/lesson.dart';

class CourseResponse {
  final Course course;
  final List<Lesson> lessons;

  CourseResponse({required this.course, required this.lessons});

  factory CourseResponse.fromJson(Map<String, dynamic> json) {
    return CourseResponse(
      course: Course.fromJson(json['course']),
      lessons: (json['lessons'] as List)
          .map((e) => Lesson.fromJson(e))
          .toList(),
    );
  }
}
