part of 'group_bloc.dart';

abstract class GroupEvent extends Equatable {
  const GroupEvent();
}

class GetGroups extends GroupEvent {
  final int? categoryId;
  final String? subcategory_id;

  const GetGroups({this.categoryId, this.subcategory_id});

  @override
  List<Object?> get props => [categoryId, subcategory_id];
}

class CreateGroup extends GroupEvent {
  final CreateGroupModel group;

  const CreateGroup({required this.group});

  @override
  List<Object> get props => [group];
}
