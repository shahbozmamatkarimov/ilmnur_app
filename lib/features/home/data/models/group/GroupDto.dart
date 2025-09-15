// ignore_for_file: non_constant_identifier_names
import 'package:ilmnur_app/features/home/data/models/group/group.dart';

class GroupDto {
  final List<Group> groups;
  final List<Group> my_groups;

  GroupDto({required this.groups, required this.my_groups});

  factory GroupDto.fromJson(Map<String, dynamic> json) => GroupDto(
    groups: (json['groups'] as List)
        .map((group) => Group.fromJson(group))
        .toList(),
    my_groups: (json['my_groups'] as List)
        .map((my_group) => Group.fromJson(my_group))
        .toList(),
  );
}
