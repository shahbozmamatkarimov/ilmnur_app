// import 'dart:developer';
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:ilmnur_app/core/resources/app_colors.dart';
// import 'package:ilmnur_app/core/util/responsive.dart';
// import 'package:ilmnur_app/core/widgets/w_button.dart';
// import 'package:ilmnur_app/core/widgets/w_tabbar.dart';
// // import 'package:ilmnur_app/features/course/presentation/pages/chat.dart';
// // import 'package:ilmnur_app/features/course/presentation/pages/news.dart';
// // import 'package:ilmnur_app/features/course/presentation/pages/reyting.dart';
// // import 'package:ilmnur_app/features/course/presentation/pages/settings.dart';
// // import 'package:ilmnur_app/features/course/presentation/pages/users.dart';
// // import 'package:ilmnur_app/features/home/presentation/pages/home_page.dart';
// // import 'package:ilmnur_app/features/lesson/data/data_sources/lesson_service.dart';
// // import 'package:ilmnur_app/features/lesson/data/models/lesson.dart';
// // import 'package:ilmnur_app/features/lesson/data/repositories/impl_lesson_repo.dart';
// // import 'package:ilmnur_app/features/lesson/presentation/bloc/group/lesson_bloc.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:video_player/video_player.dart';

// @RoutePage()
// class UserScreen extends StatefulWidget {
//   final int lessonId;
//   UserScreen({required this.lessonId});
//   @override
//   State<UserScreen> createState() => _UserScreenState();
// }

// class _UserScreenState extends State<UserScreen>
//     with SingleTickerProviderStateMixin {
//   late VideoPlayerController controller;
//   String currentVideoUrl = '';

//   bool isLoading = true;
//   Lesson videoLesson = Lesson(
//     id: 1, // Convert string to int
//     title: "",
//     content: "",
//     video: "video",
//     createdAt: DateTime.parse(
//       "2024-09-25T04:15:40.857Z",
//     ), // Convert string to DateTime
//     updatedAt: DateTime.parse(
//       "2024-09-25T04:15:40.857Z",
//     ), // Convert string to DateTime
//   );

//   void setVideoPlayer(Lesson videoData) {
//     if (videoData.video == currentVideoUrl) return;
//     currentVideoUrl = videoData.video;
//     videoLesson = videoData;
//     controller = VideoPlayerController.network(videoData.video)
//       ..addListener(() {
//         if (controller.value.hasError) {
//           log("Video error: ${controller.value.errorDescription}");
//         }
//       });
//     controller.initialize().then((value) {
//       if (controller.value.isInitialized) {
//         // controller.play();
//         setState(() {});
//       } else {
//         log("video file load failed");
//       }
//     });
//   }

//   @override
//   void dispose() {
//     if (controller.value.isInitialized) {
//       controller.dispose();
//     }
//     super.dispose();
//   }

//   late final TabController controllerForMainTabVarView = TabController(
//     length: 7,
//     vsync: this,
//     initialIndex: 0,
//   );

//   String formatDuration(Duration duration) {
//     String twoDigits(int n) => n.toString().padLeft(2, '0');
//     String minutes = twoDigits(duration.inMinutes.remainder(60));
//     String seconds = twoDigits(duration.inSeconds.remainder(60));
//     return '$minutes:$seconds';
//   }

