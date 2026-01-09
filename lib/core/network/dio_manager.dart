import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ilmnur_app/config/routes/router.gr.dart';
import 'package:ilmnur_app/features/login/presentation/pages/login_screen.dart';
import 'package:ilmnur_app/main.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

abstract class DioManager {
  static Future<Dio> get getDio async {
    final dio = Dio();
    dio.options
      ..followRedirects = true
      ..maxRedirects = 5
      ..contentType = 'application/json';

    dio.interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        // compact: true,
        compact: false,
      ),
    ]);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final prefs = await SharedPreferences.getInstance();
          final token = prefs.getString('token');
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          } else {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              navigatorKey.currentState?.pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (route) => false,
              );
            });
          }
          handler.next(options);
        },
        onError: (e, handler) {
          if (e.response?.statusCode == 401) {
            final context = Globals.navigatorKey.currentContext;
            if (context != null) {
              context.router.replace(
                const LoginRoute(),
              ); // auto_route navigator
            } else {
              debugPrint("goo");
            }
            // debugPrint("${e.response?.statusCode}");
            // WidgetsBinding.instance.addPostFrameCallback((_) {
            //   navigatorKey.currentState?.pushAndRemoveUntil(
            //     MaterialPageRoute(builder: (_) => const LoginScreen()),
            //     (route) => false,
            //   );
            // });
          }
          handler.next(e);
        },
      ),
    );

    return dio;
  }
}
