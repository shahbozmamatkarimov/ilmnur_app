import 'package:flutter/material.dart';
import 'package:ilmnur_app/core/resources/app_colors.dart';

class CategoryCard extends StatelessWidget {
  final String icon;
  final String label;
  final bool? isSelected;

  const CategoryCard({
    super.key,
    required this.icon,
    required this.label,
    this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: isSelected == true
              ? AppColors.mainColor
              : AppColors.white,
          child: Text(icon, style: const TextStyle(fontSize: 32)),
        ),
        const SizedBox(height: 10),
        Text(label, style: const TextStyle(fontSize: 10)),
      ],
    );
  }
}
