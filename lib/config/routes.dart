import 'package:flutter/material.dart';
import 'package:teko_flutter/view/home/home_page.dart';

class AppRoute {
  static const String home = '/home';

  static Map<String, Widget Function(BuildContext)> generateRoute() =>
      {AppRoute.home: (context) => const HomePage()};

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.home:
        return MaterialPageRoute(
            builder: (context) => const HomePage(), settings: settings);
      default:
        return null;
    }
  }
}
