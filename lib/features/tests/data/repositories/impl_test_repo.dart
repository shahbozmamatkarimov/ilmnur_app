import 'dart:convert';

import 'package:ilmnur_app/core/error/exception_handler.dart';
import 'package:ilmnur_app/features/tests/data/models/test.dart';
import 'package:ilmnur_app/core/resources/data_state.dart';
import 'package:ilmnur_app/features/tests/domain/repositories/test_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data_sources/test_service.dart';

class ImplTestsRepo extends TestsRepo {
  final TestsService testsService;
  SharedPreferences? preferences; // Use nullable to check initialization

  ImplTestsRepo({required this.testsService});

  Future<void> _initializePreferences() async {
    preferences ??= await SharedPreferences.getInstance();
  }

  // Retrieve tests from SharedPreferences
  Future<List<Tests>?> _getTestssFromPreferences() async {
    await _initializePreferences(); // Ensure SharedPreferences is initialized

    final List<String>? testsJsonStrings = preferences?.getStringList('Testss');

    if (testsJsonStrings == null) {
      return null;
    }

    return testsJsonStrings.map((testsJson) {
      return Tests.fromJson(jsonDecode(testsJson) as Map<String, dynamic>);
    }).toList();
  }

  // Save tests to SharedPreferences
  Future<void> _saveTestssToPreferences(List<Tests> tests) async {
    await _initializePreferences(); // Ensure SharedPreferences is initialized

    final List<String> testsJsonStrings = tests.map((tests) {
      return jsonEncode(tests.toJson());
    }).toList();

    preferences?.setStringList('Testss', testsJsonStrings);
  }

  @override
  Future<DataState<List<Tests>>> getTests(int id) async {
    try {
      // final List<Tests>? tests = await _getTestssFromPreferences();
      // if (tests != null && tests.isNotEmpty) {
      //   // return DataSuccess<List<Tests>>(data: tests);
      // }
      final response = await testsService.getTests(id);
      // await _saveTestssToPreferences(response.data.tests);
      return DataSuccess<List<Tests>>(data: response.data);
    } catch (e) {
      // print(e);
      return DataException.getError<List<Tests>>(e);
    }
  }
}
