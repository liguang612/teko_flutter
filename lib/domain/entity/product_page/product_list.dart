import 'package:teko_flutter/domain/entity/product_page/custom_attributes.dart';
import 'package:teko_flutter/domain/entity/product_page/product_page.dart';

class ProductList extends Data {
  String? type;
  CustomAttributes? customAttributes;

  ProductList({this.type, this.customAttributes});
}
