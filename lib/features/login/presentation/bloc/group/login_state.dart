part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class Loading extends LoginState {
  @override
  List<Object> get props => [];
}

class LoggedOut extends LoginState {
  @override
  List<Object> get props => [];
}

class LoadedLoginData extends LoginState {
  final LoginResponse lesson;
  final StateStatus status;
  final String? error;
  const LoadedLoginData({
    required this.lesson,
    this.error,
    this.status = StateStatus.normal,
  });

  @override
  List<Object> get props => [lesson, status];
}

class SuccessUpdate extends LoginState {
  @override
  List<Object> get props => [];
}

class Error extends LoginState {
  final String? error;

  const Error({this.error});
  @override
  List<Object> get props => [];
}

class ErrorLoadingLoginData extends LoginState {
  final String errorMessage;

  const ErrorLoadingLoginData(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
