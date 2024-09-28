import 'package:teko_flutter/domain/model/product_page/button_response.dart';
import 'package:teko_flutter/domain/model/product_page/custom_attributes_response.dart';
import 'package:teko_flutter/domain/model/product_page/product_list_response.dart';
import 'package:teko_flutter/domain/model/product_page/product_submit_form_reponse.dart';
import 'package:teko_flutter/domain/model/product_page/title_label_response.dart';

class ProductPageResponse {
  String? code;
  String? message;
  List<Data>? data;

  ProductPageResponse({this.code, this.message, this.data});

  ProductPageResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        // data!.add(new Data.fromJson(v));

        switch (v['type']) {
          case 'Label':
            data!.add(TitleLabelResponse.fromJson(v));
            break;
          case 'ProductSubmitForm':
            data!.add(ProductSubmitFormResponse.fromJson(v));
            break;
          case 'Button':
            data!.add(ButtonResponse.fromJson(v));
            break;
          case 'ProductList':
            data!.add(ProductListResponse.fromJson(v));
            break;
          default:
        }
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

abstract class Data {
  String? type;
  CustomAttributesResponse? customAttributes;

  Data({this.type, this.customAttributes});

  Data.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}
