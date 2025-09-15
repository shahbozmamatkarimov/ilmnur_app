import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class DioManager {
  static Dio get getDio {
    final dio = Dio();
    dio.interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
      ),
    ]);

    dio.options.followRedirects = true;
    dio.options.maxRedirects = 5;
    dio.options.contentType = 'application/json';
    dio.options.headers['Authorization'] = 'Bearer token';
    dio.options.headers.addAll({
      "Accept": "application/json",
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzU3NjA2NzM3LCJleHAiOjE3NTg0NzA3Mzd9.HH0uumQY_CO8kT_0b6GE3I8yLOTlOX2rC2bgHnJCuSM",
    });

    return dio;
  }
}
