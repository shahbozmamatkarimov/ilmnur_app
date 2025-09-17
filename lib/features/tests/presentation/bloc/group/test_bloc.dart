import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ilmnur_app/core/resources/data_state.dart';
import 'package:ilmnur_app/core/resources/state_status.dart';
import 'package:ilmnur_app/features/course/data/models/course.dart';
import 'package:ilmnur_app/features/tests/data/models/test.dart';
import 'package:ilmnur_app/features/tests/domain/repositories/test_repo.dart';
part 'test_event.dart';
part 'test_state.dart';

class TestsBloc extends Bloc<TestsEvent, TestsState> {
  final TestsRepo testsRepo;
  int activeTabIndex = 0;
  late List<Tests> tests;
  late int id;

  TestsBloc({required this.testsRepo, required this.id})
    : super(TestsInitial()) {
    on<GetTestss>((event, emit) async {
      emit(Loading());
      try {
        final response = await testsRepo.getTests(id);
        if (response is DataSuccess) {
          // tests = response.data;
          List<Tests>? tests = response.data;
          if (tests != null) {
            emit(LoadedTestsData(tests: tests, status: StateStatus.loaded));
          } else {
            emit(ErrorLoadingTestsData("Failed to load tests data"));
          }
        }
      } catch (e) {
        print("==$e");
        final errorMessage = 'Failed to load tests data: $e';
        emit(ErrorLoadingTestsData(errorMessage));
      }
    });

    add(GetTestss());
  }
}
