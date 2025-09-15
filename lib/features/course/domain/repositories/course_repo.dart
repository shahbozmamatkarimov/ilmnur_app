import 'package:ilmnur_app/features/course/data/models/course.dart';
import 'package:ilmnur_app/core/resources/data_state.dart';
import 'package:ilmnur_app/features/course/data/models/createcourse.dart';

abstract class CourseRepo {
  Future<DataState<List<Course>>> getCourses(int id);
  Future<DataState<CreateCourseModel>> createCourse(CreateCourseModel course);
}
