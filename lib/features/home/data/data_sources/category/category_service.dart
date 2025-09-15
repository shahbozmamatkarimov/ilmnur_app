import 'package:dio/dio.dart';
import 'package:ilmnur_app/features/home/data/models/category/category.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ilmnur_app/core/network/urls.dart';

part 'category_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class CategoryService {
  factory CategoryService(Dio dio, {String baseUrl}) = _CategoryService;

  factory CategoryService.create() {
    final dio = Dio();
    return CategoryService(dio);
  }

  @GET("category")
  Future<HttpResponse<List<Category>>> getCategory();
}
