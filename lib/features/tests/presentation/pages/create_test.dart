import 'package:flutter/material.dart';
import 'package:ilmnur_app/core/resources/app_colors.dart';

class CreateTestPage extends StatelessWidget {
  final Function backPage; // Required parameter

  // Constructor with required item
  CreateTestPage({
    Key? key,
    required this.backPage, // Use required to ensure it's passed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(32),
          child: const Column(children: [Text("Test yaratish")]),
        ),
      ),
    );
  }
}
