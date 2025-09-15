import 'package:ilmnur_app/core/model/menu_model.dart';

class SideMenuData {
  final menu = const <MenuModel>[
    MenuModel(icon: "assets/svg/sidebar/lessons.svg", title: 'Lessons'),
    MenuModel(icon: "assets/svg/sidebar/reyting.svg", title: 'Reyting'),
    MenuModel(icon: "assets/svg/sidebar/chat.svg", title: 'Chat'),
    MenuModel(icon: "assets/svg/sidebar/news.svg", title: 'News'),
    MenuModel(icon: "assets/svg/sidebar/settings.svg", title: 'Settings'),
    // MenuModel(icon: Icons.logout, title: 'SignOut'),
  ];
}
