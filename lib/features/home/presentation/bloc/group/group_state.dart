// ignore_for_file: non_constant_identifier_names

part of 'group_bloc.dart';

abstract class GroupState extends Equatable {
  const GroupState();
}

class GroupInitial extends GroupState {
  @override
  List<Object> get props => [];
}

class GroupLoading extends GroupState {
  @override
  List<Object> get props => [];
}

class LoggedOut extends GroupState {
  @override
  List<Object> get props => [];
}

class LoadedGroupData extends GroupState {
  final List<Group> groups;
  final List<Group> my_groups;
  final StateStatus status;
  final String? error;
  final int tabIndex;
  const LoadedGroupData({
    required this.groups,
    required this.my_groups,
    this.error,
    this.status = StateStatus.normal,
    this.tabIndex = 0,
  });

  @override
  List<Object> get props => [groups, status, tabIndex];
}

class SuccessUpdate extends GroupState {
  @override
  List<Object> get props => [];
}

class Error extends GroupState {
  final String? error;

  const Error({this.error});
  @override
  List<Object> get props => [];
}

class ErrorLoadingGroupData extends GroupState {
  final String errorMessage;

  const ErrorLoadingGroupData(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
