import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/app_colors.dart';
import '../resources/styles.dart';

class WBottomBarItem extends StatelessWidget {
  final String icon;
  final String label;
  final GestureTapCallback onTap;
  final bool isActive;

  const WBottomBarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: _getElement(context),
    );
  }

  _getElement(BuildContext context) => SingleChildScrollView(
    child: Column(
      children: [
        Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(8),
          child: SvgPicture.asset(
            icon,
            width: 40,
            height: 40,
            colorFilter: ColorFilter.mode(
              isActive ? AppColors.mainColor : AppColors.c_7a,
              BlendMode.srcIn,
            ),
          ),
        ),
        // const SizedBox(height: 8),
        Text(
          label.toUpperCase(),
          style: Styles.getTextStyle(
            fontSize: 8,
            fontWeight: isActive ? FontWeight.w500 : FontWeight.w400,
            color: isActive ? AppColors.mainColor : AppColors.c_7a,
          ),
        ),
      ],
    ),
  );
}
