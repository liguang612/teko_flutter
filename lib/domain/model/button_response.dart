import 'package:teko_flutter/domain/model/custom_attributes.dart';

class Button {
  String? type;
  CustomAttributes? customAttributes;

  Button({this.type, this.customAttributes});

  Button.fromJson(Map<String, dynamic> json) {
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
