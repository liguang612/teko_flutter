import 'package:teko_flutter/domain/model/custom_attributes.dart';

class ProductListResponse {
  String? type;
  CustomAttributes? customAttributes;

  ProductListResponse({this.type, this.customAttributes});

  ProductListResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    customAttributes = json['customAttributes'] != null
        ? new CustomAttributes.fromJson(json['customAttributes'])
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
