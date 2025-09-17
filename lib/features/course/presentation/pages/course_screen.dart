import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ilmnur_app/features/course/data/data_sources/course_service.dart';
import 'package:ilmnur_app/features/course/data/repositories/impl_course_repo.dart';
import 'package:ilmnur_app/features/course/presentation/bloc/course/course_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ilmnur_app/config/routes/router.gr.dart';

@RoutePage()
class CourseScreen extends StatefulWidget {
  final int courseId;
  const CourseScreen({super.key, required this.courseId});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   context.read<CourseBloc>().add(GetLessons());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orqaga"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocProvider(
        create: (context) => CourseBloc(
          courseRepo: ImplCourseRepo(courseService: CourseService.create()),
          id: widget.courseId,
        )..add(GetLessons()),
        child: BlocBuilder<CourseBloc, CourseState>(
          builder: (context, state) {
            if (state is Loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LoadedLessonsData) {
              final course = state.course;
              final lessons = state.lessons;

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Cover Image
                    Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: course.cover,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            color: Colors.black54,
                            child: Text(
                              course.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Course info
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            course.description ?? "",
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(Icons.calendar_today, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                course.createdAt.toString().split("T").first,
                              ),
                              const SizedBox(width: 16),
                              const Icon(Icons.people, size: 16),
                              const SizedBox(width: 4),
                              Text("${course.subscriptions_count} Azolar"),
                              const SizedBox(width: 16),
                              const Icon(
                                Icons.star,
                                size: 16,
                                color: Colors.orange,
                              ),
                              const SizedBox(width: 4),
                              Text(course.likes_count.toString()),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "0/${course.lessons_count} completed",
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 5),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("Davom etish"),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Lessons
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: lessons.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final lesson = lessons[index];
                        return ListTile(
                          leading: const Icon(Icons.drag_indicator),
                          title: Text(lesson.title),
                          trailing: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("0:00"),
                              SizedBox(width: 10),
                              Icon(Icons.bar_chart, size: 20),
                              SizedBox(width: 10),
                              // Icon(
                              //   lesson.isFinished ? Icons.lock_open : Icons.lock,
                              //   size: 20,
                              // ),
                            ],
                          ),
                          onTap: () {
                            context.router.push(
                              LessonRoute(lessonId: lesson.id),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              );
            } else if (state is ErrorLoadingCourseData) {
              return Center(child: Text(state.errorMessage));
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
