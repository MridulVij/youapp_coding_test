import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youapp_coding_test/src/common/common_text.dart';
import 'package:youapp_coding_test/src/config/themes/color_pallet.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CommonButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 0.050.sh,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: ColorPallet.lgbb2,
                blurRadius: 10,
                offset: Offset(0, 8),
              )
            ],
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
              colors: [ColorPallet.lgbb1, ColorPallet.lgbb2],
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
            )),
        child: Center(
          child: CommonText(
            text: text,
            fontWeight: FontWeight.w700,
            fontSize: 35.sp,
            color: ColorPallet.commonColor,
          ),
        ),
      ),
    );
  }
}
