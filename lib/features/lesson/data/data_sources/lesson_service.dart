import 'package:dio/dio.dart';
import 'package:ilmnur_app/core/network/dio_manager.dart';
import 'package:ilmnur_app/features/lesson/data/models/lesson.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ilmnur_app/core/network/urls.dart';

part 'lesson_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class LessonService {
  factory LessonService(Dio dio, {String baseUrl}) = _LessonService;

  static Future<LessonService> create() async {
    final dio = await DioManager.getDio;
    return LessonService(dio);
  }

  @GET("lesson/getById/{id}")
  Future<HttpResponse<Lesson>> getLesson(@Path("id") int id);
}
