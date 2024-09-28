import 'dart:io';

import 'package:flutter/material.dart';
import 'package:teko_flutter/domain/entity/product_page/custom_attributes.dart';
import 'package:teko_flutter/resources/themes.dart';
import 'package:teko_flutter/shared/utils/string_utils.dart';

class ProductItem extends StatelessWidget {
  final Items items;

  const ProductItem({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          items.imageSrc != null
              ? Expanded(
                  child: Center(
                      child: items.imageSrc?.startsWith("file") == null
                          ? Container()
                          : items.imageSrc!.startsWith("file")
                              ? Image.file(File(items.imageSrc!))
                              : Image.network(items.imageSrc!)))
              : Expanded(child: Text('No imgae found')),
          const SizedBox(height: 4),
          Text('${items.name}', style: AppTextTheme.bodyBold18),
          Text('${StringUtils.numberToCurrency(items.price ?? 0)}',
              style: AppTextTheme.bodyRegular16)
        ]);
  }
}
