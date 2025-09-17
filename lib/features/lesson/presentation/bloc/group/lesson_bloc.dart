import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ilmnur_app/core/resources/data_state.dart';
import 'package:ilmnur_app/core/resources/state_status.dart';
import 'package:ilmnur_app/features/lesson/data/models/lesson.dart';
import 'package:ilmnur_app/features/lesson/domain/repositories/lesson_repo.dart';
part 'lesson_event.dart';
part 'lesson_state.dart';

class LessonBloc extends Bloc<LessonEvent, LessonState> {
  final LessonRepo lessonRepo;
  int activeTabIndex = 0;
  late Lesson lesson;
  late int id;

  LessonBloc({required this.lessonRepo, required this.id})
    : super(LessonInitial()) {
    on<GetLessons>((event, emit) async {
      emit(Loading());
      try {
        final response = await lessonRepo.getLesson(id);
        if (response is DataSuccess) {
          // lesson = response.data;
          Lesson? lesson = response.data;
          if (lesson != null) {
            emit(LoadedLessonData(lesson: lesson, status: StateStatus.loaded));
          } else {
            emit(ErrorLoadingLessonData("Failed to load lesson data"));
          }
        }
      } catch (e) {
        print("==$e");
        final errorMessage = 'Failed to load lesson data: $e';
        emit(ErrorLoadingLessonData(errorMessage));
      }
    });

    add(GetLessons());
  }
}
