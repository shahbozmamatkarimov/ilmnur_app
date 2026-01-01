part of 'test_bloc.dart';

abstract class TestsState extends Equatable {
  const TestsState();
}

class TestsInitial extends TestsState {
  @override
  List<Object> get props => [];
}

class Loading extends TestsState {
  @override
  List<Object> get props => [];
}

class LoggedOut extends TestsState {
  @override
  List<Object> get props => [];
}

class LoadedTestsData extends TestsState {
  final TestsReponse tests;
  final StateStatus status;
  final String? error;
  final int tabIndex;
  const LoadedTestsData({
    required this.tests,
    this.error,
    this.status = StateStatus.normal,
    this.tabIndex = 0,
  });

  @override
  List<Object> get props => [tests, status, tabIndex];
}

class LoadedAnswerData extends TestsState {
  final Object result;
  final StateStatus status;
  final String? error;

  const LoadedAnswerData({
    required this.result,
    this.status = StateStatus.normal,
    this.error,
  });

  @override
  List<Object> get props => [result, status];
}

class SuccessUpdate extends TestsState {
  @override
  List<Object> get props => [];
}

class Error extends TestsState {
  final String? error;

  const Error({this.error});
  @override
  List<Object> get props => [];
}

class ErrorLoadingTestsData extends TestsState {
  final String errorMessage;

  const ErrorLoadingTestsData(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
