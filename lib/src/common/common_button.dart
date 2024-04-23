import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youapp_coding_test/src/common/common_text.dart';
import 'package:youapp_coding_test/src/config/themes/color_pallet.dart';

class CommonButton extends StatelessWidget {
  final String text;
  const CommonButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [ColorPallet.lgbb1, ColorPallet.lgbb2],
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
          )),
      child: Center(
        child: CommonText(
          text: text,
          fontWeight: FontWeight.w700,
          fontSize: 16.sp,
          color: ColorPallet.commonColor,
        ),
      ),
    );
  }
}
