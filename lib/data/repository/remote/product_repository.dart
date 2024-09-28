import 'package:teko_flutter/domain/api/base_response.dart';
import 'package:teko_flutter/domain/entity/product_page/product_page.dart';

abstract class ProductRepository {
  Future<ResponseWrapper<ProductPage>> getProductPage();
}
