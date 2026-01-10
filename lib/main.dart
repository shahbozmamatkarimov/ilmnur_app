import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';
import 'package:ilmnur_app/config/routes/router.dart';
import 'package:ilmnur_app/core/resources/app_colors.dart';
import 'package:ilmnur_app/features/home/data/data_sources/category/category_service.dart';
import 'package:ilmnur_app/features/home/data/repositories/impl_category_repo.dart';
import 'package:ilmnur_app/features/home/presentation/bloc/category/category_bloc.dart';
import 'package:window_manager/window_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Globals {
  static ValueNotifier<bool> isAuth = ValueNotifier<bool>(false);
  // static final GlobalKey<NavigatorState> navigatorKey =
  //     GlobalKey<NavigatorState>();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await Firebase.initializeApp();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CategoryBloc(
            categoryRepo: ImplCategoryRepo(
              categoryService: CategoryService.create(),
            ),
          ),
        ),
      ],
      child: MaterialApp.router(
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
      ),
    );
    // return MaterialApp.router(
    //   title: 'IlmNur',
    //   debugShowCheckedModeBanner: false,
    //   color: AppColors.backgroundColor,
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(
    //       seedColor: const Color(0xFF000000),
    //       background: AppColors.backgroundColor,
    //     ),
    //     // useMaterial3: true,
    //   ),
    //   routerConfig: _router.config(),
    //   // routerDelegate: _router.delegate(),
    //   // routeInformationParser: _router.defaultRouteParser(),
    // );
  }
}
