import 'package:flutter/material.dart';

import '../../../../config/themes/color_pallet.dart';

class GoldenGradient extends StatelessWidget {
  final Widget child;
  const GoldenGradient({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [
            ColorPallet.lgg1,
            ColorPallet.lgg2,
            ColorPallet.lgg3,
            ColorPallet.lgg4,
            ColorPallet.lgg5,
            ColorPallet.lgg6,
            ColorPallet.lgg7,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds);
      },
      child: child,
    );
  }
}
