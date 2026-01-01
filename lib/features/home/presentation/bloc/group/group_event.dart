part of 'group_bloc.dart';

abstract class GroupEvent extends Equatable {
  const GroupEvent();
}

class GetGroups extends GroupEvent {
  final int? categoryId;

  const GetGroups({this.categoryId});

  @override
  List<Object?> get props => [];
}

class CreateGroup extends GroupEvent {
  final CreateGroupModel group;

  const CreateGroup({required this.group});

  @override
  List<Object> get props => [group];
}
