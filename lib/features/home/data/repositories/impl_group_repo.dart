import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ilmnur_app/core/error/exception_handler.dart';
import 'package:ilmnur_app/features/home/data/models/group/GroupDto.dart';
import 'package:ilmnur_app/features/home/data/models/group/creategroup.dart';
import 'package:ilmnur_app/features/home/data/models/group/group.dart';
import 'package:ilmnur_app/core/resources/data_state.dart';
import 'package:ilmnur_app/features/home/domain/repositories/group_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data_sources/group/group_service.dart';
import 'package:path/path.dart' as path;

class ImplGroupRepo extends GroupRepo {
  final GroupService groupService;
  SharedPreferences? preferences; // Use nullable to check initialization

  ImplGroupRepo({required this.groupService});

  Future<void> _initializePreferences() async {
    preferences ??= await SharedPreferences.getInstance();
  }

  // Retrieve group from SharedPreferences
  Future<List<Group>?> _getGroupFromPreferences() async {
    await _initializePreferences(); // Ensure SharedPreferences is initialized

    final List<String>? groupJsonStrings = preferences?.getStringList('Group');

    if (groupJsonStrings == null) {
      return null;
    }

    return groupJsonStrings.map((groupJson) {
      return Group.fromJson(jsonDecode(groupJson) as Map<String, dynamic>);
    }).toList();
  }

  // Save group to SharedPreferences
  // Future<void> _saveGroupToPreferences(List<Group> group) async {
  //   await _initializePreferences(); // Ensure SharedPreferences is initialized

  //   final List<String> groupJsonStrings = group.map((group) {
  //     return jsonEncode(group.toJson());
  //   }).toList();

  //   preferences?.setStringList('Group', groupJsonStrings);
  // }

  @override
  Future<DataState<GroupDto>> getGroup() async {
    try {
      final List<Group>? group = await _getGroupFromPreferences();
      if (group != null && group.isNotEmpty) {
        // return DataSuccess<List<Group>>(data: group);
      }
      final response = await groupService.getGroups();
      return DataSuccess<GroupDto>(data: response.data);
    } catch (e) {
      return DataException.getError<GroupDto>(e);
    }
  }

  @override
  Future<DataState<GroupDto>> createGroup(CreateGroupModel groupData) async {
    try {
      FormData formData = FormData.fromMap({
        'title': groupData.title,
        'description': groupData.description,
        'image': await MultipartFile.fromFile(
          groupData.cover,
          filename: path.basename(groupData.cover),
        ), // Ensure filename is set
      });
      await groupService.createGroup(formData); // Pass the group data
      final res = await groupService.getGroups();

      // Optionally save the created group to preferences or handle it further
      return DataSuccess<GroupDto>(data: res.data);
    } catch (e) {
      return DataException.getError<GroupDto>(e);
    }
  }
}
