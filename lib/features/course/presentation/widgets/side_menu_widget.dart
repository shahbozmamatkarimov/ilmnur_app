import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilmnur_app/core/data/side_menu_data.dart';
import 'package:ilmnur_app/core/resources/app_colors.dart';
import 'package:auto_route/auto_route.dart';

class SideMenuWidget extends StatefulWidget {
  const SideMenuWidget({super.key});

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final data = SideMenuData();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.white,
      ),
      child: ListView.builder(
        itemCount: data.menu.length,
        itemBuilder: (context, index) => buildMenuEntry(data, index),
      ),
    );
  }

  Widget buildMenuEntry(SideMenuData data, int index) {
    final isSelected = selectedIndex == index;

    return Container(
      // margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        color: isSelected ? AppColors.mainColor : Colors.transparent,
      ),
      child: InkWell(
        onTap: () => {
          if (index == 0)
            {context.router.pushNamed("/")}
          else if (index == 1)
            {context.router.pushNamed("/reyting")}
          else if (index == 3)
            {context.router.pushNamed("/news")},
          setState(() {
            selectedIndex = index;
          }),
        },
        child: Row(
          children: [
            SizedBox(
              child: SvgPicture.asset(
                data.menu[index].icon,
                color: isSelected ? AppColors.white : null,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              data.menu[index].title,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? AppColors.white : AppColors.c_55,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
