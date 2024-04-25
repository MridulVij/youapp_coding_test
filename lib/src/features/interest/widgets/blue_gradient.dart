import 'package:flutter/material.dart';
import 'package:youapp_coding_test/src/config/themes/color_pallet.dart';

class BlueGradient extends StatelessWidget {
  final Widget child;
  const BlueGradient({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [
            ColorPallet.lgbb1,
            ColorPallet.lgbb2,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds);
      },
      child: child,
    );
  }
}
