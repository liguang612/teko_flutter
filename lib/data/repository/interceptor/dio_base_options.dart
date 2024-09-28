import 'package:dio/dio.dart';

class DioBaseOptions {
  late BaseOptions baseOption;

  DioBaseOptions({required String baseUrl}) {
    baseOption = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(seconds: 20),
      sendTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
      followRedirects: true,
      validateStatus: (status) {
        return status! <= 400;
      },
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      },
    );
  }
}
