import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilmnur_app/core/resources/app_colors.dart';
import 'package:ilmnur_app/core/util/responsive.dart';
import 'package:ilmnur_app/features/reyting/data/data_sources/reyting_service.dart';
import 'package:ilmnur_app/features/reyting/data/repositories/impl_reyting_repo.dart';
import 'package:ilmnur_app/features/reyting/presentation/bloc/reyting/reyting_bloc.dart';
import 'package:shimmer/shimmer.dart';

@RoutePage()
class ReytingScreen extends StatefulWidget {
  final int id;
  const ReytingScreen({super.key, required this.id});

  @override
  State<ReytingScreen> createState() => _ReytingScreenState();
}

class _ReytingScreenState extends State<ReytingScreen> {
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
    return BlocProvider(
      create: (_) => ReytingBloc(
        id: widget.id,
        reytingRepo: ImplReytingRepo(reytingService: ReytingService.create()),
      ),
      child: SingleChildScrollView(
        child: BlocBuilder<ReytingBloc, ReytingState>(
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
            } else if (state is LoadedReytingData) {
              return Container(
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
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
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
                    // SizedBox(
                    //   height: 40,
                    //   child: ListView.builder(
                    //     itemCount: reytingList.length,
                    //     scrollDirection: Axis.horizontal,
                    //     itemBuilder: (context, index) {
                    //       return Container(
                    //         height: 40,
                    //         alignment: Alignment.center,
                    //         padding: const EdgeInsets.symmetric(horizontal: 12),
                    //         margin: const EdgeInsets.only(right: 8),
                    //         // color: Colors.blue[(index % 9) * 100],
                    //         decoration: const BoxDecoration(
                    //           color: Color(0xFFF5F5F5),
                    //           borderRadius: BorderRadius.all(
                    //             Radius.circular(30),
                    //           ),
                    //         ),
                    //         child: Text(reytingList[index].toString()),
                    //       );
                    //     },
                    //   ),
                    // ),
                    // const SizedBox(height: 20),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Table(
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          columnWidths: const {
                            0: FixedColumnWidth(40),
                            1: FlexColumnWidth(),
                            2: IntrinsicColumnWidth(),
                          },
                          // border: TableBorder.symmetric(
                          //   inside: BorderSide(color: Colors.grey.shade300),
                          // ),
                          children: List.generate(state.reyting.length, (
                            index,
                          ) {
                            final item = state.reyting[index];

                            // === SPECIAL ROW (index == 10) ===
                            if (index == 10) {
                              return TableRow(
                                children: [
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/svg/reyting/top_arrow.png',
                                            width: 16,
                                          ),
                                          const SizedBox(width: 8),
                                          const Text(
                                            "Yuqori o'rinlar",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Image.asset(
                                            'assets/svg/reyting/top_arrow.png',
                                            width: 16,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(),
                                  const SizedBox(),
                                ],
                              );
                            }

                            // === NORMAL ROW ===
                            return TableRow(
                              children: [
                                // Index
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 8,
                                  ),
                                  child: Center(
                                    child: Text(
                                      (index < 11 ? index + 1 : index)
                                          .toString(),
                                    ),
                                  ),
                                ),

                                // Avatar + Name
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundColor: AppColors.mainColor,
                                        backgroundImage: item.image != null
                                            ? NetworkImage(item.image!)
                                            : null,
                                        child: item.image == null
                                            ? SvgPicture.asset(
                                                'assets/svg/bottomnav/profile.svg',
                                                width: 24,
                                                height: 24,
                                                color: AppColors.white,
                                              )
                                            : null,
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          '${item.name} ${item.surname}',
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Score
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 8,
                                  ),
                                  child: Text(
                                    '${item.totalReyting} ball',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
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
