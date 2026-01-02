import 'package:dio/dio.dart';
import 'package:ilmnur_app/core/network/dio_manager.dart';
import 'package:ilmnur_app/features/tests/data/models/answer.dart';
import 'package:ilmnur_app/features/tests/data/models/test_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ilmnur_app/core/network/urls.dart';

part 'test_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class TestsService {
  factory TestsService(Dio dio, {String baseUrl}) = _TestsService;

  static Future<TestsService> create() async {
    final dio = await DioManager.getDio; // Future<Dio> qaytaradi
    return TestsService(dio);
  }

  @GET("tests/{id}")
  Future<HttpResponse<TestsReponse>> getTests(@Path("id") int id);

  @POST("tests/set_answers/{id}")
  Future<HttpResponse<List<int>>> checkAnswers(
    @Path("id") int id,
    @Body() AnswerReponse body,
  );
}
