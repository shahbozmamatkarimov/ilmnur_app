import 'package:dio/dio.dart';
import 'package:ilmnur_app/features/tests/data/models/test.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ilmnur_app/core/network/urls.dart';

part 'test_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class TestsService {
  factory TestsService(Dio dio, {String baseUrl}) = _TestsService;

  factory TestsService.create() {
    final dio = Dio();
    return TestsService(dio);
  }

  @GET("lesson/getByCourse/{id}")
  Future<HttpResponse<List<Tests>>> getTests(@Path("id") int id);
}
