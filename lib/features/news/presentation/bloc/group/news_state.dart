part of 'news_bloc.dart';

abstract class ReytingState extends Equatable {
  const ReytingState();
}

class ReytingInitial extends ReytingState {
  @override
  List<Object> get props => [];
}

class Loading extends ReytingState {
  @override
  List<Object> get props => [];
}

class LoggedOut extends ReytingState {
  @override
  List<Object> get props => [];
}

class LoadedReytingData extends ReytingState {
  final Reyting lesson;
  final StateStatus status;
  final String? error;
  final int tabIndex;
  const LoadedReytingData({
    required this.lesson,
    this.error,
    this.status = StateStatus.normal,
    this.tabIndex = 0,
  });

  @override
  List<Object> get props => [lesson, status, tabIndex];
}

class SuccessUpdate extends ReytingState {
  @override
  List<Object> get props => [];
}

class Error extends ReytingState {
  final String? error;

  const Error({this.error});
  @override
  List<Object> get props => [];
}

class ErrorLoadingReytingData extends ReytingState {
  final String errorMessage;

  ErrorLoadingReytingData(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
