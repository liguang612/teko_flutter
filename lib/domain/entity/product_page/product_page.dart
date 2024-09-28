import 'package:teko_flutter/domain/entity/product_page/custom_attributes.dart';

class ProductPage {
  List<Data>? data;

  ProductPage({this.data});
}

abstract class Data {
  String? type;
  CustomAttributes? customAttributes;

  Data({this.type, this.customAttributes});
}
