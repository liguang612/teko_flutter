import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:teko_flutter/config/config.dart';
import 'package:teko_flutter/data/mapper/product_page_mapper.dart';
import 'package:teko_flutter/data/repository/interceptor/dio_base_options.dart';
import 'package:teko_flutter/data/repository/remote/product_repository.dart';
import 'package:teko_flutter/di/di.dart';
import 'package:teko_flutter/domain/api/base_response.dart';
import 'package:teko_flutter/domain/entity/product_page/custom_attributes.dart';
import 'package:teko_flutter/domain/entity/product_page/product_page.dart';
import 'package:teko_flutter/domain/model/product_page/product_page_response.dart';

class ProductRepositoryImpl implements ProductRepository {
  final Dio dio = getIt.get();

  ProductRepositoryImpl() {
    dio.interceptors.add(PrettyDioLogger(
        responseBody: true, requestBody: true, requestHeader: true));
    dio.options = DioBaseOptions(baseUrl: Environment.domain).baseOption;
  }

  late final ProductPageMapper _productPageMapper = getIt.get();

  @override
  Future<ResponseWrapper<ProductPage>> getProductPage() async {
    try {
      final response = await dio.get(EndPoints.getProductPage);

      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: _productPageMapper
                .mapToEntity(ProductPageResponse.fromJson(response.data)));
      }

      return ResponseWrapper.error(
          message: response.statusMessage, statusCode: response.statusCode);
    } catch (e) {
      return ResponseWrapper.error(message: '$e');
    }
  }

  @override
  Future<ResponseWrapper<Items>> createProduct(Items item) async {
    try {
      if (item.name?.isEmpty == true) {
        return ResponseWrapper.error(
            statusCode: 40000, message: "Tên sản phẩm không được trống");
      }
      if (item.price == null) {
        return ResponseWrapper.error(
            statusCode: 40000, message: "Giá sản phảma không được trống");
      }

      // Use post API to send creation request to server
      // ...

      // ... but I don't have one so, I suppose everything will be OK.
      return ResponseWrapper.success(data: item);
    } catch (e) {
      return ResponseWrapper.error(message: '$e');
    }
  }
}
