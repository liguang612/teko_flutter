import 'package:teko_flutter/domain/entity/product_page/custom_attributes.dart';
import 'package:teko_flutter/domain/entity/product_page/product_page.dart';

class TitleLabel extends Data {
  String? type;
  CustomAttributes? customAttributes;

  TitleLabel({this.type, this.customAttributes});
}
