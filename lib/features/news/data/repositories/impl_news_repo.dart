import 'dart:convert';

import 'package:ilmnur_app/core/error/exception_handler.dart';
import 'package:ilmnur_app/features/news/data/models/news.dart';
import 'package:ilmnur_app/core/resources/data_state.dart';
import 'package:ilmnur_app/features/news/domain/repositories/news_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data_sources/news_service.dart';

class ImplNewsRepo extends NewsRepo {
  final NewsService newsService;
  SharedPreferences? preferences; // Use nullable to check initialization

  ImplNewsRepo({required this.newsService});

  Future<void> _initializePreferences() async {
    preferences ??= await SharedPreferences.getInstance();
  }

  // Retrieve newss from SharedPreferences
  Future<List<News>?> _getNewssFromPreferences() async {
    await _initializePreferences(); // Ensure SharedPreferences is initialized

    final List<String>? newsJsonStrings = preferences?.getStringList('Newss');

    if (newsJsonStrings == null) {
      return null;
    }

    return newsJsonStrings.map((newsJson) {
      return News.fromJson(jsonDecode(newsJson) as Map<String, dynamic>);
    }).toList();
  }

  @override
  Future<DataState<News>> getNews(int id) {
    // TODO: implement getNews
    throw UnimplementedError();
  }

  // Save newss to SharedPreferences
  // Future<void> _saveNewssToPreferences(News newss) async {
  //   await _initializePreferences(); // Ensure SharedPreferences is initialized

  //   final List<String> newsJsonStrings = newss.map((news) {
  //     return jsonEncode(news.toJson());
  //   }).toList();

  //   preferences?.setStringList('Newss', newsJsonStrings);
  // }

  // @override
  // Future<DataState<List<News>>> getNews(int id) async {
  //   try {
  //     final List<News>? newss = await _getNewssFromPreferences();
  //     if (newss != null && newss.isNotEmpty) {
  //       // return DataSuccess<List<News>>(data: newss);
  //     }
  //     final response = await newsService.getNews(id);
  //     // await _saveNewssToPreferences(response.data);
  //     return DataSuccess<List<News>>(data: response.data);
  //   } catch (e) {
  //     return DataException.getError<List<News>>(e);
  //   }
  // }
}
