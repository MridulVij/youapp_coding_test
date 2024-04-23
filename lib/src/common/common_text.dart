import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youapp_coding_test/src/config/themes/color_pallet.dart';

// ignore: must_be_immutable
class CommonText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final Color decorationColor;
  final TextDecoration textDecoration;
  final int maxLine;
  final String fonts;
  List<TextSpan>? children;
  CommonText(
      {super.key,
      required this.text,
      this.color = ColorPallet.commonColor,
      this.fontSize = 14,
      this.maxLine = 10,
      this.decorationColor = ColorPallet.commonColor,
      this.textAlign = TextAlign.start,
      this.fontWeight = FontWeight.w400,
      this.fonts = "Inter",
      this.children,
      this.textDecoration = TextDecoration.none});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          text: text,
          style: TextStyle(
            fontFamily: fonts,
            decoration: textDecoration,
            decorationColor: decorationColor,
            fontSize: fontSize + 0.002.sh,
            color: color,
            fontWeight: fontWeight,
          ),
          children: children),
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLine,
    );
  }
}
