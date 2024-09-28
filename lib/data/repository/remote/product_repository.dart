import 'package:teko_flutter/domain/api/base_response.dart';
import 'package:teko_flutter/domain/entity/product_page/custom_attributes.dart';
import 'package:teko_flutter/domain/entity/product_page/product_page.dart';

abstract class ProductRepository {
  Future<ResponseWrapper<ProductPage>> getProductPage();

  Future<ResponseWrapper<Items>> createProduct(Items item);
}
