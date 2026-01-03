part of 'course_bloc.dart';

abstract class CourseEvent extends Equatable {
  const CourseEvent();
}

class GetCourses extends CourseEvent {
  final String? subcategory_id;

  const GetCourses({this.subcategory_id});

  @override
  List<Object?> get props => [];
}

class GetLessons extends CourseEvent {
  @override
  List<Object?> get props => [];
}

class CreateCourse extends CourseEvent {
  final CreateCourseModel course;

  const CreateCourse({required this.course});

  @override
  List<Object> get props => [course];
}
