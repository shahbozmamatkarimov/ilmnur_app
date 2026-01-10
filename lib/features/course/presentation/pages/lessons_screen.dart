import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilmnur_app/core/resources/app_colors.dart';
import 'package:ilmnur_app/core/widgets/w_button.dart';
import 'package:ilmnur_app/features/course/data/data_sources/course_service.dart';
import 'package:ilmnur_app/features/course/data/models/course.dart';
import 'package:ilmnur_app/features/course/data/repositories/impl_course_repo.dart';
import 'package:ilmnur_app/features/course/presentation/bloc/course/course_bloc.dart';
import 'package:ilmnur_app/features/course/presentation/widgets/add_course.dart';
import 'package:ilmnur_app/features/home/data/models/category/category.dart';
import 'package:ilmnur_app/features/home/presentation/bloc/category/category_bloc.dart'
    as category;
import 'package:ilmnur_app/features/login/presentation/pages/login_screen.dart';
import 'package:ilmnur_app/main.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ilmnur_app/config/routes/router.gr.dart';

// @RoutePage()
class Lessons extends StatefulWidget {
  final int id;
  const Lessons({super.key, required this.id});

  @override
  State<Lessons> createState() => _LessonsState();
}

class _LessonsState extends State<Lessons> {
  List<int> selectedsubcategory_id = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseBloc(
        id: widget.id,
        courseRepo: ImplCourseRepo(courseService: CourseService.create()),
      )..add(GetCourses()),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: BlocBuilder<category.CategoryBloc, category.CategoryState>(
                  builder: (context, state) {
                    if (state is category.Loading) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Wrap(
                            spacing: 8,
                            children: [
                              for (var _ in [1, 2, 3, 4, 5, 6, 7, 8, 9])
                                Shimmer.fromColors(
                                  baseColor: Colors.grey.withOpacity(0.3),
                                  highlightColor: Colors.grey.withOpacity(0.1),
                                  child: Container(
                                    height: 34,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(17),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    } else if (state is category.LoadedCategoryData) {
                      final List<Category> subcategory = state.category
                          .expand(
                            (Category cat) =>
                                (cat.subcategories ?? []).cast<Category>(),
                          )
                          .toList();

                      return SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                          direction: Axis.horizontal,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          alignment: WrapAlignment.start,
                          spacing: 12,
                          children: [
                            WButton(
                              text: "All",
                              fontSize: 12,
                              borderRadius: 20,
                              verticalPadding: 8,
                              horizontalPadding: 12,
                              color: AppColors.mainColor,
                              textColor: AppColors.white,
                              onTap: () => {},
                            ),
                            for (Category i in subcategory)
                              WButton(
                                text: i.title,
                                fontSize: 12,
                                borderRadius: 20,
                                verticalPadding: 5,
                                horizontalPadding: 12,
                                color: AppColors.mainColor,
                                textColor: selectedsubcategory_id.contains(i.id)
                                    ? AppColors.white
                                    : AppColors.mainColor,
                                buttonType:
                                    selectedsubcategory_id.contains(i.id)
                                    ? ButtonType.filled
                                    : ButtonType.outline,
                                onTap: () => {
                                  setState(() {
                                    if (selectedsubcategory_id.contains(i.id)) {
                                      selectedsubcategory_id.remove(i.id);
                                    } else {
                                      selectedsubcategory_id.add(i.id);
                                    }
                                  }),
                                  context.read<CourseBloc>().add(
                                    GetCourses(
                                      subcategory_id:
                                          selectedsubcategory_id.isEmpty
                                          ? null
                                          : '[${selectedsubcategory_id.join(',')}]',
                                    ),
                                  ),
                                },
                              ),
                          ],
                        ),
                      );
                    } else if (state is category.ErrorLoadingCategoryData) {
                      return Center(
                        child: Text(
                          'Error loading category data: ${state.errorMessage}',
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
              BlocBuilder<CourseBloc, CourseState>(
                builder: (context, state) {
                  if (state is Loading) {
                    return ClipRect(
                      child: Wrap(
                        spacing: 12.0,
                        runSpacing: 12.0,
                        alignment: WrapAlignment.spaceEvenly,
                        children: [
                          for (var _ in [1, 2, 3, 4, 5, 6, 7, 8, 9])
                            Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(
                                0.3,
                              ), // Background color of the skeleton
                              highlightColor: Colors.grey.withOpacity(
                                0.1,
                              ), // Highlight color of the skeleton
                              child: Container(
                                height: 300,
                                width: MediaQuery.of(context).size.width > 800
                                    ? 250
                                    : MediaQuery.of(context).size.width / 2 -
                                          30,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(17),
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  } else if (state is LoadedCourseData) {
                    final courses = state.course;
                    return Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        for (Course i in courses.courses)
                          GestureDetector(
                            // onTap: () => context.router.pushNamed("/course"),
                            onTap: () {
                              context.router.push(CourseRoute(courseId: i.id));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.white,
                              ),
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width > 800
                                    ? 250
                                    : MediaQuery.of(context).size.width / 2 -
                                          30,
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: <Widget>[
                                      Image.network(
                                        i.cover,
                                        height: 120,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        loadingBuilder:
                                            (
                                              BuildContext context,
                                              Widget child,
                                              ImageChunkEvent? loadingProgress,
                                            ) {
                                              if (loadingProgress == null) {
                                                return child; // When image is loaded
                                              } else {
                                                return Shimmer.fromColors(
                                                  baseColor: Colors.grey
                                                      .withOpacity(
                                                        0.3,
                                                      ), // Background color of the skeleton
                                                  highlightColor: Colors.grey
                                                      .withOpacity(
                                                        0.1,
                                                      ), // Highlight color of the skeleton
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                          color:
                                                              AppColors.white,
                                                        ),
                                                    height: 120,
                                                    constraints:
                                                        const BoxConstraints(
                                                          maxWidth:
                                                              350, // Set the maximum width to 200
                                                        ),
                                                  ),
                                                );
                                              }
                                            },
                                        errorBuilder:
                                            (
                                              BuildContext context,
                                              Object error,
                                              StackTrace? stackTrace,
                                            ) {
                                              return const Text(
                                                'Failed to load image',
                                              ); // Error handling
                                            },
                                      ),
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                          width: MediaQuery.of(
                                            context,
                                          ).size.width,
                                          padding: const EdgeInsets.all(6),
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0x801B1B1B),
                                                Color(0x001B1B1B),
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                            ),
                                          ),
                                          child: const Text(
                                            "#Matematika",
                                            style: TextStyle(
                                              color: AppColors.mainColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          i.title,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          i.description,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/svg/nav/star.svg",
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              "${i.likes_count ?? 0}",
                                              style: const TextStyle(
                                                color: AppColors.mainColor,
                                                fontSize: 12,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              "\$${i.price}",
                                              style: const TextStyle(
                                                color: AppColors.c_1b,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        LinearProgressIndicator(
                                          value: i.lessons_count == null
                                              ? 0
                                              : (i.finished_count ?? 0) /
                                                    (i.lessons_count ?? 0),
                                          backgroundColor: AppColors.c_e0,
                                          color: AppColors.mainColor,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(2),
                                          ),
                                          semanticsLabel:
                                              'Linear progress indicator',
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          "${i.finished_count}/${i.lessons_count} completed",
                                          style: const TextStyle(
                                            color: AppColors.c_07,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    color: AppColors.mainColor,
                                    height: 1,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      spacing: -8,
                                      children: [
                                        for (int i in [1, 2, 3, 4])
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            child: Image.network(
                                              'https://picsum.photos/250?image=$i',
                                              height: 24,
                                              width: 24,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        WButton(
                                          text: "+255",
                                          textColor: AppColors.c_a1,
                                          fontSize: 12,
                                          verticalPadding: 0,
                                          color: AppColors.transparent,
                                          onTap: () => {},
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        // const MyCourseView(),
                      ],
                    );
                  } else if (state is ErrorLoadingCourseData) {
                    // return Center(
                    //   child: Text(
                    //     'Error loading community data: ${state.errorMessage}',
                    //   ),
                    // );
                    return ValueListenableBuilder(
                      valueListenable: Globals.isAuth,
                      builder: (context, bool auth, child) {
                        // Mantiqni tekshiring: kirmagan bo'lsa (!) Loginni ko'rsatish
                        // if (!auth) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsetsGeometry.symmetric(
                              vertical: 150,
                            ),
                            child: WButton(
                              color: AppColors.mainColor,
                              horizontalPadding: 25,
                              verticalPadding: 10,
                              fontSize: 14,
                              textColor: AppColors.white,
                              borderRadius: 50,
                              text: 'Iltimos, tizimga kiring',
                              onTap: () => {
                                context.router.push(const LoginRoute()),
                              },
                            ),
                          ),
                        );
                        // }
                      },
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class CircularProgressIndicatorClass extends StatefulWidget {
  const CircularProgressIndicatorClass({super.key});

  @override
  CircularProgressIndicatorClassState createState() =>
      CircularProgressIndicatorClassState();
}

class CircularProgressIndicatorClassState
    extends State<CircularProgressIndicatorClass> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: AppColors.transparent,
      backgroundColor: AppColors.backgroundColor,
      body: SizedBox(
        width: 100,
        height: 100,
        child: CircularProgressIndicator(
          value: 0.45,
          strokeWidth: 2,
          backgroundColor: Color(
            0XFFEDEDED,
          ), // Color behind the progress indicator
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF40E746)),
        ),
      ),
    );
  }
}

class MyCourseView extends StatelessWidget {
  const MyCourseView({super.key});

  void _showInputModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext modalContext) {
        return BlocProvider.value(
          value: BlocProvider.of<CourseBloc>(context),
          child: const AddCourseModal(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WButton(
      text: "",
      verticalPadding: 0,
      horizontalPadding: 0,
      onTap: () => _showInputModal(context),
      child: DottedBorder(
        borderType: BorderType.RRect,
        color: AppColors.mainColor,
        strokeWidth: 1,
        dashPattern: const [5, 5],
        strokeCap: StrokeCap.round,
        radius: const Radius.circular(8),
        child: Container(
          height: 306,
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width > 800
                ? 245
                : MediaQuery.of(context).size.width / 2 - 35,
          ),
          width: double.infinity,
          decoration: const BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/svg/icon/add.svg"),
              const Text(
                "Add new course",
                style: TextStyle(fontSize: 12, color: AppColors.mainColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
