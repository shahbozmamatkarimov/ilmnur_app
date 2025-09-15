import 'package:dio/dio.dart';
import 'package:ilmnur_app/core/error/exception_handler.dart';
import 'package:ilmnur_app/features/course/data/models/course.dart';
import 'package:ilmnur_app/core/resources/data_state.dart';
import 'package:ilmnur_app/features/course/data/models/createcourse.dart';
import 'package:ilmnur_app/features/course/domain/repositories/course_repo.dart';
import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';
import '../data_sources/course_service.dart';

class ImplCourseRepo extends CourseRepo {
  final CourseService courseService;
  SharedPreferences? preferences; // Use nullable to check initialization

  ImplCourseRepo({required this.courseService});

  // Future<void> _initializePreferences() async {
  //   preferences ??= await SharedPreferences.getInstance();
  // }

  // Retrieve courses from SharedPreferences
  // Future<List<Course>?> _getCoursesFromPreferences() async {
  //   await _initializePreferences(); // Ensure SharedPreferences is initialized

  //   final List<String>? courseJsonStrings = preferences?.getStringList(
  //     'Courses',
  //   );

  //   if (courseJsonStrings == null) {
  //     return null;
  //   }

  //   return courseJsonStrings.map((courseJson) {
  //     return Course.fromJson(jsonDecode(courseJson) as Map<String, dynamic>);
  //   }).toList();
  // }

  // // Save courses to SharedPreferences
  // Future<void> _saveCoursesToPreferences(List<Course> courses) async {
  //   await _initializePreferences(); // Ensure SharedPreferences is initialized

  //   final List<String> courseJsonStrings = courses.map((course) {
  //     return jsonEncode(course.toJson());
  //   }).toList();

  //   preferences?.setStringList('Courses', courseJsonStrings);
  // }

  @override
  Future<DataState<List<Course>>> getCourses(int id) async {
    try {
      // final List<Course>? courses = await _getCoursesFromPreferences();
      // print(courses);
      // if (courses != null && courses.isNotEmpty) {
      // return DataSuccess<List<Course>>(data: courses);
      // }
      final response = await courseService.getCourses(id);
      // await _saveCoursesToPreferences(response.data);
      return DataSuccess<List<Course>>(data: response.data);
    } catch (e) {
      return DataException.getError<List<Course>>(e);
    }
  }

  @override
  Future<DataState<CreateCourseModel>> createCourse(
    CreateCourseModel course,
  ) async {
    try {
      FormData formData = FormData.fromMap({
        'title': course.title,
        'description': course.description,
        'image': await MultipartFile.fromFile(
          course.image,
          filename: path.basename(course.image),
        ),
        'price': course.price,
        'discount': course.discount,
        'group_id': course.group_id,
      });
      final response = await courseService.createCourse(
        formData,
      ); // Pass the group data

      return DataSuccess<CreateCourseModel>(data: response.data);
    } catch (e) {
      return DataException.getError<CreateCourseModel>(e);
    }
  }

  // @override
  // Future<DataState<List<Course>>> createCourse(CreateCourseModel course) async {
  //   try {
  //     FormData formData = FormData.fromMap({
  //       'title': course.title,
  //       'description': groupData.description,
  //       'image': await MultipartFile.fromFile(groupData.cover,
  //           filename: path.basename(groupData.cover)), // Ensure filename is set
  //     });
  //     final response =
  //         await groupService.createGroup(formData); // Pass the group data
  //     final res = await groupService.getGroups();

  //     print("Group Created: ${response.data}");
  //     // Optionally save the created group to preferences or handle it further
  //     return DataSuccess<List<Group>>(data: res.data);
  //   } catch (e) {
  //     print("##$e");
  //     return DataException.getError<List<Group>>(e);
  //   }
  // }
}
