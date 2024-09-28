import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:teko_flutter/resources/colors.dart';
import 'package:teko_flutter/resources/resources.dart';
import 'package:teko_flutter/shared/widget/primary_button.dart';

class PickImageButton extends StatefulWidget {
  final Function(String? uri)? getUri;

  const PickImageButton({super.key, this.getUri});

  @override
  State<PickImageButton> createState() => _PickImageButtonState();
}

class _PickImageButtonState extends State<PickImageButton> {
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pickImage,
      child: _imageFile == null
          ? PrimaryButton(
              backgroundColor: AppColor.black01,
              prefixIcon: SvgPicture.asset(Assets.icUpload),
              title: 'Chọn tệp tin (tối đa 5MB)')
          : Image.file(_imageFile!,
              width: MediaQuery.of(context).size.width * 0.5),
    );
  }

  pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
        if (widget.getUri != null) widget.getUri!(_imageFile?.path);
      });
    }
  }
}
