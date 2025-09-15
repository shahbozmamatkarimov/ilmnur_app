import 'dart:convert';

import 'package:ilmnur_app/core/error/exception_handler.dart';
import 'package:ilmnur_app/features/user/data/models/user.dart';
import 'package:ilmnur_app/core/resources/data_state.dart';
import 'package:ilmnur_app/features/user/domain/repositories/user_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data_sources/user_service.dart';

class ImplUserRepo extends UserRepo {
  final UserService userService;
  SharedPreferences? preferences; // Use nullable to check initialization

  ImplUserRepo({required this.userService});

  Future<void> _initializePreferences() async {
    preferences ??= await SharedPreferences.getInstance();
  }

  // Retrieve users from SharedPreferences
  Future<List<User>?> _getUsersFromPreferences() async {
    await _initializePreferences(); // Ensure SharedPreferences is initialized

    final List<String>? userJsonStrings = preferences?.getStringList('Users');

    if (userJsonStrings == null) {
      return null;
    }

    return userJsonStrings.map((userJson) {
      return User.fromJson(jsonDecode(userJson) as Map<String, dynamic>);
    }).toList();
  }

  // Save users to SharedPreferences
  // Future<void> _saveUsersToPreferences(User users) async {
  //   await _initializePreferences(); // Ensure SharedPreferences is initialized

  //   final List<String> userJsonStrings = users.map((user) {
  //     return jsonEncode(user.toJson());
  //   }).toList();

  //   preferences?.setStringList('Users', userJsonStrings);
  // }

  @override
  Future<DataState<User>> getUser(int id) async {
    try {
      final List<User>? users = await _getUsersFromPreferences();
      if (users != null && users.isNotEmpty) {
        // return DataSuccess<List<User>>(data: users);
      }
      final response = await userService.getUser(id);
      // await _saveUsersToPreferences(response.data);
      return DataSuccess<User>(data: response.data);
    } catch (e) {
      return DataException.getError<User>(e);
    }
  }
}