//   final List<String> lessonTabs = [
//     "Lectures",
//     "Overview",
//     "Comments",
//     "Similar courses",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final isDesktop = Responsive.isDesktop(context);
//     return Scaffold(
//       backgroundColor: isDesktop ? AppColors.white : AppColors.backgroundColor,
//       body: NestedScrollView(
//         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//           return <Widget>[
//             SliverAppBar(
//               backgroundColor: AppColors.transparent,
//               // shadowColor: AppColors.transparent,
//               // foregroundColor: AppColors.transparent,
//               // surfaceTintColor: AppColors.transparent,
//               expandedHeight: isDesktop ? 466 : 366,
//               leadingWidth: 0,
//               leading: Text(""),
//               toolbarHeight: 0,
//               collapsedHeight: 0,
//               automaticallyImplyLeading: false,
//               floating: false,
//               pinned: true,
//               stretch: true,
//               snap: false,
//               flexibleSpace: FlexibleSpaceBar(
//                 centerTitle: true,
//                 collapseMode: CollapseMode.parallax,
//                 background: BlocProvider(
//                   create: (context) => LessonBloc(
//                     id: widget.lessonId,
//                     lessonRepo: ImplLessonRepo(
//                       lessonService: LessonService.create(),
//                     ),
//                   ),
//                   child: BlocBuilder<LessonBloc, LessonState>(
//                     builder: (context, state) {
//                       if (state is Loading) {
//                         return ClipRect(
//                           child: Wrap(
//                             spacing: 12.0,
//                             runSpacing: 12.0,
//                             alignment: WrapAlignment.spaceEvenly,
//                             children: [
//                               for (var _ in [1, 2, 3, 4, 5, 6, 7, 8, 9])
//                                 Shimmer.fromColors(
//                                   baseColor: Colors.grey.withOpacity(
//                                     0.3,
//                                   ), // Background color of the skeleton
//                                   highlightColor: Colors.grey.withOpacity(
//                                     0.1,
//                                   ), // Highlight color of the skeleton
//                                   child: Container(
//                                     height: 34,
//                                     width: 100,
//                                     decoration: BoxDecoration(
//                                       color: Colors.grey[300],
//                                       borderRadius: BorderRadius.circular(17),
//                                     ),
//                                   ),
//                                 ),
//                             ],
//                           ),
//                         );
//                       } else if (state is LoadedLessonData) {
//                         final lesson = state.lesson;
//                         setVideoPlayer(lesson);
//                         return Container(
//                           padding: const EdgeInsets.all(16),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(6),
//                             color: isDesktop ? AppColors.white : null,
//                           ),
//                           child: Column(
//                             children: [
//                               Stack(
//                                 children: [
//                                   controller.value.isInitialized
//                                       ? Container(
//                                           width: double.infinity, // Full width
//                                           height: isDesktop
//                                               ? 312
//                                               : 212, // Set height to 300
//                                           decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(
//                                               8,
//                                             ),
//                                             color: AppColors.black,
//                                           ),
//                                           clipBehavior: Clip.hardEdge,
//                                           child: AspectRatio(
//                                             aspectRatio:
//                                                 controller.value.aspectRatio,
//                                             child: VideoPlayer(controller),
//                                           ),
//                                         )
//                                       : const Center(
//                                           child: CircularProgressIndicator(),
//                                         ),
//                                   Positioned(
//                                     top: 16,
//                                     left: 16,
//                                     child: WButton(
//                                       text: "",
//                                       verticalPadding: 0,
//                                       horizontalPadding: 0,
//                                       color: AppColors.transparent,
//                                       onTap: () => {Navigator.pop(context)},
//                                       child: SvgPicture.asset(
//                                         "assets/svg/icon/backroute.svg",
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     bottom: 0,
//                                     left: 0,
//                                     right: 0,
//                                     child: Column(
//                                       children: [
//                                         // Video progress slider
//                                         ValueListenableBuilder(
//                                           valueListenable: controller,
//                                           builder: (context, VideoPlayerValue value, child) {
//                                             final duration = value
//                                                 .duration
//                                                 .inSeconds
//                                                 .toDouble();
//                                             final position = value
//                                                 .position
//                                                 .inSeconds
//                                                 .toDouble();

//                                             return SliderTheme(
//                                               data: SliderTheme.of(context).copyWith(
//                                                 trackShape:
//                                                     const RectangularSliderTrackShape(), // Makes the track go full width
//                                                 trackHeight:
//                                                     2.0, // Set the height of the slider track (optional)
//                                                 thumbShape:
//                                                     const RoundSliderThumbShape(
//                                                       enabledThumbRadius: 6.0,
//                                                     ),
//                                                 overlayShape:
//                                                     const RoundSliderOverlayShape(
//                                                       overlayRadius: 10.0,
//                                                     ),
//                                                 // You can also modify other styling options as needed
//                                               ),
//                                               child: Slider(
//                                                 min: 0.0,
//                                                 max: duration,
//                                                 value: position.clamp(
//                                                   0.0,
//                                                   duration,
//                                                 ),
//                                                 activeColor:
//                                                     AppColors.mainColor,
//                                                 inactiveColor: const Color(
//                                                   0x50FFFFFF,
//                                                 ),
//                                                 onChanged: (newPosition) {
//                                                   controller.seekTo(
//                                                     Duration(
//                                                       seconds: newPosition
//                                                           .toInt(),
//                                                     ),
//                                                   );
//                                                 },
//                                               ),
//                                             );
//                                           },
//                                         ),
//                                         ValueListenableBuilder(
//                                           valueListenable: controller,
//                                           builder: (context, VideoPlayerValue value, child) {
//                                             String formattedCurrent =
//                                                 formatDuration(value.position);
//                                             String formattedTotal =
//                                                 formatDuration(value.duration);

