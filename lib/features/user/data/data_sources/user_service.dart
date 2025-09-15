import 'package:dio/dio.dart';
import 'package:ilmnur_app/features/user/data/models/user.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ilmnur_app/core/network/urls.dart';

part 'user_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class UserService {
  factory UserService(Dio dio, {String baseUrl}) = _UserService;

  factory UserService.create() {
    final dio = Dio();
    return UserService(dio);
  }

  // @GET("subject")
  // Future<HttpResponse<List<User>>> getUsers();

  @GET("video_user/{id}")
  Future<HttpResponse<User>> getUser(@Path("id") int id);
}
