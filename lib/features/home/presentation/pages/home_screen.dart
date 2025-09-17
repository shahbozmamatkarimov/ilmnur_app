import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilmnur_app/config/routes/router.gr.dart';
import 'package:ilmnur_app/core/resources/app_colors.dart';
import 'package:ilmnur_app/core/widgets/w_bottom_bar_item.dart';
import 'package:ilmnur_app/core/widgets/w_button.dart';
import 'package:ilmnur_app/features/home/presentation/widgets/side_menu_widget.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<List<String>> bottonNavItems = [
    ["home", "Home"],
    ["search", "Search"],
    ["timer", "Timer"],
    ["history", "History"],
    ["profile", "Profile"],
  ];

  int activeBottomNav = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        const GroupsRoute(),
        MainRoute(id: 1),
        // const CoursesRoute(),
        LessonRoute(lessonId: 1),
        const ReytingRoute(),
        const NewsRoute(),
        TestsRoute(testId: 1),
      ],
      transitionBuilder: (context, child, animation) =>
          FadeTransition(opacity: animation, child: child),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          key: _scaffoldKey,
          drawer: const Drawer(
            width: 270,
            backgroundColor: AppColors.white,
            child: SideMenuWidget(),
          ),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(
              72,
            ), // Set your preferred height here
            child: AppBar(
              titleSpacing: 0,
              backgroundColor: AppColors.transparent,
              centerTitle: true,
              actions: [Container()],
              automaticallyImplyLeading: false,
              toolbarHeight: 72,
              title: Container(
                height: 72,
                decoration: const BoxDecoration(color: AppColors.transparent),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 15,
                      ),
                      height: 72,
                      decoration: const BoxDecoration(color: AppColors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              WButton(
                                text: "",
                                verticalPadding: 0,
                                horizontalPadding: 0,
                                onTap: () =>
                                    _scaffoldKey.currentState?.openDrawer(),
                                child: SvgPicture.asset(
                                  "assets/svg/nav/menu.svg",
                                ),
                              ),
                              const SizedBox(width: 28),
                              SvgPicture.asset("assets/svg/nav/logo.svg"),
                            ],
                          ),
                          SvgPicture.asset("assets/svg/nav/search.svg"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  // flex: 7,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: child,
                  ),
                ),
                // if (isDesktop)
                //   Expanded(
                //     flex: 3,
                //     child: child,
                //   ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(25),
                topEnd: Radius.circular(25),
              ),
              color: AppColors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // for (List<String> i, index in bottonNavItems)
                for (int index = 0; index < bottonNavItems.length; index++)
                  WBottomBarItem(
                    icon:
                        "assets/svg/bottomnav/${bottonNavItems[index][0]}.svg",
                    label: bottonNavItems[index][1],
                    isActive: index == activeBottomNav,
                    onTap: () => {
                      if (index == 0)
                        {context.router.pushNamed("/home")}
                      else if (index == 1)
                        {context.router.pushNamed("/reyting")}
                      else if (index == 3)
                        {context.router.pushNamed("/news")},
                      // activeBottomNav = index
                      setState(() {
                        activeBottomNav = index;
                      }),
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
