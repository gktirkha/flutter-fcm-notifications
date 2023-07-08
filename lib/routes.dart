import 'package:flutter/material.dart';

import 'home.dart';
import 'screen1.dart';
import 'screen2.dart';
import 'screen3.dart';
import 'screen4.dart';
import 'splash.dart';

abstract class RouteNames {
  static const String home = '/home';
  static const String splashScreen = '/splashScreen';
  static const String screen1 = '/screen1';
  static const String screen2 = '/screen2';
  static const String screen3 = '/screen3';
  static const String screen4 = '/screen4';
}

abstract class GenerateRoute {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<ScaffoldMessengerState> scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final String? routeName = settings.name;

    MaterialPageRoute route;
    switch (routeName) {
      case RouteNames.home:
        route = MaterialPageRoute(builder: (context) => const Home());
        break;

      case RouteNames.splashScreen:
        route = MaterialPageRoute(builder: (context) => const SplashScreen());
        break;

      case RouteNames.screen1:
        route = MaterialPageRoute(builder: (context) => const Screen1());
        break;

      case RouteNames.screen2:
        route = MaterialPageRoute(builder: (context) => const Screen2());
        break;

      case RouteNames.screen3:
        route = MaterialPageRoute(builder: (context) => const Screen3());
        break;

      case RouteNames.screen4:
        route = MaterialPageRoute(builder: (context) => const Screen4());
        break;

      default:
        route = MaterialPageRoute(builder: (context) => const Home());
        break;
    }

    return route;
  }
}
