import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ilmnur_app/core/resources/data_state.dart';
import 'package:ilmnur_app/core/resources/state_status.dart';
import 'package:ilmnur_app/features/home/data/models/group/GroupDto.dart';
import 'package:ilmnur_app/features/home/data/models/group/creategroup.dart';
import 'package:ilmnur_app/features/home/data/models/group/group.dart';
import 'package:ilmnur_app/features/home/domain/repositories/group_repo.dart';
part 'group_event.dart';
part 'group_state.dart';

class GroupBloc extends Bloc<GroupEvent, GroupState> {
  final GroupRepo groupRepo;
  int activeTabIndex = 0;
  late List<Group> group;

  GroupBloc({required this.groupRepo}) : super(GroupInitial()) {
    on<GetGroups>((event, emit) async {
      emit(GroupLoading());
      try {
        final response = await groupRepo.getGroup();
        if (response is DataSuccess) {
          // group = response.data;
          GroupDto? groupDto = response.data;
          if (groupDto != null) {
            emit(
              LoadedGroupData(
                groups: groupDto.groups,
                my_groups: groupDto.my_groups,
                status: StateStatus.loaded,
              ),
            );
          } else {
            emit(const ErrorLoadingGroupData("Failed to load group data"));
          }
        }
      } catch (e) {
        final errorMessage = 'Failed to load group data: $e';
        emit(ErrorLoadingGroupData(errorMessage));
      }
    });

    on<CreateGroup>((event, emit) async {
      emit(GroupLoading());
      try {
        final response = await groupRepo.createGroup(event.group);
        if (response is DataSuccess) {
          // group = response.data;
          GroupDto? groupDto = response.data;
          if (groupDto != null) {
            emit(
              LoadedGroupData(
                groups: groupDto.groups,
                my_groups: groupDto.my_groups,
                status: StateStatus.loaded,
              ),
            );
          } else {
            emit(const ErrorLoadingGroupData("Failed to load group data"));
          }
        }
      } catch (e) {
        final errorMessage = 'Failed to load group data: $e';
        emit(ErrorLoadingGroupData(errorMessage));
      }
    });

    add(GetGroups());
  }
}
