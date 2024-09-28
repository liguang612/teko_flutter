import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static const String appName = 'MyApp';
  static const String packageName = 'com.example.myapp';
}

class EndPoints {
  static const String getProductPage = "/api/products/management";
}

class Environment {
  static String domain = dotenv.env['DOMAIN'] ?? '';
}
