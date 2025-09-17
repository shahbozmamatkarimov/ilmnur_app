import 'package:dio/dio.dart';
import 'package:ilmnur_app/core/network/dio_manager.dart';
import 'package:ilmnur_app/features/course/data/models/course.dart';
import 'package:ilmnur_app/features/course/data/models/course_response.dart';
import 'package:ilmnur_app/features/course/data/models/createcourse.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ilmnur_app/core/network/urls.dart';

part 'course_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class CourseService {
  factory CourseService(Dio dio, {String baseUrl}) = _CourseService;

  factory CourseService.create() {
    // final dio = Dio();
    final dio = DioManager.getDio;
    return CourseService(dio);
  }

  @GET("course/getByCourse/{id}/0")
  Future<HttpResponse<List<Course>>> getCourses(@Path("id") int id);

  @GET("lesson/getByCourse/{id}")
  Future<HttpResponse<CourseResponse>> getLessons(@Path("id") int id);

  @POST("course/create")
  Future<HttpResponse<CreateCourseModel>> createCourse(@Body() FormData course);
}
