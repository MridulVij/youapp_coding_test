import 'package:flutter/material.dart';
import 'package:youapp_coding_test/src/common/common_text.dart';
import 'package:youapp_coding_test/src/config/themes/color_pallet.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('tapped!');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.arrow_back_ios_rounded,
            color: ColorPallet.commonColor,
          ),
          CommonText(
            text: 'Back',
            fontSize: 14,
            fontWeight: FontWeight.w700,
          )
        ],
      ),
    );
  }
}
