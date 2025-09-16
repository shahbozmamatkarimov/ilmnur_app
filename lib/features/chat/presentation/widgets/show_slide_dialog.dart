import 'package:flutter/material.dart';

void showFullScreenSlideFromRightDialog(BuildContext context, Widget child) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (_, __, ___) => Dismissible(
      key: const Key('fullscreen_slide_panel'),
      direction: DismissDirection.startToEnd, // chapga surilsa yopiladi
      onDismissed: (_) => Navigator.of(context).pop(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: child),
      ),
    ),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final offset = Tween<Offset>(
        begin: const Offset(1, 0), // o‘ngdan chiqadi
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));
      return SlideTransition(position: offset, child: child);
    },
  );
}
