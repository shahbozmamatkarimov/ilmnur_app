import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilmnur_app/core/resources/app_colors.dart';
import 'package:ilmnur_app/core/util/responsive.dart';
import 'package:ilmnur_app/core/widgets/w_button.dart';
import 'package:ilmnur_app/core/widgets/w_tabbar.dart';
// import 'package:ilmnur_app/features/course/presentation/pages/chat.dart';
// import 'package:ilmnur_app/features/course/presentation/pages/news.dart';
// import 'package:ilmnur_app/features/course/presentation/pages/reyting.dart';
import 'package:ilmnur_app/features/home/data/data_sources/category/category_service.dart';
import 'package:ilmnur_app/features/home/data/data_sources/group/group_service.dart';
import 'package:ilmnur_app/features/home/data/repositories/impl_category_repo.dart';
import 'package:ilmnur_app/features/home/data/repositories/impl_group_repo.dart';
import 'package:ilmnur_app/features/home/presentation/bloc/category/category_bloc.dart';
import 'package:ilmnur_app/features/home/presentation/bloc/group/group_bloc.dart';
import 'package:ilmnur_app/features/home/presentation/pages/home_page.dart';
import 'package:shimmer/shimmer.dart';

@RoutePage()
class GroupsScreen extends StatefulWidget {
  const GroupsScreen({super.key});

  @override
  GroupsScreenState createState() => GroupsScreenState();
}

class GroupsScreenState extends State<GroupsScreen>
    with SingleTickerProviderStateMixin {
  late final TabController controllerForMainTabVarView = TabController(
    length: 3,
    vsync: this,
    initialIndex: 0,
  );

  final List<String> categoryTabs = ["Guruhlar", "Kurslar", "Mentorlar"];

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: isDesktop ? AppColors.white : null,
        ),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => GroupBloc(
                groupRepo: ImplGroupRepo(groupService: GroupService.create()),
              ),
            ),
            BlocProvider(
              create: (context) => CategoryBloc(
                categoryRepo: ImplCategoryRepo(
                  categoryService: CategoryService.create(),
                ),
              ),
            ),
          ],
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: BlocBuilder<CategoryBloc, CategoryState>(
                      builder: (context, state) {
                        if (state is Loading) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Wrap(
                              spacing: 8,
                              children: [
                                for (var _ in [1, 2, 3, 4, 5, 6, 7, 8, 9])
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey.withOpacity(0.3),
                                    highlightColor: Colors.grey.withOpacity(
                                      0.1,
                                    ),
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
                        } else if (state is LoadedCategoryData) {
                          final category = state.category;
                          return Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(right: 12),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Wrap(
                                spacing: 8,
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
                                  for (dynamic i in category)
                                    WButton(
                                      text: i.title,
                                      fontSize: 12,
                                      borderRadius: 20,
                                      verticalPadding: 5,
                                      horizontalPadding: 12,
                                      color: AppColors.mainColor,
                                      textColor: AppColors.mainColor,
                                      buttonType: ButtonType.outline,
                                      onTap: () => {},
                                    ),
                                ],
                              ),
                            ),
                          );
                        } else if (state is ErrorLoadingCategoryData) {
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
                  Row(
                    children: [
                      WButton(
                        text: "More",
                        fontSize: 12,
                        borderRadius: 20,
                        verticalPadding: 8,
                        horizontalPadding: 12,
                        color: AppColors.mainColor,
                        textColor: AppColors.white,
                        onTap: () => {},
                      ),
                      const SizedBox(width: 12),
                      WButton(
                        text: "",
                        borderRadius: 20,
                        verticalPadding: 8,
                        horizontalPadding: 12,
                        color: AppColors.mainColor,
                        textColor: AppColors.white,
                        child: SvgPicture.asset("assets/svg/nav/filter.svg"),
                        onTap: () => {},
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              WTabBar(
                tabsList: categoryTabs,
                controllerForMainTabVarView: controllerForMainTabVarView,
              ),
              Expanded(
                child: TabBarView(
                  controller: controllerForMainTabVarView,
                  children: const [HomePage(), HomePage(), HomePage()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
