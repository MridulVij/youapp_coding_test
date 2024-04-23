import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youapp_coding_test/src/config/themes/color_pallet.dart';

class CommonTextField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final double? contentPaddingVertical;
  final double? contentPaddinghorizontal;
  final TextEditingController? controller;
  const CommonTextField({
    super.key,
    this.controller,
    this.suffixIcon,
    this.obscureText = false,
    this.contentPaddingVertical,
    this.contentPaddinghorizontal,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorPallet.commonColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.only(bottom: 0.009.sw),
      child: Center(
        child: TextFormField(
          cursorColor: ColorPallet.commonColor,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
                fontFamily: 'Inter',
                fontSize: 0.015.sh,
                color: ColorPallet.commonColor.withOpacity(0.2)),
            suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.symmetric(
              // vertical: contentPaddingVertical ?? 0.01.sh,
              horizontal: contentPaddinghorizontal ?? 0.04.sw,
            ),
          ),
        ),
      ),
    );
  }
}
