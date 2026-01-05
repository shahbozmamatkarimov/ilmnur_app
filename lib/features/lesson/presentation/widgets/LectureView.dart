import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ilmnur_app/config/routes/router.gr.dart';
import 'package:ilmnur_app/core/resources/app_colors.dart';
import 'package:ilmnur_app/core/widgets/w_button.dart';
import 'package:ilmnur_app/features/lesson/presentation/widgets/HtmlContent.dart';

class LectureView extends StatelessWidget {
  final String htmlContent; // backenddan kelgan HTML string
  final int lessonId; // backenddan kelgan HTML string
  final bool isFinished;
  final int testsCount;
  final int ball;

  const LectureView({
    super.key,
    required this.htmlContent,
    required this.lessonId,
    required this.isFinished,
    required this.testsCount,
    required this.ball,
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
          text: isFinished
              ? 'Qayta topshirish ($testsCount/$ball)'
              : 'Testni boshlash',
          color: AppColors.mainColor,
          buttonType: isFinished ? ButtonType.outline : ButtonType.filled,
          textColor: isFinished ? AppColors.mainColor : AppColors.white,
          verticalPadding: 10,
          onTap: () {
            context.router.push(TestsRoute(testId: lessonId));
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: HtmlContent(htmlContent: htmlContent),
      ),
    );
  }
}
