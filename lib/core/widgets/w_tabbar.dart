import 'package:flutter/material.dart';
import '../resources/app_colors.dart';

class WTabBar extends StatefulWidget {
  final List<String> tabsList;
  final TabController controllerForMainTabVarView;
  final Color background;
  final double leftPadding;
  // final String text;
  // final GestureTapCallback onTap;
  // final Color textColor;
  // final double borderRadius;
  // final bool showLoader;
  // final double verticalPadding;
  // final double horizontalPadding;
  // final Widget? child;
  // final bool disabled;
  // final TextStyle? textStyle;
  // final EdgeInsets margin;
  // final double fontSize;
  // final FontWeight fontWeight;
  // final MainAxisAlignment buttonPositionType;

  const WTabBar({
    super.key,
    required this.tabsList,
    required this.controllerForMainTabVarView,
    this.background = AppColors.transparent,
    this.leftPadding = 0,
    // this.borderRadius = 10.0,
    // this.showLoader = false,
    // this.verticalPadding = 16,
    // this.horizontalPadding = 16,
    // this.child,
    // this.disabled = false,
    // this.textStyle,
    // this.margin = EdgeInsets.zero,
    // this.fontSize = 16,
    // this.textColor = AppColors.black,
    // this.fontWeight = FontWeight.w400,
    // this.buttonPositionType = MainAxisAlignment.center,
  });

  @override
  State<WTabBar> createState() => _WTabBarState();
}

class _WTabBarState extends State<WTabBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: widget.leftPadding, top: 0),
      height: 40,
      color: widget.background,
      child: TabBar(
        tabAlignment: TabAlignment.start,
        controller: widget.controllerForMainTabVarView,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 2,
        dividerColor: AppColors.mainColor,
        isScrollable: true,
        indicatorColor: AppColors.mainColor,
        labelColor: AppColors.mainColor,
        unselectedLabelColor: AppColors.c_24,
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
        labelPadding: const EdgeInsets.only(right: 32),
        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          // color: AppColors.c_07,
        ),
        tabs: [for (String tab in widget.tabsList) Tab(child: Text(tab))],
      ),
    );
  }
}
