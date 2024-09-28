import 'package:flutter/material.dart';
import 'package:teko_flutter/resources/themes.dart';

class PrimaryButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Function()? onPressed;
  final EdgeInsets? padding;
  final Widget? prefixIcon;
  final String title;

  const PrimaryButton(
      {super.key,
      this.backgroundColor,
      this.foregroundColor,
      this.onPressed,
      this.prefixIcon,
      required this.title,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              disabledBackgroundColor: backgroundColor,
              padding: padding ?? EdgeInsets.symmetric(horizontal: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6))),
          onPressed: onPressed,
          child: Row(children: [
            if (prefixIcon != null) prefixIcon!,
            if (prefixIcon != null) SizedBox(width: 4),
            Text(title,
                style:
                    AppTextTheme.bodyRegular18.copyWith(color: foregroundColor))
          ])),
    );
  }
}
