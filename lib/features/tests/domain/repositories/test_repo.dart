import 'package:ilmnur_app/core/resources/data_state.dart';
import 'package:ilmnur_app/features/tests/data/models/answer.dart';
import 'package:ilmnur_app/features/tests/data/models/test_response.dart';

abstract class TestsRepo {
  Future<DataState<TestsReponse>> getTests(int id);
  Future<DataState<List<int>>> checkAnswers(int id, AnswerReponse body);
}
