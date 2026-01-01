import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ilmnur_app/core/network/dio_manager.dart';
import 'package:ilmnur_app/features/login/data/models/login_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ilmnur_app/core/network/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class LoginService {
  // Factory konstruktor to'g'ri Dio obyektini qabul qiladi
  factory LoginService(Dio dio, {String baseUrl}) = _LoginService;

  static Future<LoginService> create() async {
    final dio = await DioManager.getDio; // Future<Dio> dan Dio olinadi
    return LoginService(dio);
  }

  @POST("user/auth/google")
  Future<HttpResponse<LoginResponse>> googleLogin(
    @Body() Map<String, dynamic> body,
  );

  // Logout funksiyasi
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove('token');
    await prefs.remove('access_token');
    await prefs.remove('refresh_token');
  }
}
