import 'package:teko_flutter/domain/entity/product_page/custom_attributes.dart';
import 'package:teko_flutter/domain/entity/product_page/product_page.dart';

class ProductSubmitForm extends Data {
  String? type;
  CustomAttributes? customAttributes;

  ProductSubmitForm({this.type, this.customAttributes});
}
