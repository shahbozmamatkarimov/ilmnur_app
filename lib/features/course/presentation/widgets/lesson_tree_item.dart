// lesson_tree_item.dart

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ilmnur_app/config/routes/router.gr.dart';
import 'package:ilmnur_app/core/resources/app_colors.dart';
import 'package:ilmnur_app/features/lesson/data/models/lesson.dart';
import 'package:flutter_svg/flutter_svg.dart';

// 1. Avval StatefulWidget klassini aniqlash KERAK!
class LessonTreeItem extends StatefulWidget {
  final Lesson lesson;
  final int depth;

  const LessonTreeItem({super.key, required this.lesson, this.depth = 0});

  @override
  State<LessonTreeItem> createState() => _LessonTreeItemState();
}

// 2. Keyin State klassini yozamiz
class _LessonTreeItemState extends State<LessonTreeItem>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final childLessons = widget.lesson.lessons ?? [];
    final hasChildren = childLessons.isNotEmpty;
    final paddingLeft = 10 + widget.depth * 24.0;

    final bool isModule = widget.lesson.type == "module";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: isModule
              ? _toggleExpand
              : () {
                  context.router.push(LessonRoute(lessonId: widget.lesson.id));
                },
          child: Padding(
            padding: EdgeInsets.only(
              left: paddingLeft,
              right: 10,
              top: 12,
              bottom: 8,
            ),
            child: Row(
              children: [
                if (isModule)
                  AnimatedRotation(
                    turns: _isExpanded ? 0.25 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: const Icon(
                      Icons.chevron_right,
                      size: 20,
                      color: AppColors.mainColor,
                    ),
                  ),
                if (widget.lesson.video != null &&
                    widget.lesson.video!.isNotEmpty)
                  const Icon(
                    Icons.play_circle_fill,
                    size: 20,
                    color: AppColors.mainColor,
                  )
                else
                  const Icon(
                    Icons.description,
                    size: 20,
                    color: AppColors.mainColor,
                  ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.lesson.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.c_1b,
                    ),
                  ),
                ),
                // SvgPicture.asset(
                //   "assets/svg/course/statistics.svg",
                //   width: 20,
                //   height: 20,
                // ),
                SvgPicture.asset(
                  "assets/svg/course/${widget.lesson.is_finished == true ? 'finished' : 'not_finished'}.svg",
                  width: 20,
                  height: 20,
                ),
                if (widget.lesson.video != null &&
                    widget.lesson.video!.isNotEmpty)
                  const Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Text(
                      "Video",
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        if (hasChildren)
          SizeTransition(
            sizeFactor: _expandAnimation,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                children: (widget.lesson.lessons ?? [])
                    .map(
                      (child) => LessonTreeItem(
                        lesson: child,
                        depth: widget.depth + 1,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
      ],
    );
  }
}
