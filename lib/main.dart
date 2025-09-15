import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:ilmnur_app/config/routes/router.dart';
import 'package:ilmnur_app/core/resources/app_colors.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    if (Platform.isWindows || Platform.isMacOS) {
      await windowManager.ensureInitialized();

      // Set window properties
      await windowManager.setTitleBarStyle(TitleBarStyle.hidden);
    }
  }
  // await windowManager.ensureInitialized();

  // // Set window properties
  // await windowManager.setTitleBarStyle(TitleBarStyle.hidden);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'IlmNur',
      debugShowCheckedModeBanner: false,
      color: AppColors.backgroundColor,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF000000),
          background: AppColors.backgroundColor,
        ),
        // useMaterial3: true,
      ),
      routerConfig: _router.config(),
      // routerDelegate: _router.delegate(),
      // routeInformationParser: _router.defaultRouteParser(),
    );
  }
}
