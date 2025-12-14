import 'package:ilmnur_app/core/resources/data_state.dart';
import 'package:ilmnur_app/features/course/data/models/course_response.dart';
import 'package:ilmnur_app/features/course/data/models/createcourse.dart';
import 'package:ilmnur_app/features/lesson/data/models/course_group_response.dart';

abstract class CourseRepo {
  Future<DataState<CourseGroupResponse>> getCourses(int id);
  Future<DataState<CourseResponse>> getLessons(int id);
  Future<DataState<CreateCourseModel>> createCourse(CreateCourseModel course);
}
