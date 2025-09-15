part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
}

class CategoryInitial extends CategoryState {
  @override
  List<Object> get props => [];
}

class Loading extends CategoryState {
  @override
  List<Object> get props => [];
}

class LoggedOut extends CategoryState {
  @override
  List<Object> get props => [];
}

class LoadedCategoryData extends CategoryState {
  final List<Category> category;
  final StateStatus status;
  final String? error;
  final int tabIndex;
  const LoadedCategoryData({
    required this.category,
    this.error,
    this.status = StateStatus.normal,
    this.tabIndex = 0,
  });

  @override
  List<Object> get props => [category, status, tabIndex];
}

class SuccessUpdate extends CategoryState {
  @override
  List<Object> get props => [];
}

class Error extends CategoryState {
  final String? error;

  const Error({this.error});
  @override
  List<Object> get props => [];
}

class ErrorLoadingCategoryData extends CategoryState {
  final String errorMessage;

  const ErrorLoadingCategoryData(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
