import 'package:dio/dio.dart';
import 'package:ilmnur_app/features/news/data/models/news.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ilmnur_app/core/network/urls.dart';

part 'news_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class NewsService {
  factory NewsService(Dio dio, {String baseUrl}) = _NewsService;

  factory NewsService.create() {
    final dio = Dio();
    return NewsService(dio);
  }

  // @GET("subject")
  // Future<HttpResponse<List<News>>> getNewss();

  @GET("user/news/{id}/0")
  Future<HttpResponse<List<News>>> getNews(@Path("id") int id);
}
