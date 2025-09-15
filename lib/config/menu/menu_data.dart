import 'package:easy_localization/easy_localization.dart';

class MenuData {
  final String text;
  final bool isActive;

  const MenuData({
    required this.text,
    this.isActive = true,
  });
}

abstract class MainMenu {
  static final lessons = MenuData(text: "lessons".tr());
  static final reyting = MenuData(text: "reyting".tr());
  static final chat = MenuData(text: "chat".tr());
  static final news = MenuData(text: "news".tr());
  static final settings = MenuData(text: "settings".tr());
}

// abstract class CommunityMenu {
//   static final dashboard = MenuData(text: "Dashboard".tr());
//   static final payouts = MenuData(text: "Payouts".tr());
//   static final invite = MenuData(text: "Invite".tr());
//   static final general = MenuData(text: "General".tr());
//   static final subscriptions = MenuData(text: "Subscriptions".tr());
//   static final categories = MenuData(text: "Categories".tr());
//   static final plugins = MenuData(text: "Plugins".tr());
//   static final metrics = MenuData(text: "Metrics".tr());
//   static final gamification = MenuData(text: "Gamification".tr());
//   static final discovery = MenuData(text: "Discovery".tr());
//   static final links = MenuData(text: "Links".tr());
//   static final billing = MenuData(text: "Billing & referrals".tr());
// }