import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:teko_flutter/data/repository/remote/product_repository.dart';
import 'package:teko_flutter/di/di.dart';
import 'package:teko_flutter/domain/api/base_response.dart';
import 'package:teko_flutter/domain/model/product_page/product_page_response.dart';

class ProductRepositoryImpl implements ProductRepository {
  final Dio dio = getIt.get();

  ProductRepositoryImpl() {
    dio.interceptors.add(PrettyDioLogger(
        responseBody: true, requestBody: true, requestHeader: true));
    // dio.interceptors.add()
  }

  @override
  Future<ResponseWrapper<ProductPageResponse>> getProductPage() {
    // TODO: implement getProductPage
    throw UnimplementedError();
  }
}
