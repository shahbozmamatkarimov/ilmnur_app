import 'package:flutter/material.dart';
import 'package:ilmnur_app/core/resources/app_colors.dart';
// import 'package:ilmnur_app/features/course/presentation/pages/chat.dart';
// import 'package:ilmnur_app/features/course/presentation/pages/reyting.dart';
// import 'package:ilmnur_app/features/course/presentation/pages/settings.dart';
import 'package:ilmnur_app/features/news/presentation/widgets/WNews.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              for (int i in [1, 2, 3, 4, 5, 6]) const WNews(),
            ],
          ),
        ),
      ),
    );
  }
}
