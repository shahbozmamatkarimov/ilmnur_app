import 'package:dio/dio.dart';
import 'package:ilmnur_app/features/profile/data/models/profile.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ilmnur_app/core/network/urls.dart';

part 'profile_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class ProfileService {
  factory ProfileService(Dio dio, {String baseUrl}) = _ProfileService;

  factory ProfileService.create() {
    final dio = Dio();
    return ProfileService(dio);
  }

  @GET("profile/getById/{id}")
  Future<HttpResponse<Profile>> getProfile(@Path("id") int id);
}
