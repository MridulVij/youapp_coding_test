import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/themes/color_pallet.dart';

class CommonScaffoldBackground extends StatefulWidget {
  final Widget widget;
  const CommonScaffoldBackground({super.key, required this.widget});

  @override
  State<CommonScaffoldBackground> createState() =>
      _CommonScaffoldBackgroundState();
}

class _CommonScaffoldBackgroundState extends State<CommonScaffoldBackground> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            ColorPallet.lgb2,
            ColorPallet.lgb1,
            ColorPallet.lgb3,
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            top: 0.05.sh, left: 0.04.sw, right: 0.04.sw, bottom: 0.01.sh),
        child: widget.widget,
      ),
    );
    // Stack(
    //   children: <Widget>[
    //     Positioned.fill(
    //       child: Image.asset('assets/images/bgcolor.png'),
    //     ),
    //     widget
    //   ],
    // );
    //     Container(
    //   decoration: BoxDecoration(
    //     gradient: LinearGradient(
    //       begin: Alignment.topRight,
    //       end: Alignment.bottomRight,
    //       stops: [
    //         0.0,
    //         1.0,
    //         1.0,
    //       ],
    //       colors: [
    // ColorPallet.lgb2,
    // ColorPallet.lgb1,
    // ColorPallet.lgb3,
    //       ],
    //     ),
    //   ),
    // child: Padding(
    //   padding: EdgeInsets.only(
    //       top: 0.01.sh, bottom: 0.01.sh, left: 0.01.sw, right: 0.01.sw),
    //   child: widget,
    //   ),
    // );
  }
}
