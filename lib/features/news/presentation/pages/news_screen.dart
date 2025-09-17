import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ilmnur_app/core/resources/app_colors.dart';
import 'package:ilmnur_app/core/widgets/w_tabbar.dart';
import 'package:ilmnur_app/features/news/presentation/pages/news.dart';

@RoutePage()
class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen>
    with SingleTickerProviderStateMixin {
  late final TabController controllerForMainTabVarView = TabController(
    length: 2,
    vsync: this,
    initialIndex: 0,
  );

  final List<String> newsTabs = ["Xabarnomalar", "Dastur yangiliklari"];

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          WTabBar(
            leftPadding: 20,
            tabsList: newsTabs,
            controllerForMainTabVarView: controllerForMainTabVarView,
          ),
          Expanded(
            child: TabBarView(
              controller: controllerForMainTabVarView,
              children: [News(), News()],
            ),
          ),
        ],
      ),
    );
  }
}
