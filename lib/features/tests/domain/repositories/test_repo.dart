import 'package:ilmnur_app/features/tests/data/models/test.dart';
import 'package:ilmnur_app/core/resources/data_state.dart';

abstract class TestsRepo {
  Future<DataState<List<Tests>>> getTests(int id);
}
