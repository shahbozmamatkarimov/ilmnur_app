import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ilmnur_app/core/resources/data_state.dart';
import 'package:ilmnur_app/core/resources/state_status.dart';
import 'package:ilmnur_app/features/tests/data/models/answer.dart';
import 'package:ilmnur_app/features/tests/data/models/test_response.dart';
import 'package:ilmnur_app/features/tests/domain/repositories/test_repo.dart';
part 'test_event.dart';
part 'test_state.dart';

class TestsBloc extends Bloc<TestsEvent, TestsState> {
  final TestsRepo testsRepo;
  int activeTabIndex = 0;
  late int id;

  TestsBloc({required this.testsRepo, required this.id})
    : super(TestsInitial()) {
    on<GetTests>((event, emit) async {
      emit(Loading());
      try {
        final response = await testsRepo.getTests(id);
        if (response is DataSuccess) {
          // tests = response.data;
          TestsReponse? tests = response.data;
          if (tests != null) {
            emit(LoadedTestsData(tests: tests, status: StateStatus.loaded));
          } else {
            emit(const ErrorLoadingTestsData("Failed to load tests data"));
          }
        }
      } catch (e) {
        print("==$e");
        final errorMessage = 'Failed to load tests data: $e';
        emit(ErrorLoadingTestsData(errorMessage));
      }
    });

    on<checkAnswers>((event, emit) async {
      emit(Loading());
      try {
        print('Hi');
        final response = await testsRepo.checkAnswers(id, event.body);
        print(response);
        if (response is DataSuccess) {
          // tests = response.data;
          Object? result = response.data;
          if (result != null) {
            emit(LoadedAnswerData(result: result, status: StateStatus.loaded));
          } else {
            emit(const ErrorLoadingTestsData("Failed to load tests data"));
          }
        }
      } catch (e) {
        print("==$e");
        final errorMessage = 'Failed to load tests data: $e';
        emit(ErrorLoadingTestsData(errorMessage));
      }
    });

    add(GetTests());
  }
}
