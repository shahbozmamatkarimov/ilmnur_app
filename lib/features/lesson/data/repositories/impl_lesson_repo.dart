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

  @override
  Future<DataState<Lesson>> getLesson(int id) async {
    try {
      final response = await lessonService.getLesson(id);
      return DataSuccess<Lesson>(data: response.data);
    } catch (e) {
      return DataException.getError<Lesson>(e);
    }
  }
}
