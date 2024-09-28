import 'package:teko_flutter/domain/model/product_page/custom_attributes_response.dart';
import 'package:teko_flutter/domain/model/product_page/product_page_response.dart';

class ButtonResponse extends Data {
  String? type;
  CustomAttributesResponse? customAttributes;

  ButtonResponse({this.type, this.customAttributes});

  ButtonResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    customAttributes = json['customAttributes'] != null
        ? new CustomAttributesResponse.fromJson(json['customAttributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.customAttributes != null) {
      data['customAttributes'] = this.customAttributes!.toJson();
    }
    return data;
  }
}
