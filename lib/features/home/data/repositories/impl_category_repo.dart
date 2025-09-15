import 'dart:convert';

import 'package:ilmnur_app/core/error/exception_handler.dart';
import 'package:ilmnur_app/features/home/data/models/category/category.dart';
import 'package:ilmnur_app/core/resources/data_state.dart';
import 'package:ilmnur_app/features/home/domain/repositories/category_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data_sources/category/category_service.dart';

class ImplCategoryRepo extends CategoryRepo {
  final CategoryService categoryService;
  SharedPreferences? preferences; // Use nullable to check initialization

  ImplCategoryRepo({required this.categoryService});

  Future<void> _initializePreferences() async {
    preferences ??= await SharedPreferences.getInstance();
  }

  // Retrieve category from SharedPreferences
  Future<List<Category>?> _getCategoryFromPreferences() async {
    await _initializePreferences(); // Ensure SharedPreferences is initialized

    final List<String>? categoryJsonStrings = preferences?.getStringList(
      'Category',
    );

    if (categoryJsonStrings == null) {
      return null;
    }

    return categoryJsonStrings.map((categoryJson) {
      return Category.fromJson(
        jsonDecode(categoryJson) as Map<String, dynamic>,
      );
    }).toList();
  }

  // Save category to SharedPreferences
  Future<void> _saveCategoryToPreferences(List<Category> category) async {
    await _initializePreferences(); // Ensure SharedPreferences is initialized

    final List<String> categoryJsonStrings = category.map((category) {
      return jsonEncode(category.toJson());
    }).toList();

    preferences?.setStringList('Category', categoryJsonStrings);
  }

  @override
  Future<DataState<List<Category>>> getCategory() async {
    try {
      final List<Category>? category = await _getCategoryFromPreferences();
      if (category != null && category.isNotEmpty) {
        // return DataSuccess<List<Category>>(data: category);
      }
      final response = await categoryService.getCategory();
      await _saveCategoryToPreferences(response.data);
      return DataSuccess<List<Category>>(data: response.data);
    } catch (e) {
      return DataException.getError<List<Category>>(e);
    }
  }
}
