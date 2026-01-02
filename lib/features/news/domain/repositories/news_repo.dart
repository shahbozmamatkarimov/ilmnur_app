import 'package:ilmnur_app/features/news/data/models/news.dart';
import 'package:ilmnur_app/core/resources/data_state.dart';

abstract class NewsRepo {
  Future<DataState<News>> getNews(int id);
}
