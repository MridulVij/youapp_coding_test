import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:youapp_coding_test/src/config/themes/color_pallet.dart';
import '../../../common/common_text.dart';

class CustomChip extends StatelessWidget {
  final String chipLogo;
  final String chipTitle;
  const CustomChip(
      {super.key, required this.chipLogo, required this.chipTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: ColorPallet.backgroundColor.withOpacity(0.5)),
      height: 0.04.sh,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.h),
              child: Row(
                children: [
                  SvgPicture.asset(chipLogo),
                  SizedBox(
                    width: 0.02.sw,
                  ),
                  CommonText(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    text: chipTitle,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
