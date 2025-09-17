import 'package:flutter/material.dart';
import 'package:ilmnur_app/core/resources/app_colors.dart';
import 'package:ilmnur_app/core/widgets/w_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ilmnur_app/features/tests/presentation/pages/create_test.dart';
import 'package:ilmnur_app/features/tests/presentation/pages/test.dart';

@RoutePage()
class TestsScreen extends StatefulWidget {
  final int testId;
  const TestsScreen({required this.testId});

  @override
  State<TestsScreen> createState() => _TestsScreenState();
}

/// Main example page
class _TestsScreenState extends State<TestsScreen> {
  String currentPage = "page";

  backPage() {
    setState(() {
      currentPage = 'page';
    });
  }

  @override
  build(context) => Scaffold(
    backgroundColor: AppColors.backgroundColor,
    body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        // child: BlocProvider(
        //   create: (context) => TestsBloc(
        //     id: widget.testId,
        //     testsRepo: ImplTestsRepo(
        //       testsService: TestsService.create(),
        //     ),
        //   ),
        //   child: BlocBuilder<TestsBloc, TestsState>(
        //     builder: (context, state) {
        //       if (state is Loading) {
        //         return ClipRect(
        //           child: Wrap(
        //             spacing: 12.0,
        //             runSpacing: 12.0,
        //             alignment: WrapAlignment.spaceEvenly,
        //             children: [
        //               for (var _ in [1, 2, 3, 4, 5, 6, 7, 8, 9])
        //                 Shimmer.fromColors(
        //                   baseColor: Colors.grey.withOpacity(
        //                       0.3), // Background color of the skeleton
        //                   highlightColor: Colors.grey.withOpacity(
        //                       0.1), // Highlight color of the skeleton
        //                   child: Container(
        //                     height: 34,
        //                     width: 100,
        //                     decoration: BoxDecoration(
        //                       color: Colors.grey[300],
        //                       borderRadius: BorderRadius.circular(17),
        //                     ),
        //                   ),
        //                 ),
        //             ],
        //           ),
        //         );
        //       } else if (state is LoadedTestsData) {
        // final tests = state.tests;
        // initializeTests(tests);
        child: currentPage == 'page'
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WButton(
                    text: "Test qo'shish",
                    verticalPadding: 13,
                    horizontalPadding: 40,
                    color: AppColors.mainColor,
                    textColor: AppColors.white,
                    borderRadius: 40,
                    onTap: () => setState(() {
                      currentPage = 'create';
                    }),
                  ),
                  const SizedBox(height: 20),
                  WButton(
                    text: "Testlarni ko’rish",
                    verticalPadding: 13,
                    horizontalPadding: 40,
                    color: AppColors.mainColor,
                    textColor: AppColors.white,
                    borderRadius: 40,
                    onTap: () => {},
                  ),
                  const SizedBox(height: 20),
                  WButton(
                    text: "Foydalanuvchi sifatida kirish",
                    verticalPadding: 13,
                    horizontalPadding: 40,
                    color: AppColors.mainColor,
                    textColor: AppColors.white,
                    borderRadius: 40,
                    onTap: () => setState(() {
                      currentPage = 'test';
                    }),
                  ),
                  const SizedBox(height: 20),
                  WButton(
                    text: "Orqaga qaytish",
                    verticalPadding: 13,
                    horizontalPadding: 40,
                    color: AppColors.c_e5,
                    textColor: AppColors.c_af,
                    borderRadius: 40,
                    onTap: () => {},
                  ),
                ],
              )
            : currentPage == 'test'
            ? TestPage(backPage: backPage)
            : currentPage == 'create'
            ? CreateTestPage(backPage: backPage)
            : const Text(""),
      ),
    ),
  );
  //             } else if (state is ErrorLoadingTestsData) {
  //               return Center(
  //                 child: Text(
  //                     'Error loading community data: ${state.errorMessage}'),
  //               );
  //             } else {
  //               return Container();
  //             }
  //           },
  //         ),
  //       ),
  //     ),
  //   ),
  // );
}
