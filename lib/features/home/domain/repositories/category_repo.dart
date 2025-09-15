import 'package:ilmnur_app/core/resources/data_state.dart';
import 'package:ilmnur_app/features/home/data/models/category/category.dart';

abstract class CategoryRepo {
  Future<DataState<List<Category>>> getCategory();
}
