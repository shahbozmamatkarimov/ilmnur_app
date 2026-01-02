import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilmnur_app/core/resources/app_colors.dart';
import 'package:ilmnur_app/core/widgets/w_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ilmnur_app/features/lesson/presentation/widgets/HtmlContent.dart';
import 'package:ilmnur_app/features/tests/data/data_sources/test_service.dart';
import 'package:ilmnur_app/features/tests/data/models/answer.dart';
import 'package:ilmnur_app/features/tests/data/models/selectoption.dart';
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
  int? selectedOption;
  bool _initialized = false;
  bool isFinished = false;
  List<Tests>? tests;
  List<SelectedOption> selectedOptions = [];
  late int lesson_id;
  late int user_id;
  final List<List<String>> testLabels = [
    ["timer", ""],
    ["pencil", ""],
    ["calculator", ""],
    ["periodic", ""],
  ];

  final PageController _pageController = PageController();
  int currentIndex = 0;

  void setSelectedOption(bool isTrue) {
    setState(() {
      if (currentIndex < 0) return; // index tekshirish

      // selectedOptions ni kerak bo'lsa kengaytirish
      while (selectedOptions.length <= currentIndex) {
        selectedOptions.add(SelectedOption(id: null, isTrue: null));
      }

      // Tanlangan variantni currentIndex ga saqlaymiz
      selectedOptions[currentIndex] = SelectedOption(
        id: selectedOption,
        isTrue: isTrue,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TestsBloc(
        id: widget.testId,
        testsRepo: ImplTestsRepo(testsService: TestsService.create()),
      ),
      child: Scaffold(
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
        body: BlocBuilder<TestsBloc, TestsState>(
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
              lesson_id = state.tests.lesson_id;
              user_id = state.tests.user_id;
              tests = state.tests.test;
              if (!_initialized) {
                selectedOptions = List<SelectedOption>.filled(
                  tests!.length,
                  SelectedOption(id: null, isTrue: null),
                );
                _initialized = true;
              }
              // Questions list
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const RewardedAdButton(),
                  Row(
                    spacing: 10,
                    children: [
                      WButton(
                        text: "",
                        verticalPadding: 0,
                        horizontalPadding: 0,
                        onTap: () => context.router.pop(),
                        child: SvgPicture.asset("assets/svg/icon/close.svg"),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (int i = 0; i < (tests?.length ?? 0); i++)
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 8,
                                  ), // spacing
                                  child: WButton(
                                    text: "",
                                    verticalPadding: 0,
                                    horizontalPadding:
                                        selectedOptions[i].id != null
                                        ? 0
                                        : 11.5,
                                    borderRadius: 30,
                                    onTap: () {
                                      _pageController.animateToPage(
                                        i,
                                        duration: const Duration(
                                          milliseconds: 300,
                                        ),
                                        curve: Curves.easeInOut,
                                      );
                                    },
                                    color: i == currentIndex
                                        ? AppColors.mainColor
                                        : AppColors.c_ee,
                                    child: selectedOptions[i].id != null
                                        ? SvgPicture.asset(
                                            tests?[i].true_answer[0] ==
                                                    selectedOptions[i].id
                                                ? "assets/svg/test/true.svg"
                                                : "assets/svg/test/false.svg",
                                            width: 22,
                                          )
                                        : null,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: tests?.length,
                      onPageChanged: (index) {
                        setState(() {
                          selectedOption = null;
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
                                  top: 20,
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
                                    color: selectedOption == i
                                        ? AppColors.mainColor
                                        : AppColors.c_a1,
                                    buttonType: ButtonType.outline,
                                    verticalPadding: 2,
                                    horizontalPadding: 12,
                                    borderRadius: 10,
                                    onTap: () {
                                      setState(() {
                                        selectedOption = i;
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: selectedOption == i
                                                  ? AppColors.mainColor
                                                  : AppColors.c_ed,
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
                                            style: const TextStyle(height: 0.9),
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
            } else if (state is LoadedAnswerData) {
              // return Text("${state.ball}");
              return Container(
                height: double.infinity,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // isTrue
                    // ? "assets/svg/test/true.svg"
                    // : "assets/svg/test/false.svg",
                    SvgPicture.asset(
                      state.ball[0] > 70
                          ? "assets/svg/test/true.svg"
                          : "assets/svg/test/false.svg",
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      state.ball[0] > 70
                          ? "Siz muvaffaqiyatli yakunladingiz!"
                          : "Afsuski test mufaqqiyatsiz bo'ldi!",
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      state.ball[0] > 70
                          ? "Sinov tugallandi"
                          : "Yetarli ball to'play olmadingiz. Hechqisi yo'q qayta topshirib ko'ring",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/svg/test/accuracy.svg",
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  "Aniqlik",
                                  style: TextStyle(
                                    color: AppColors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "${state.ball[0]}%",
                              style: TextStyle(
                                color: AppColors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 24),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset("assets/svg/test/ball.svg"),
                                const SizedBox(width: 8),
                                const Text(
                                  "Ball",
                                  style: TextStyle(
                                    color: AppColors.mainColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "${state.ball[1]}",
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return const Text("Something went wrong!");
            }
          },
        ),
        bottomNavigationBar: BottomAppBar(
          color: AppColors.transparent,
          height: 112,
          child: Builder(
            builder: (context) {
              return Container(
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
                        children: [
                          SvgPicture.asset("assets/svg/test/help.svg"),
                        ],
                      ),
                    ),
                    selectedOptions
                                .where(
                                  (SelectedOption? item) => item?.id != null,
                                )
                                .toList()
                                .length ==
                            tests?.length
                        ? (isFinished == true
                              ? WButton(
                                  text: 'Davom etish',
                                  color: AppColors.mainColor,
                                  textColor: AppColors.mainColor,
                                  buttonType: ButtonType.outline,
                                  borderRadius: 25,
                                  verticalPadding: 13,
                                  horizontalPadding: 50,
                                  onTap: () {
                                    context.router.pop();
                                  },
                                )
                              : WButton(
                                  text: 'Yakunlash',
                                  color: AppColors.mainColor,
                                  textColor: AppColors.mainColor,
                                  buttonType: ButtonType.outline,
                                  borderRadius: 25,
                                  verticalPadding: 13,
                                  horizontalPadding: 50,
                                  onTap: () {
                                    // await TestsService.checkAnswers()
                                    context.read<TestsBloc>().add(
                                      checkAnswers(
                                        body: AnswerReponse(
                                          lesson_id: lesson_id,
                                          user_id: user_id,
                                          answers: selectedOptions,
                                        ),
                                      ),
                                    );
                                    setState(() {
                                      isFinished = true;
                                    });
                                  },
                                ))
                        : WButton(
                            text: 'Tekshirish',
                            color: AppColors.mainColor,
                            textColor: AppColors.white,
                            borderRadius: 25,
                            verticalPadding: 13,
                            horizontalPadding: 50,
                            onTap: () {
                              if (selectedOption == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Iltimos, javobni tanlang"),
                                  ),
                                );
                                return;
                              }
                              final bool isTrue =
                                  tests?[currentIndex].true_answer[0] ==
                                  selectedOption;
                              setSelectedOption(isTrue);

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
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  isTrue
                                                      ? "assets/svg/test/true.svg"
                                                      : "assets/svg/test/false.svg",
                                                ),
                                                const SizedBox(width: 12),
                                                Text(
                                                  isTrue
                                                      ? "Javob to‘g‘ri!"
                                                      : "Noto‘g‘ri javob!",
                                                  style: TextStyle(
                                                    color: isTrue
                                                        ? AppColors.green
                                                        : AppColors.red,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SvgPicture.asset(
                                              "assets/svg/test/help.svg",
                                            ),
                                          ],
                                        ),
                                        isTrue
                                            ? const Text("")
                                            : Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(height: 32),
                                                  const Text(
                                                    "To'g'ri javob",
                                                    style: TextStyle(
                                                      // fontSize: 18,
                                                      color: AppColors.red,
                                                      // fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  HtmlContent(
                                                    htmlContent:
                                                        tests![currentIndex]
                                                            .variants[tests![currentIndex]
                                                            .true_answer[0]],
                                                  ),
                                                ],
                                              ),
                                        const SizedBox(height: 32),
                                        SizedBox(
                                          width: double.infinity,
                                          child: WButton(
                                            text: 'Keyingi',
                                            color: isTrue
                                                ? AppColors.mainColor
                                                : AppColors.red,
                                            textColor: AppColors.white,
                                            borderRadius: 25,
                                            verticalPadding: 13,
                                            horizontalPadding: 50,
                                            onTap: () => {
                                              Navigator.pop(context),
                                              _pageController.animateToPage(
                                                currentIndex + 1, // 4-savol
                                                duration: const Duration(
                                                  milliseconds: 300,
                                                ),
                                                curve: Curves.easeInOut,
                                              ),
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
