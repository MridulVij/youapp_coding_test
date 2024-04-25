import 'package:flutter/material.dart';
import '../config/themes/color_pallet.dart';
import 'common_text.dart';

class CommonAppBar extends StatelessWidget {
  final IconData? leftIcon;
  final Widget? rightIcon;
  final String? title;
  final IconData? nextRightButton;
  final IconData? previousLeftButton;
  final VoidCallback? leftIconClick;
  final VoidCallback? rightIconClick;
  final VoidCallback? previousLeftIconClick;
  final VoidCallback? nextRightIconClick;
  final Color? iconColor;

  const CommonAppBar({
    super.key,
    this.leftIcon,
    this.rightIcon,
    this.title,
    this.nextRightButton,
    this.previousLeftButton,
    this.leftIconClick,
    this.rightIconClick,
    this.previousLeftIconClick,
    this.nextRightIconClick,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
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
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // IconButton(
            //   onPressed: previousLeftIconClick,
            //   icon: Icon(
            //     previousLeftButton,
            //     color: iconColor,
            //   ),
            // ),
            CommonText(
              text: title ?? '',
              color: ColorPallet.commonColor,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            // IconButton(
            //   onPressed: nextRightIconClick,
            //   icon: Icon(
            //     nextRightButton,
            //     color: iconColor,
            //   ),
            // ),
          ],
        ),
        rightIcon != null
            ? IconButton(
                onPressed: rightIconClick,
                icon: rightIcon!,
              )
            : const SizedBox()
      ],
    );
  }
}
