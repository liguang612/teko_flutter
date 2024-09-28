import 'package:flutter/material.dart';
import 'package:teko_flutter/resources/colors.dart';
import 'package:teko_flutter/resources/themes.dart';

class PrimaryTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool isRequired;
  final TextInputType inputType;
  final Function(String)? onSubmitted;
  final Widget? suffixIcon;
  final String? title;

  const PrimaryTextfield(
      {super.key,
      this.isRequired = false,
      this.title,
      required this.controller,
      this.inputType = TextInputType.text,
      this.hintText,
      this.suffixIcon,
      this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (title != null)
        Row(children: [
          if (isRequired)
            Text("* ",
                style:
                    AppTextTheme.bodyRegular16.copyWith(color: AppColor.red)),
          Text('${title}', style: AppTextTheme.bodyRegular16)
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
              hintText: hintText,
              hintStyle: AppTextTheme.hintStyle,
              isDense: true,
              suffixIcon: suffixIcon),
          keyboardType: inputType,
          onSubmitted: (value) =>
              onSubmitted == null ? null : onSubmitted!(value)),
      const SizedBox(height: 8)
    ]);
  }
}
