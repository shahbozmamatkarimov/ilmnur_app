import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ilmnur_app/core/resources/data_state.dart';
import 'package:ilmnur_app/core/resources/state_status.dart';
import 'package:ilmnur_app/features/home/data/models/category/category.dart';
import 'package:ilmnur_app/features/home/domain/repositories/category_repo.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepo categoryRepo;
  int activeTabIndex = 0;
  late List<Category> category;

  CategoryBloc({required this.categoryRepo}) : super(CategoryInitial()) {
    on<GetCategory>((event, emit) async {
      emit(Loading());
      try {
        final response = await categoryRepo.getCategory();
        if (response is DataSuccess) {
          // category = response.data;
          List<Category>? category = response.data;
          if (category != null) {
            emit(
              LoadedCategoryData(
                category: category,
                status: StateStatus.loaded,
              ),
            );
          } else {
            emit(
              const ErrorLoadingCategoryData("Failed to load category data"),
            );
          }
        }
      } catch (e) {
        final errorMessage = 'Failed to load category data: $e';
        emit(ErrorLoadingCategoryData(errorMessage));
      }
    });

    add(GetCategory());
  }
}
