import 'package:ilmnur_app/core/error/exception_handler.dart';
import 'package:ilmnur_app/core/resources/data_state.dart';
import 'package:ilmnur_app/features/tests/data/models/answer.dart';
import 'package:ilmnur_app/features/tests/data/models/test_response.dart';
import 'package:ilmnur_app/features/tests/domain/repositories/test_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data_sources/test_service.dart';

class ImplTestsRepo extends TestsRepo {
  final Future<TestsService> testsService;
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
      final service = await testsService;
      final response = await service.getTests(id);
      return DataSuccess<TestsReponse>(data: response.data);
    } catch (e) {
      print("this is error: $e");
      return DataException.getError<TestsReponse>(e);
    }
  }

  @override
  Future<DataState<List<int>>> checkAnswers(int id, AnswerReponse body) async {
    try {
      print("Hi");
      final service = await testsService;
      final response = await service.checkAnswers(id, body);
      return DataSuccess<List<int>>(data: response.data);
    } catch (e) {
      print("this is error: $e");
      return DataException.getError<List<int>>(e);
    }
  }
}
