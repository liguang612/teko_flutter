import 'package:teko_flutter/data/mapper/base_data_mapper.dart';
import 'package:teko_flutter/domain/entity/product_page/button.dart';
import 'package:teko_flutter/domain/entity/product_page/custom_attributes.dart'
    as entity;
import 'package:teko_flutter/domain/entity/product_page/product_list.dart';
import 'package:teko_flutter/domain/entity/product_page/product_page.dart';
import 'package:teko_flutter/domain/entity/product_page/product_submit_form.dart';
import 'package:teko_flutter/domain/entity/product_page/title_label.dart';
import 'package:teko_flutter/domain/model/product_page/custom_attributes_response.dart'
    as response;
import 'package:teko_flutter/domain/model/product_page/product_page_response.dart';

class ProductPageMapper
    extends BaseDataMapper<ProductPageResponse, ProductPage> {
  @override
  ProductPage mapToEntity(ProductPageResponse? data) {
    CustomAttributesMapper customAttributesMapper = CustomAttributesMapper();

    return ProductPage(
        data: data?.data?.map((e) {
      if (e.type == "Button") {
        return Button(
            type: e.type,
            customAttributes:
                customAttributesMapper.mapToEntity(e.customAttributes));
      } else if (e.type == "ProductList") {
        return ProductList(
            type: e.type,
            customAttributes:
                customAttributesMapper.mapToEntity(e.customAttributes));
      } else if (e.type == "ProductSubmitForm") {
        return ProductSubmitForm(
            type: e.type,
            customAttributes:
                customAttributesMapper.mapToEntity(e.customAttributes));
      } else
        return TitleLabel(
            type: e.type,
            customAttributes:
                customAttributesMapper.mapToEntity(e.customAttributes));
    }).toList());
  }
}

class CustomAttributesMapper extends BaseDataMapper<
    response.CustomAttributesResponse, entity.CustomAttributes> {
  @override
  entity.CustomAttributes mapToEntity(response.CustomAttributesResponse? data) {
    return entity.CustomAttributes(
        label: entity.Label(text: data?.label?.text),
        button: entity.Button(text: data?.button?.text),
        productlist: entity.Productlist(
            items: data?.productlist?.items
                ?.map((e) => entity.Items(
                    name: e.name, price: e.price, imageSrc: e.imageSrc))
                .toList()),
        form: data?.form
            ?.map((e) => entity.Form(
                label: e.label,
                required: e.required,
                name: e.name,
                type: e.type,
                maxLength: e.maxLength,
                minValue: e.minValue,
                maxValue: e.maxValue))
            .toList());
  }
}
