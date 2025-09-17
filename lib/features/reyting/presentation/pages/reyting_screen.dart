import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilmnur_app/core/util/responsive.dart';

@RoutePage()
class ReytingScreen extends StatelessWidget {
  // const ReytingScreen({Key? key}) : super(key: key);

  final List<String> reytingList = [
    "Barchasi",
    "Matematika",
    "Kimyo",
    "Biologiya",
    "Informatika",
    "Tarix",
  ];

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        // width: screenWidth - 487,
        // height: screenHeight - 150,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: const Color(0xFFFFFFFF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // SvgPicture.asset("assets/reyting/reyting.svg"),
            Container(
              padding: Responsive.isTablet(context)
                  ? const EdgeInsets.symmetric(horizontal: 94)
                  : null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/svg/reyting/reyting.png"),
                  const SizedBox(height: 8),
                  const Text(
                    "O'rganing. Tajriba orttiring. Raqobatlashing",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Darslar uchun imkon qadar ko'proq tajriba ball to'plash orqali haftalik reytingda yangi o'rinni egallashga harakat qiling",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 45),
                ],
              ),
            ),
            SizedBox(
              height: 40,
              child: Expanded(
                child: ListView.builder(
                  itemCount: reytingList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 40,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      margin: const EdgeInsets.only(right: 8),
                      // color: Colors.blue[(index % 9) * 100],
                      decoration: const BoxDecoration(
                        color: Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Text(reytingList[index].toString()),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                PopupMenuButton<String>(
                  icon: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color(0xFFF5F5F5),
                    ),
                    child: Row(
                      children: [
                        const Text('Reyting'),
                        const SizedBox(width: 24),
                        SvgPicture.asset("assets/svg/reyting/select_arrow.svg"),
                      ],
                    ),
                  ),
                  tooltip: '',
                  onSelected: (String value) {
                    print('Selected: $value');
                  },
                  offset: const Offset(10, 50),
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem<String>(
                        value: 'Option 1',
                        child: Text('Option 1'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Option 2',
                        child: Text('Option 2'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Option 3',
                        child: Text('Option 3'),
                      ),
                    ];
                  },
                ),
                const SizedBox(width: 8),
                PopupMenuButton<String>(
                  icon: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color(0xFFF5F5F5),
                    ),
                    child: Row(
                      children: [
                        const Text('Reyting'),
                        const SizedBox(width: 24),
                        SvgPicture.asset("assets/svg/reyting/select_arrow.svg"),
                      ],
                    ),
                  ),
                  tooltip: '',
                  onSelected: (String value) {
                    print('Selected: $value');
                  },
                  offset: const Offset(10, 50),
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem<String>(
                        value: 'Option 1',
                        child: Text('Option 1'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Option 2',
                        child: Text('Option 2'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Option 3',
                        child: Text('Option 3'),
                      ),
                    ];
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
