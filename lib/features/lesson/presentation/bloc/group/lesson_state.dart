part of 'lesson_bloc.dart';

abstract class LessonState extends Equatable {
  const LessonState();
}

class LessonInitial extends LessonState {
  @override
  List<Object> get props => [];
}

class Loading extends LessonState {
  @override
  List<Object> get props => [];
}

class LoggedOut extends LessonState {
  @override
  List<Object> get props => [];
}

class LoadedLessonData extends LessonState {
  final Lesson lesson;
  final StateStatus status;
  final String? error;
  final int tabIndex;
  const LoadedLessonData({
    required this.lesson,
    this.error,
    this.status = StateStatus.normal,
    this.tabIndex = 0,
  });

  @override
  List<Object> get props => [lesson, status, tabIndex];
}

class SuccessUpdate extends LessonState {
  @override
  List<Object> get props => [];
}

class Error extends LessonState {
  final String? error;

  const Error({this.error});
  @override
  List<Object> get props => [];
}

class ErrorLoadingLessonData extends LessonState {
  final String errorMessage;

  ErrorLoadingLessonData(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
