import 'package:flirtii/screens/account/edit/edit_screen.dart';
import 'package:flirtii/screens/chats/chat_by_id/chat_by_id_screen.dart';
import 'package:flirtii/screens/get_start/get_start_screen.dart';
import 'package:flirtii/screens/home/home_screens.dart';
import 'package:flirtii/screens/profile/profile_screen.dart';
import 'package:flirtii/screens/match/match_screen.dart';
import 'package:flirtii/screens/notifications/notifications_screen.dart';
import 'package:flirtii/screens/sign_in/sign_in_screen.dart';
import 'package:flirtii/screens/sign_up/sign_up_screen.dart';
import 'package:get/route_manager.dart';

class RouteProps {
  final String name;
  final GetPage<dynamic> route;

  RouteProps({required this.name, required this.route});
}

class Routes {
  static List<RouteProps> pages = [
    RouteProps(
        name: "Home",
        route: GetPage(name: "/home", page: () => HomeScreen(), title: "Home")),
    RouteProps(
        name: "SignIn",
        route: GetPage(name: "/sign_in", page: () => SignInScreen())),
    RouteProps(
        name: "SignUp",
        route: GetPage(name: "/sign_up", page: () => SignUpScreen())),
    RouteProps(
        name: "GetStart",
        route: GetPage(name: "/get_start", page: () => GetStartScreen())),
    RouteProps(
        name: "Match",
        route: GetPage(name: "/match", page: () => MatchScreen())),
    RouteProps(
        name: "Notifications",
        route:
            GetPage(name: "/notifications", page: () => NotificationScreen())),
    RouteProps(
        name: "ChatById",
        route: GetPage(name: "/chat/:id", page: () => ChatByIdScreen())),
    RouteProps(
        name: "Profile",
        route: GetPage(name: "/profile/:id", page: () => ProfileScreen())),
    RouteProps(
        name: "EditAccount",
        route: GetPage(name: "/edit_account", page: () => EditAccountScreen())),
  ];

  List<GetPage<dynamic>> getPages = pages.map((e) => e.route).toList();

  String getInitialPage() {
    final token = "abc";
    if (token == "") {
      return pages.firstWhere((element) => element.name == "SignIn").route.name;
    }

    return pages.firstWhere((element) => element.name == "Home").route.name;
  }
}
