import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilmnur_app/core/resources/app_colors.dart';
import 'package:ilmnur_app/core/widgets/w_button.dart';

class TestPage extends StatelessWidget {
  final Function backPage; // Required parameter

  // Constructor with required item
  TestPage({
    Key? key,
    required this.backPage, // Use required to ensure it's passed
  }) : super(key: key);

  final List<List<String>> testLabels = [
    ["timer", ""],
    ["pencil", ""],
    ["calculator", ""],
    ["periodic", ""],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        leading: Text(""),
        leadingWidth: 0,
        actions: [],
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
      body: Scaffold(
        backgroundColor: AppColors.white,
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
                    children: [
                      SvgPicture.asset("assets/svg/test/help.svg"),
                      const SizedBox(width: 10),
                      Container(
                        constraints: const BoxConstraints(maxWidth: 112),
                        child: const Text(
                          "Muammo haqida xabar bering",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.c_65,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset("assets/svg/test/false.svg", height: 48),
                    const SizedBox(width: 10),
                    const Text(
                      "Noto'g'ri javob",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.c_ff5,
                      ),
                    ),
                  ],
                ),
                WButton(
                  text: 'Keyingisi',
                  color: AppColors.mainColor,
                  textColor: AppColors.white,
                  borderRadius: 25,
                  verticalPadding: 13,
                  horizontalPadding: 50,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(32),
            // height: MediaQuery.of(context).size.height,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(6),
            //   color: AppColors.white,
            // ),
            // clipBehavior: Clip.hardEdge,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   margin: EdgeInsets.only(left: -20),
                //   child: SvgPicture.asset("assets/svg/icon/backroute.svg"),
                // ),
                Wrap(
                  runSpacing: 10,
                  spacing: 10,
                  children: [
                    WButton(
                      text: "",
                      verticalPadding: 0,
                      horizontalPadding: 0,
                      onTap: () => backPage(),
                      child: SvgPicture.asset("assets/svg/icon/close.svg"),
                    ),
                    for (int _ in [1, 2, 3, 4, 5, 6])
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.c_ee,
                        ),
                      ),
                  ],
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.c_cc, width: 1.0),
                    ),
                  ),
                  padding: const EdgeInsets.only(bottom: 30, top: 50),
                  child: const Text(
                    "Quyidagi  izotopda nechta proton, elektron va neytron bor?",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 30),
                for (int _ in [1, 2, 3, 4, 5, 6])
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: WButton(
                      text: "",
                      color: AppColors.c_a1,
                      buttonType: ButtonType.outline,
                      verticalPadding: 10,
                      horizontalPadding: 12,
                      borderRadius: 10,
                      onTap: () => {},
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.c_ed),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 7,
                              vertical: 5,
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              "A",
                              style: TextStyle(height: 0.9),
                            ),
                          ),
                          const SizedBox(width: 32),
                          const Text("5 proton, 4 elektron, 2 neytron"),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
