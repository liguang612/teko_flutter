import 'package:flutter/material.dart';
import 'package:teko_flutter/resources/colors.dart';
import 'package:teko_flutter/resources/themes.dart';

class PrimaryTextfield extends StatelessWidget {
  final TextEditingController controller;
  final bool isRequired;
  final TextInputType inputType;
  final String title;

  const PrimaryTextfield(
      {super.key,
      this.isRequired = false,
      required this.title,
      required this.controller,
      this.inputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        if (isRequired)
          Text("* ",
              style: AppTextTheme.bodyRegular16.copyWith(color: AppColor.red)),
        Text(title, style: AppTextTheme.bodyRegular16)
      ]),
      const SizedBox(height: 2),
      TextField(
          controller: controller,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColor.black.withOpacity(0.2), width: 0.5)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.black, width: 1)),
              isDense: true),
          keyboardType: inputType),
      const SizedBox(height: 8)
    ]);
  }
}
