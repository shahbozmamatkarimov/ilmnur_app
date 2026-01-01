part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class Loading extends ProfileState {
  @override
  List<Object> get props => [];
}

class LoggedOut extends ProfileState {
  @override
  List<Object> get props => [];
}

class LoadedProfileData extends ProfileState {
  final Profile profile;
  final StateStatus status;
  final String? error;
  final int tabIndex;
  const LoadedProfileData({
    required this.profile,
    this.error,
    this.status = StateStatus.normal,
    this.tabIndex = 0,
  });

  @override
  List<Object> get props => [profile, status, tabIndex];
}

class SuccessUpdate extends ProfileState {
  @override
  List<Object> get props => [];
}

class Error extends ProfileState {
  final String? error;

  const Error({this.error});
  @override
  List<Object> get props => [];
}

class ErrorLoadingProfileData extends ProfileState {
  final String errorMessage;

  const ErrorLoadingProfileData(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
