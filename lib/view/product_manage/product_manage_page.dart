import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teko_flutter/resources/colors.dart';
import 'package:teko_flutter/resources/resources.dart';
import 'package:teko_flutter/resources/themes.dart';
import 'package:teko_flutter/shared/widget/primary_button.dart';
import 'package:teko_flutter/shared/widget/primary_textfield.dart';

class ProductManagePage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  ProductManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColor.backgroundColor,
            centerTitle: true,
            title: Text("Quản lý sản phẩm", style: AppTextTheme.titleBold26)),
        backgroundColor: AppColor.backgroundColor,
        body: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  PrimaryTextfield(
                      controller: nameController,
                      isRequired: true,
                      title: 'Tên sản phẩm'),
                  const SizedBox(height: 8),
                  PrimaryTextfield(
                      controller: priceController,
                      isRequired: true,
                      title: 'Giá sản phẩm'),
                  const SizedBox(height: 8),
                  Text('Ảnh sản phẩm', style: AppTextTheme.bodyRegular16),
                  PrimaryButton(
                      backgroundColor: AppColor.black01,
                      prefixIcon: SvgPicture.asset(Assets.icUpload),
                      title: 'Ảnh sản phẩm'),
                  const SizedBox(height: 12),
                  Center(
                      child: PrimaryButton(
                          backgroundColor: AppColor.blue,
                          foregroundColor: AppColor.white,
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          title: 'Tạo sản phẩm')),
                  Expanded(child: Container(color: Colors.amber))
                ])));
  }
}
