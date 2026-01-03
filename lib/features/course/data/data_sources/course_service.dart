import 'package:dio/dio.dart';
import 'package:ilmnur_app/core/network/dio_manager.dart';
import 'package:ilmnur_app/features/course/data/models/course_response.dart';
import 'package:ilmnur_app/features/course/data/models/createcourse.dart';
import 'package:ilmnur_app/features/lesson/data/models/course_group_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ilmnur_app/core/network/urls.dart';

part 'course_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class CourseService {
  factory CourseService(Dio dio, {String baseUrl}) = _CourseService;

  static Future<CourseService> create() async {
    final dio = await DioManager.getDio; // Future<Dio> qaytaradi
    return CourseService(dio);
  }

  @GET("course/getByCourse/{id}/{subcategory_id}")
  Future<HttpResponse<CourseGroupResponse>> getCourses(
    @Path("id") int id,
    @Path("subcategory_id") String? subcategory_id,
  );

  @GET("lesson/getByCourse/{id}")
  Future<HttpResponse<CourseResponse>> getLessons(@Path("id") int id);

  @POST("course/create")
  Future<HttpResponse<CreateCourseModel>> createCourse(@Body() FormData course);
}
