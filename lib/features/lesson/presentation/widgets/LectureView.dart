import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ilmnur_app/config/routes/router.gr.dart';
import 'package:ilmnur_app/core/resources/app_colors.dart';
import 'package:ilmnur_app/core/widgets/w_button.dart';
import 'package:ilmnur_app/features/lesson/presentation/widgets/HtmlContent.dart';

class LectureView extends StatelessWidget {
  final String htmlContent; // backenddan kelgan HTML string
  final int lessonId; // backenddan kelgan HTML string

  const LectureView({
    super.key,
    required this.htmlContent,
    required this.lessonId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      bottomNavigationBar: BottomAppBar(
        color: AppColors.transparent,
        height: 48,
        padding: const EdgeInsets.all(0),
        child: WButton(
          text: 'Start test',
          color: AppColors.mainColor,
          textColor: AppColors.white,
          verticalPadding: 10,
          onTap: () {
            context.router.push(TestsRoute(testId: lessonId));
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: HtmlContent(htmlContent: htmlContent),
      ),
    );
  }
}
