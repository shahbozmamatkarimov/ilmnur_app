import 'package:dio/dio.dart';
import 'package:ilmnur_app/core/network/dio_manager.dart';
import 'package:ilmnur_app/features/reyting/data/models/reyting.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ilmnur_app/core/network/urls.dart';

part 'reyting_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class ReytingService {
  factory ReytingService(Dio dio, {String baseUrl}) = _ReytingService;

  static Future<ReytingService> create() async {
    final dio = await DioManager.getDio; // Future<Dio> qaytaradi
    return ReytingService(dio);
  }

  // @GET("subject")
  // Future<HttpResponse<List<Reyting>>> getReytings();

  @GET("user/reyting/{id}/0")
  Future<HttpResponse<List<Reyting>>> getReyting(@Path("id") int id);
}
