import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilmnur_app/core/resources/app_colors.dart';
import 'package:ilmnur_app/core/widgets/w_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ilmnur_app/features/lesson/presentation/widgets/HtmlContent.dart';
import 'package:ilmnur_app/features/tests/data/data_sources/test_service.dart';
import 'package:ilmnur_app/features/tests/data/models/test.dart';
import 'package:ilmnur_app/features/tests/data/repositories/impl_test_repo.dart';
import 'package:ilmnur_app/features/tests/presentation/bloc/group/test_bloc.dart';
import 'package:shimmer/shimmer.dart';

@RoutePage()
class TestsScreen extends StatefulWidget {
  final int testId;
  const TestsScreen({super.key, required this.testId});

  @override
  State<TestsScreen> createState() => _TestsScreenState();
}

/// Main example page
class _TestsScreenState extends State<TestsScreen> {
  final List<List<String>> testLabels = [
    ["timer", ""],
    ["pencil", ""],
    ["calculator", ""],
    ["periodic", ""],
  ];

  final PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        leading: const Text(""),
        leadingWidth: 0,
        actions: const [],
        title: SizedBox(
          width: double.infinity,
          child: Wrap(
            spacing: 12,
            alignment: WrapAlignment.center,
            children: [
              for (List<String> i in testLabels)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColors.c_e2,
                  ),
                  padding: const EdgeInsets.all(4),
                  child: SvgPicture.asset("assets/svg/test/${i[0]}.svg"),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.transparent,
        height: 112,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: AppColors.c_ed)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WButton(
                text: '',
                color: AppColors.transparent,
                verticalPadding: 0,
                horizontalPadding: 0,
                onTap: () {},
                child: Row(
                  children: [SvgPicture.asset("assets/svg/test/help.svg")],
                ),
              ),
              WButton(
                text: 'Keyingisi',
                color: AppColors.mainColor,
                textColor: AppColors.white,
                borderRadius: 25,
                verticalPadding: 13,
                horizontalPadding: 50,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) {
                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Natija",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16),
                            Text("Sizning javobingiz qabul qilindi"),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => TestsBloc(
          id: widget.testId,
          testsRepo: ImplTestsRepo(testsService: TestsService.create()),
        ),
        child: BlocBuilder<TestsBloc, TestsState>(
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
            } else if (state is LoadedTestsData) {
              final List<Tests>? tests = state.tests.test;
              // Questions list
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    runSpacing: 10,
                    spacing: 10,
                    children: [
                      WButton(
                        text: "",
                        verticalPadding: 0,
                        horizontalPadding: 0,
                        onTap: () => context.router.pop(),
                        child: SvgPicture.asset("assets/svg/icon/close.svg"),
                      ),
                      for (int i = 0; i < (tests?.length ?? 0); i++)
                        WButton(
                          text: "",
                          verticalPadding: 0,
                          horizontalPadding: 11.5,
                          borderRadius: 20,
                          onTap: () => {
                            _pageController.animateToPage(
                              i, // 4-savol
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            ),
                          },
                          color: i == currentIndex
                              ? AppColors.mainColor
                              : AppColors.c_ee,
                        ),
                    ],
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: tests?.length,
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        final q = tests?[index];

                        return SingleChildScrollView(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // SAVOL
                              Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: AppColors.c_cc,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                padding: const EdgeInsets.only(
                                  bottom: 30,
                                  top: 50,
                                ),
                                child: HtmlContent(
                                  htmlContent: q?.question ?? '',
                                  fontSize: FontSize(20),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 30),

                              // VARIANTLAR
                              ...List.generate(q?.variants.length ?? 0, (i) {
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 16),
                                  child: WButton(
                                    text: "",
                                    color: AppColors.c_a1,
                                    buttonType: ButtonType.outline,
                                    verticalPadding: 10,
                                    horizontalPadding: 12,
                                    borderRadius: 10,
                                    onTap: () {
                                      print("Selected option $i");
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: AppColors.c_ed,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 7,
                                            vertical: 5,
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            String.fromCharCode(
                                              65 + i,
                                            ), // A B C D
                                            style: TextStyle(height: 0.9),
                                          ),
                                        ),
                                        HtmlContent(
                                          htmlContent: q?.variants[i] ?? '',
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const Text("Something went wrong!");
            }
          },
        ),
      ),
    );
  }
}
