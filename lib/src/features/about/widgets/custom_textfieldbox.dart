import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/themes/color_pallet.dart';

class CustomTextFieldBox extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const CustomTextFieldBox(
      {super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 0.520.sw,
      decoration: BoxDecoration(
          color: ColorPallet.commonColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 1, color: ColorPallet.commonColor.withOpacity(0.3))),
      child: Center(
        child: TextFormField(
          controller: controller,
          style: const TextStyle(color: ColorPallet.commonColor),
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            hintStyle:
                TextStyle(color: ColorPallet.commonColor.withOpacity(0.3)),
            contentPadding: EdgeInsets.symmetric(
              vertical: 0.014.sh,
              horizontal: 0.04.sw,
            ),
          ),
        ),
      ),
    );
  }
}