//                                             // Playback control buttons
//                                             return Container(
//                                               // margin: const EdgeInsets.only(),
//                                               padding: const EdgeInsets.only(
//                                                 left: 16,
//                                                 right: 16,
//                                                 top: 6,
//                                                 bottom: 12,
//                                               ),
//                                               decoration: const BoxDecoration(
//                                                 gradient: LinearGradient(
//                                                   colors: [
//                                                     Color(0x901B1B1B),
//                                                     Color(0x001B1B1B),
//                                                   ],
//                                                   begin: Alignment.bottomCenter,
//                                                   end: Alignment.topCenter,
//                                                 ),
//                                               ),
//                                               child: Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Row(
//                                                     children: [
//                                                       WButton(
//                                                         text: "",
//                                                         color: AppColors
//                                                             .transparent,
//                                                         verticalPadding: 0,
//                                                         horizontalPadding: 0,
//                                                         onTap: () =>
//                                                             controller.play(),
//                                                         child: SvgPicture.asset(
//                                                           "assets/svg/video/play.svg",
//                                                         ),
//                                                       ),
//                                                       const SizedBox(width: 20),
//                                                       WButton(
//                                                         text: "",
//                                                         color: AppColors
//                                                             .transparent,
//                                                         verticalPadding: 0,
//                                                         horizontalPadding: 0,
//                                                         onTap: () =>
//                                                             controller.pause(),
//                                                         child: SvgPicture.asset(
//                                                           "assets/svg/video/sound.svg",
//                                                         ),
//                                                       ),
//                                                       const SizedBox(width: 8),
//                                                       Text(
//                                                         "$formattedCurrent / $formattedTotal",
//                                                         // "${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')} / $formatDuration(duration) / $duration / $position",
//                                                         style: const TextStyle(
//                                                           color:
//                                                               AppColors.white,
//                                                           fontSize: 14,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   Row(
//                                                     children: [
//                                                       WButton(
//                                                         text: "",
//                                                         color: AppColors
//                                                             .transparent,
//                                                         verticalPadding: 0,
//                                                         horizontalPadding: 0,
//                                                         onTap: () =>
//                                                             controller.seekTo(
//                                                               Duration(
//                                                                 milliseconds:
//                                                                     controller
//                                                                         .value
//                                                                         .position
//                                                                         .inMilliseconds -
//                                                                     10 * 1000,
//                                                               ),
//                                                             ),
//                                                         child: SvgPicture.asset(
//                                                           "assets/svg/video/backward.svg",
//                                                         ),
//                                                       ),
//                                                       const SizedBox(width: 16),
//                                                       WButton(
//                                                         text: "",
//                                                         color: AppColors
//                                                             .transparent,
//                                                         verticalPadding: 0,
//                                                         horizontalPadding: 0,
//                                                         onTap: () =>
//                                                             controller.seekTo(
//                                                               Duration(
//                                                                 milliseconds:
//                                                                     controller
//                                                                         .value
//                                                                         .position
//                                                                         .inMilliseconds +
//                                                                     10 * 1000,
//                                                               ),
//                                                             ),
//                                                         child: SvgPicture.asset(
//                                                           "assets/svg/video/forward.svg",
//                                                         ),
//                                                       ),
//                                                       const SizedBox(width: 16),
//                                                       // WButton(
//                                                       //   text: "",
//                                                       //   color: AppColors.transparent,
//                                                       //   verticalPadding: 0,
//                                                       //   horizontalPadding: 0,
//                                                       //   onTap: () => {},
//                                                       //   child: SvgPicture.asset(
//                                                       //       "assets/svg/video/settings.svg"),
//                                                       // ),
//                                                       // const SizedBox(width: 16),
//                                                       // WButton(
//                                                       //   text: "",
//                                                       //   color: AppColors.transparent,
//                                                       //   verticalPadding: 0,
//                                                       //   horizontalPadding: 0,
//                                                       //   onTap: () => {},
//                                                       //   child: SvgPicture.asset(
//                                                       //       "assets/svg/video/full_screen.svg"),
//                                                       // ),
//                                                     ],
//                                                   ),
//                                                 ],
//                                               ),
//                                             );
//                                           },
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 24),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     lesson.title,
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 20,
//                                     ),
//                                   ),
//                                   Row(
//                                     children: [
//                                       WButton(
//                                         text: "",
//                                         verticalPadding: 12,
//                                         horizontalPadding: 12,
//                                         color: AppColors.mainColor,
//                                         borderRadius: 8,
//                                         onTap: () => {},
//                                         child: SvgPicture.asset(
//                                           "assets/svg/lesson/marked.svg",
//                                         ),
//                                       ),
//                                       const SizedBox(width: 12),
//                                       WButton(
//                                         text: "",
//                                         verticalPadding: 12,
//                                         horizontalPadding: 12,
//                                         color: AppColors.mainColor,
//                                         borderRadius: 8,
//                                         buttonType: ButtonType.outline,
//                                         onTap: () => {},
//                                         child: SvgPicture.asset(
//                                           "assets/svg/lesson/edit.svg",
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 16),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       ClipRRect(
//                                         borderRadius: BorderRadius.circular(20),
//                                         child: Image.network(
//                                           'https://picsum.photos/250?image=9',
//                                           height: 40,
//                                           width: 40,
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ),
//                                       const SizedBox(width: 8),
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             "Marius Ciocirland",
//                                             style: TextStyle(
//                                               fontSize: 12,
//                                               fontWeight: FontWeight.bold,
//                                               color: AppColors.c_1b.withOpacity(
//                                                 0.9,
//                                               ),
//                                             ),
//                                           ),
//                                           Text(
//                                             "Behance",
//                                             style: TextStyle(
//                                               fontSize: 10,
//                                               color: AppColors.c_1b.withOpacity(
//                                                 0.6,
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                   Row(
//                                     children: [
//                                       SvgPicture.asset(
//                                         "assets/svg/nav/star.svg",
//                                       ),
//                                       const SizedBox(width: 4),
//                                       const Text(
//                                         "2.3K",
//                                         style: TextStyle(
//                                           fontSize: 14,
//                                           color: AppColors.c_1b,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                               // const SizedBox(height: 24),
//                             ],
//                           ),
//                         );
//                       } else if (state is ErrorLoadingLessonData) {
//                         return Center(
//                           child: Text(
//                             'Error loading community data: ${state.errorMessage}',
//                           ),
//                         );
//                       } else {
//                         return Container();
//                       }
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ];
//         },
//         // body: Stack(
//         //   children: [
//         // SizedBox(height: 40),
//         // This Expanded contains the TabBarView
//         body: Container(
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(6),
//             color: isDesktop ? AppColors.white : null,
//           ),
//           child: Column(
//             children: [
//               WTabBar(
//                 tabsList: lessonTabs,
//                 background: AppColors.transparent,
//                 controllerForMainTabVarView: controllerForMainTabVarView,
//               ),
//               Expanded(
//                 child: TabBarView(
//                   controller: controllerForMainTabVarView,
//                   children: [
//                     LectureView(
//                       text: videoLesson.content ?? '',
//                       isLoading: isLoading,
//                     ),
//                     Chat(),
//                     News(),
//                     Reyting(),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         // Positioned WTabBar at the absolute top
//         // Positioned(
//         //   top: 0,
//         //   left: 0,
//         //   right: 0,
//         //   height: 56,
//         //   child: WTabBar(
//         //     tabsList: lessonTabs,
//         //     background: AppColors.white,
//         //     controllerForMainTabVarView: controllerForMainTabVarView,
//         //   ),
//         // ),
//         // ],
//         // ),
//       ),
//     );
//   }
// }

// class LectureView extends StatelessWidget {
//   String text = ''; // Text to display
//   bool isLoading;

//   LectureView({Key? key, required this.isLoading, required this.text})
//     : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: ElevatedButton(
//         onPressed: () {
//           // Start test logic
//         },
//         child: Text('Start Test', style: TextStyle(color: AppColors.black)),
//       ),
//       // bottomNavigationBar: BottomAppBar(
//       //   child: ElevatedButton(
//       //     onPressed: () {
//       //       // Start test logic
//       //     },
//       //     child: Text('Start Test'),
//       //   ),
//       // ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(vertical: 14),
//         child: Text(
//           text + 'apple',
//           style: const TextStyle(
//             fontSize: 14, // Font size of the text
//           ),
//         ),
//       ),
//     );
//   }
// }
