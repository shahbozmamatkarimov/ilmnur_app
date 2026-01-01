import 'package:ilmnur_app/core/resources/data_state.dart';
import 'package:ilmnur_app/features/home/data/models/group/GroupDto.dart';
import 'package:ilmnur_app/features/home/data/models/group/creategroup.dart';

abstract class GroupRepo {
  Future<DataState<GroupDto>> getGroup(int? categoryId);
  Future<DataState<GroupDto>> createGroup(CreateGroupModel group);
}
