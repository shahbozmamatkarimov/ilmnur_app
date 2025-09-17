import 'dart:convert';

import 'package:ilmnur_app/core/error/exception_handler.dart';
import 'package:ilmnur_app/features/lesson/data/models/lesson.dart';
import 'package:ilmnur_app/core/resources/data_state.dart';
import 'package:ilmnur_app/features/lesson/domain/repositories/lesson_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data_sources/lesson_service.dart';

class ImplLessonRepo extends LessonRepo {
  final LessonService lessonService;
  SharedPreferences? preferences; // Use nullable to check initialization

  ImplLessonRepo({required this.lessonService});

  Future<void> _initializePreferences() async {
    preferences ??= await SharedPreferences.getInstance();
  }

  // Retrieve lessons from SharedPreferences
  Future<List<Lesson>?> _getLessonsFromPreferences() async {
    await _initializePreferences(); // Ensure SharedPreferences is initialized

    final List<String>? lessonJsonStrings = preferences?.getStringList(
      'Lessons',
    );

    if (lessonJsonStrings == null) {
      return null;
    }

    return lessonJsonStrings.map((lessonJson) {
      return Lesson.fromJson(jsonDecode(lessonJson) as Map<String, dynamic>);
    }).toList();
  }

  // Save lessons to SharedPreferences
  // Future<void> _saveLessonsToPreferences(Lesson lessons) async {
  //   await _initializePreferences(); // Ensure SharedPreferences is initialized

  //   final List<String> lessonJsonStrings = lessons.map((lesson) {
  //     return jsonEncode(lesson.toJson());
  //   }).toList();

  //   preferences?.setStringList('Lessons', lessonJsonStrings);
  // }

  @override
  Future<DataState<Lesson>> getLesson(int id) async {
    try {
      final List<Lesson>? lessons = await _getLessonsFromPreferences();
      if (lessons != null && lessons.isNotEmpty) {
        // return DataSuccess<List<Lesson>>(data: lessons);
      }
      final response = await lessonService.getLesson(id);
      // await _saveLessonsToPreferences(response.data);
      return DataSuccess<Lesson>(data: response.data);
    } catch (e) {
      print(e);
      return DataException.getError<Lesson>(e);
    }
  }
}
