import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youapp_coding_test/src/config/themes/color_pallet.dart';

import '../config/utils/assets/svg_assets.dart';

class CommonScaffoldBackground extends StatefulWidget {
  final Widget child;
  const CommonScaffoldBackground({super.key, required this.child});

  @override
  State<CommonScaffoldBackground> createState() =>
      _CommonScaffoldBackgroundState();
}

class _CommonScaffoldBackgroundState extends State<CommonScaffoldBackground> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: widget,
        ),
        SvgPicture.asset(
          SvgAssets.commonBackgroundImage,
          height: double.maxFinite,
          width: double.maxFinite,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
