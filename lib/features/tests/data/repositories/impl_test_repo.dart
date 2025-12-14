import 'dart:convert';

import 'package:ilmnur_app/core/error/exception_handler.dart';
import 'package:ilmnur_app/features/tests/data/models/test.dart';
import 'package:ilmnur_app/core/resources/data_state.dart';
import 'package:ilmnur_app/features/tests/data/models/test_response.dart';
import 'package:ilmnur_app/features/tests/domain/repositories/test_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data_sources/test_service.dart';

class ImplTestsRepo extends TestsRepo {
  final TestsService testsService;
  SharedPreferences? preferences; // Use nullable to check initialization

  ImplTestsRepo({required this.testsService});

  // Future<void> _initializePreferences() async {
  //   preferences ??= await SharedPreferences.getInstance();
  // }

  // Retrieve tests from SharedPreferences
  // Future<TestsReponse?> _getTestssFromPreferences() async {
  //   await _initializePreferences(); // Ensure SharedPreferences is initialized

  //   final List<String>? testsJsonStrings = preferences?.getStringList('Testss');

  //   if (testsJsonStrings == null) {
  //     return null;
  //   }

  //   // return testsJsonStrings.map((testsJson) {
  //   //   return Tests.fromJson(jsonDecode(testsJson) as Map<String, dynamic>);
  //   // }).toList();
  // }

  @override
  Future<DataState<TestsReponse>> getTests(int id) async {
    try {
      print("id2303 $id");
      final response = await testsService.getTests(id);
      print(response);
      print(2303);
      return DataSuccess<TestsReponse>(data: response.data);
    } catch (e) {
      print("this is error: $e");
      return DataException.getError<TestsReponse>(e);
    }
  }
}
