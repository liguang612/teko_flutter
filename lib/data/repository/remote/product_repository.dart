import 'package:teko_flutter/domain/api/base_response.dart';
import 'package:teko_flutter/domain/model/product_page/product_page_response.dart';

abstract class ProductRepository {
  Future<ResponseWrapper<ProductPageResponse>> getProductPage();
}
