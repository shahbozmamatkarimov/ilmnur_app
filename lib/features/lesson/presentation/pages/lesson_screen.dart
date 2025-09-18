import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilmnur_app/config/routes/router.gr.dart';
import 'package:ilmnur_app/core/resources/app_colors.dart';
import 'package:ilmnur_app/core/util/responsive.dart';
import 'package:ilmnur_app/core/widgets/w_button.dart';
import 'package:ilmnur_app/core/widgets/w_tabbar.dart';
// import 'package:ilmnur_app/features/course/presentation/pages/chat.dart';
// import 'package:ilmnur_app/features/course/presentation/pages/news.dart';
// import 'package:ilmnur_app/features/course/presentation/pages/reyting.dart';
import 'package:ilmnur_app/features/lesson/data/data_sources/lesson_service.dart';
import 'package:ilmnur_app/features/lesson/data/models/lesson.dart';
import 'package:ilmnur_app/features/lesson/data/repositories/impl_lesson_repo.dart';
import 'package:ilmnur_app/features/lesson/presentation/bloc/group/lesson_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

@RoutePage()
class LessonScreen extends StatefulWidget {
  final int lessonId;
  LessonScreen({required this.lessonId});
  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController controller;
  late YoutubePlayerController _controller;
  String? currentVideoUrl = '';

  bool isLoading = true;
  Lesson videoLesson = Lesson(
    id: 1, // Convert string to int
    title: "",
    content: "",
    video: "video",
    createdAt: DateTime.parse(
      "2024-09-25T04:15:40.857Z",
    ), // Convert string to DateTime
    updatedAt: DateTime.parse(
      "2024-09-25T04:15:40.857Z",
    ), // Convert string to DateTime
  );

  void setVideoPlayer(Lesson? videoData) {
    if (videoData?.video == currentVideoUrl) return;
    currentVideoUrl = videoData?.video ?? '';

    final videoUrl = videoData?.video ?? '';

    // YouTube URL bo‘lsa
    String? videoId = YoutubePlayer.convertUrlToId(videoUrl);

    // Initialize the YouTube player controller with the extracted video ID
    _controller = YoutubePlayerController(
      initialVideoId: videoId ?? "", // Use extracted ID or empty if null
      flags: YoutubePlayerFlags(autoPlay: true, mute: false),
    );
  }

  @override
  void dispose() {
    if (controller.value.isInitialized) {
      controller.dispose();
      _controller.dispose();
    }
    super.dispose();
  }

  late final TabController controllerForMainTabVarView = TabController(
    length: 7,
    vsync: this,
    initialIndex: 0,
  );

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  final List<String> lessonTabs = [
    "Lectures",
    "Overview",
    "Comments",
    "Similar courses",
  ];

  Lesson? lesson;

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    return Scaffold(
      backgroundColor: isDesktop ? AppColors.white : AppColors.backgroundColor,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: AppColors.transparent,
              // shadowColor: AppColors.transparent,
              // foregroundColor: AppColors.transparent,
              // surfaceTintColor: AppColors.transparent,
              expandedHeight: isDesktop ? 466 : 320,
              leadingWidth: 0,
              leading: Text(""),
              toolbarHeight: 0,
              collapsedHeight: 0,
              automaticallyImplyLeading: false,
              floating: false,
              pinned: true,
              stretch: true,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                collapseMode: CollapseMode.parallax,
                background: BlocProvider(
                  create: (context) => LessonBloc(
                    id: widget.lessonId,
                    lessonRepo: ImplLessonRepo(
                      lessonService: LessonService.create(),
                    ),
                  ),
                  child: BlocBuilder<LessonBloc, LessonState>(
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
                        );
                      } else if (state is LoadedLessonData) {
                        lesson = state.lesson;
                        if (lesson?.video != null &&
                            lesson!.video!.isNotEmpty) {
                          setVideoPlayer(lesson);
                        }
                        return Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: isDesktop ? AppColors.white : null,
                          ),
                          child: Column(
                            children: [
                              if (lesson?.video != null &&
                                  lesson!.video!.isNotEmpty)
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: YoutubePlayer(
                                    controller: _controller,
                                    showVideoProgressIndicator: true,
                                    progressIndicatorColor: Colors.amber,
                                    onReady: () {
                                      print("Video is ready to play");
                                    },
                                    onEnded: (metaData) {
                                      print("Video Ended: ${metaData.videoId}");
                                    },
                                  ),
                                ),
                              const SizedBox(height: 24),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  if (lesson != null)
                                    Text(
                                      lesson!.title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                      ),
                                    ),
                                  Row(
                                    children: [
                                      WButton(
                                        text: "",
                                        verticalPadding: 12,
                                        horizontalPadding: 12,
                                        color: AppColors.mainColor,
                                        borderRadius: 8,
                                        onTap: () => {},
                                        child: SvgPicture.asset(
                                          "assets/svg/lesson/marked.svg",
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      WButton(
                                        text: "",
                                        verticalPadding: 12,
                                        horizontalPadding: 12,
                                        color: AppColors.mainColor,
                                        borderRadius: 8,
                                        buttonType: ButtonType.outline,
                                        onTap: () => {},
                                        child: SvgPicture.asset(
                                          "assets/svg/lesson/edit.svg",
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          'https://picsum.photos/250?image=9',
                                          height: 40,
                                          width: 40,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Marius Ciocirland",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.c_1b.withOpacity(
                                                0.9,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Behance",
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: AppColors.c_1b.withOpacity(
                                                0.6,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/svg/nav/star.svg",
                                      ),
                                      const SizedBox(width: 4),
                                      const Text(
                                        "2.3K",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.c_1b,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // const SizedBox(height: 24),
                            ],
                          ),
                        );
                      } else if (state is ErrorLoadingLessonData) {
                        return Center(
                          child: Text(
                            'Error loading community data: ${state.errorMessage}',
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ),
            ),
          ];
        },
        // body: Stack(
        //   children: [
        // SizedBox(height: 40),
        // This Expanded contains the TabBarView
        body: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: isDesktop ? AppColors.white : null,
          ),
          child: Column(
            children: [
              WTabBar(
                tabsList: lessonTabs,
                background: AppColors.transparent,
                controllerForMainTabVarView: controllerForMainTabVarView,
              ),
              Expanded(
                child: TabBarView(
                  controller: controllerForMainTabVarView,
                  children: [
                    LectureView(
                      text: videoLesson.content ?? '',
                      isLoading: isLoading,
                    ),
                    // Chat(),
                    // News(),
                    // Reyting(),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Positioned WTabBar at the absolute top
        // Positioned(
        //   top: 0,
        //   left: 0,
        //   right: 0,
        //   height: 56,
        //   child: WTabBar(
        //     tabsList: lessonTabs,
        //     background: AppColors.white,
        //     controllerForMainTabVarView: controllerForMainTabVarView,
        //   ),
        // ),
        // ],
        // ),
      ),
    );
  }
}

class LectureView extends StatelessWidget {
  String text = ''; // Text to display
  bool isLoading;

  LectureView({Key? key, required this.isLoading, required this.text})
    : super(key: key);

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
            context.router.push(TestsRoute(testId: 1));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14, // Font size of the text
            ),
          ),
        ),
      ),
    );
  }
}
