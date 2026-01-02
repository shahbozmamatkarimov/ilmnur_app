import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ilmnur_app/core/resources/data_state.dart';
import 'package:ilmnur_app/core/resources/state_status.dart';
import 'package:ilmnur_app/features/reyting/data/models/reyting.dart';
import 'package:ilmnur_app/features/reyting/domain/repositories/reyting_repo.dart';
part 'reyting_event.dart';
part 'reyting_state.dart';

class ReytingBloc extends Bloc<ReytingEvent, ReytingState> {
  final ReytingRepo reytingRepo;
  int activeTabIndex = 0;
  late Reyting reyting;
  late int id;

  ReytingBloc({required this.reytingRepo, required this.id})
    : super(ReytingInitial()) {
    on<GetReytings>((event, emit) async {
      emit(Loading());
      try {
        print('Hi');
        print(id is int);
        final response = await reytingRepo.getReyting(id);
        print(response);
        if (response is DataSuccess) {
          // reyting = response.data;
          List<Reyting>? reyting = response.data;
          if (reyting != null) {
            emit(
              LoadedReytingData(reyting: reyting, status: StateStatus.loaded),
            );
          } else {
            emit(const ErrorLoadingReytingData("Failed to load reyting data"));
          }
        }
      } catch (e) {
        print(e);
        final errorMessage = 'Failed to load reyting data: $e';
        emit(ErrorLoadingReytingData(errorMessage));
      }
    });

    add(GetReytings());
  }
}
