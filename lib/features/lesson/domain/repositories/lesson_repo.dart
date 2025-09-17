import 'package:ilmnur_app/features/lesson/data/models/lesson.dart';
import 'package:ilmnur_app/core/resources/data_state.dart';

abstract class LessonRepo {
  Future<DataState<Lesson>> getLesson(int id);
}
