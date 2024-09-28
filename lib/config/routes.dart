import 'package:flutter/material.dart';
import 'package:teko_flutter/view/product_manage/product_manage_page.dart';

class AppRoute {
  static const String home = '/home';

  static Map<String, Widget Function(BuildContext)> generateRoute() =>
      {AppRoute.home: (context) => ProductManagePage()};

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.home:
        return MaterialPageRoute(
            builder: (context) => ProductManagePage(), settings: settings);
      default:
        return null;
    }
  }
}
