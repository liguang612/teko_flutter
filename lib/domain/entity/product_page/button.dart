import 'package:teko_flutter/domain/entity/product_page/custom_attributes.dart';
import 'package:teko_flutter/domain/entity/product_page/product_page.dart';

class Button extends Data {
  String? type;
  CustomAttributes? customAttributes;

  Button({this.type, this.customAttributes});
}
