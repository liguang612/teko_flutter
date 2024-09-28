import 'package:flutter/material.dart';
import 'package:teko_flutter/config/config.dart';
import 'package:teko_flutter/config/routes.dart';
import 'package:teko_flutter/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.home,
      onGenerateInitialRoutes: (initialRoute) =>
          [AppRoute.onGenerateRoute(RouteSettings(name: initialRoute))!],
      onGenerateRoute: (settings) => AppRoute.onGenerateRoute(settings),
      routes: AppRoute.generateRoute(),
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
      title: AppConfig.appName,
    );
  }
}
