import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ilmnur_app/core/resources/app_colors.dart';
import 'package:ilmnur_app/core/widgets/w_tabbar.dart';
// import 'package:ilmnur_app/features/course/presentation/pages/chat.dart';
import 'package:ilmnur_app/features/course/presentation/pages/lessons_screen.dart';
// import 'package:ilmnur_app/features/course/presentation/pages/news.dart';
// import 'package:ilmnur_app/features/course/presentation/pages/reyting.dart';
// import 'package:ilmnur_app/features/course/presentation/pages/settings.dart';
// import 'package:ilmnur_app/features/course/presentation/pages/users.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  final int id;
  const MainScreen({super.key, required this.id});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late final TabController controllerForMainTabVarView = TabController(
    length: 7,
    vsync: this,
    initialIndex: 0,
  );

  final List<String> communityTabs = [
    "Lessons",
    "Chat",
    "News",
    "Reyting",
    "Settings",
    "Users",
    "Users",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Column(
        children: [
          WTabBar(
            leftPadding: 20,
            tabsList: communityTabs,
            controllerForMainTabVarView: controllerForMainTabVarView,
          ),
          Expanded(
            child: TabBarView(
              controller: controllerForMainTabVarView,
              children: [
                Lessons(id: widget.id),
                Lessons(id: widget.id),
                Lessons(id: widget.id),
                Lessons(id: widget.id),
                Lessons(id: widget.id),
                Lessons(id: widget.id),
                Lessons(id: widget.id),
                // Chat(),
                // News(),
                // Reyting(),
                // Settings(),
                // Users(),
                // Users(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
