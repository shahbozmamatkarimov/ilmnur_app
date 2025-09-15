part of 'course_bloc.dart';

abstract class CourseState extends Equatable {
  const CourseState();
}

class CourseInitial extends CourseState {
  @override
  List<Object> get props => [];
}

class Loading extends CourseState {
  @override
  List<Object> get props => [];
}

class LoggedOut extends CourseState {
  @override
  List<Object> get props => [];
}

class LoadedCourseData extends CourseState {
  final List<Course> course;
  final StateStatus status;
  final String? error;
  final int tabIndex;
  const LoadedCourseData({
    required this.course,
    this.error,
    this.status = StateStatus.normal,
    this.tabIndex = 0,
  });

  @override
  List<Object> get props => [course, status, tabIndex];
}

class SuccessUpdate extends CourseState {
  @override
  List<Object> get props => [];
}

class Error extends CourseState {
  final String? error;

  const Error({this.error});
  @override
  List<Object> get props => [];
}

class ErrorLoadingCourseData extends CourseState {
  final String errorMessage;

  const ErrorLoadingCourseData(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
