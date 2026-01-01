import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ilmnur_app/core/resources/data_state.dart';
import 'package:ilmnur_app/core/resources/state_status.dart';
import 'package:ilmnur_app/features/course/data/models/course.dart';
import 'package:ilmnur_app/features/course/data/models/course_response.dart';
import 'package:ilmnur_app/features/course/data/models/createcourse.dart';
import 'package:ilmnur_app/features/course/domain/repositories/course_repo.dart';
import 'package:ilmnur_app/features/lesson/data/models/course_group_response.dart';
import 'package:ilmnur_app/features/lesson/data/models/lesson.dart';
part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRepo courseRepo;
  int activeTabIndex = 0;
  late CourseGroupResponse course;
  late int id;

  CourseBloc({required this.courseRepo, required this.id})
    : super(CourseInitial()) {
    on<GetCourses>((event, emit) async {
      emit(Loading());
      try {
        final response = await courseRepo.getCourses(id);
        if (response is DataSuccess) {
          // course = response.data;
          CourseGroupResponse? course = response.data;
          if (course != null) {
            emit(
              LoadedCourseData(
                course: course, // bitta kurs
                status: StateStatus.loaded,
              ),
            );
          } else {
            emit(const ErrorLoadingCourseData("Failed to load course data"));
          }
        } else if (response is DataError) {
          print(response);
        }
      } catch (e) {
        print(e);
        final errorMessage = 'Failed to load course data: $e';
        emit(ErrorLoadingCourseData(errorMessage));
      }
    });

    on<GetLessons>((event, emit) async {
      emit(Loading());
      try {
        final response = await courseRepo.getLessons(id);
        if (response is DataSuccess) {
          CourseResponse? data = response.data;
          if (data != null) {
            emit(
              LoadedLessonsData(
                course: data.course, // bitta kurs
                lessons: data.lessons,
                status: StateStatus.loaded,
              ),
            );
          } else {
            emit(const ErrorLoadingCourseData("Failed to load course data"));
          }
        }
      } catch (e) {
        final errorMessage = 'Failed to load course data: $e';
        emit(ErrorLoadingCourseData(errorMessage));
      }
    });

    on<CreateCourse>((event, emit) async {
      emit(Loading());
      try {
        await courseRepo.createCourse(event.course);
        final response = await courseRepo.getCourses(id);

        if (response is DataSuccess) {
          // course = response.data;
          final course = response.data;
          if (course != null) {
            emit(
              LoadedCourseData(
                course: course, // bitta kurs
                status: StateStatus.loaded,
              ),
            );
          } else {
            emit(const ErrorLoadingCourseData("Failed to load course data"));
          }
        }
      } catch (e) {
        final errorMessage = 'Failed to load course data: $e';
        emit(ErrorLoadingCourseData(errorMessage));
      }
    });

    // add(GetCourses();
  }
}
