import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:ilmnur_app/core/error/exception_handler.dart';
import 'package:ilmnur_app/features/login/data/models/login_response.dart';
import 'package:ilmnur_app/features/login/domain/repositories/login_repo.dart';
import 'package:ilmnur_app/core/resources/data_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data_sources/login_service.dart';

class ImplLoginRepo extends LoginRepo {
  final LoginService loginService;
  SharedPreferences? preferences; // Use nullable to check initialization

  ImplLoginRepo({required this.loginService});

  Future<void> _initializePreferences() async {
    preferences ??= await SharedPreferences.getInstance();
  }

  // Retrieve logins from SharedPreferences
  Future<List<LoginResponse>?> _getLoginsFromPreferences() async {
    await _initializePreferences(); // Ensure SharedPreferences is initialized

    final List<String>? loginJsonStrings = preferences?.getStringList('Logins');

    if (loginJsonStrings == null) {
      return null;
    }

    return loginJsonStrings.map((loginJson) {
      return LoginResponse.fromJson(
        jsonDecode(loginJson) as Map<String, dynamic>,
      );
    }).toList();
  }

  // Save logins to SharedPreferences
  // Future<void> _saveLoginsToPreferences(Login logins) async {
  //   await _initializePreferences(); // Ensure SharedPreferences is initialized

  //   final List<String> loginJsonStrings = logins.map((login) {
  //     return jsonEncode(login.toJson());
  //   }).toList();

  //   preferences?.setStringList('Logins', loginJsonStrings);
  // }

  // @override
  // Future<DataState<LoginResponse>> getLogin(int id) async {
  //   try {
  //     final List<LoginResponse>? logins = await _getLoginsFromPreferences();
  //     if (logins != null && logins.isNotEmpty) {
  //       // return DataSuccess<List<Login>>(data: logins);
  //     }
  //     final response = await loginService.getLogin(id);
  //     // await _saveLoginsToPreferences(response.data);
  //     return DataSuccess<LoginResponse>(data: response.data);
  //   } catch (e) {
  //     print(e);
  //     return DataException.getError<LoginResponse>(e);
  //   }
  // }

  @override
  Future<DataState<LoginResponse>> googleLogin(
    Map<String, dynamic> user,
  ) async {
    try {
      final response = await loginService.googleLogin(user);
      print(response);
      print(230303);
      if (response.response.statusCode == 200 ||
          response.response.statusCode == 201) {
        return DataSuccess(data: response.data);
      } else {
        return DataException.getError<LoginResponse>(
          response.response.statusMessage ?? "Login failed",
        );
      }
    } catch (e) {
      print(e);
      return DataException.getError<LoginResponse>(e);
    }
  }
}
