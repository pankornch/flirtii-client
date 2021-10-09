import 'package:flirtii/screens/discover/discover_screen.dart';
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
        name: "Discover",
        route: GetPage(
            name: "/discover", page: () => DiscoverScreen(), title: "Home")),
    RouteProps(
        name: "SignIn",
        route: GetPage(name: "/sign_in", page: () => SignInScreen())),
    RouteProps(
        name: "SignUp",
        route: GetPage(name: "/sign_up", page: () => SignUpScreen())),
  ];

  List<GetPage<dynamic>> getPages = pages.map((e) => e.route).toList();

  String getInitialPage() {
    final token = "";
    if (token == "") {
      return pages.firstWhere((element) => element.name == "SignIn").route.name;
    }

    return pages.firstWhere((element) => element.name == "Discover").route.name;
  }
}
