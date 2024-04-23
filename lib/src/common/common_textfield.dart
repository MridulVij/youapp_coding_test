import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youapp_coding_test/src/config/themes/color_pallet.dart';

import '../features/auth/register/widgets/golden_gradient.dart';

class CommonTextField extends StatefulWidget {
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final double? contentPaddingVertical;
  final double? contentPaddinghorizontal;
  final TextEditingController? controller;
  final bool? isObscureButton;
  const CommonTextField({
    super.key,
    this.controller,
    this.suffixIcon,
    this.isObscureButton,
    this.obscureText = false,
    this.contentPaddingVertical,
    this.contentPaddinghorizontal,
    required this.hintText,
  });

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool isButtonVisible = false;

  void isButtonVisibleButton() {
    setState(() {
      isButtonVisible = !isButtonVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.06.sh,
      decoration: BoxDecoration(
          color: ColorPallet.commonColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          SizedBox(
            width: 0.79.sw,
            child: Center(
              child: TextFormField(
                cursorColor: ColorPallet.commonColor,
                controller: widget.controller,
                obscureText: isButtonVisible,
                obscuringCharacter: '*',
                style: const TextStyle(color: ColorPallet.commonColor),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 0.015.sh,
                    color: ColorPallet.commonColor.withOpacity(0.2),
                  ),
                  // suffixIcon: widget.suffixIcon,
                  contentPadding: EdgeInsets.symmetric(
                    // vertical: contentPaddingVertical ?? 0.01.sh,
                    horizontal: widget.contentPaddinghorizontal ?? 0.04.sw,
                  ),
                  // suffix: isObscureButton == true
                  // ? InkWell(
                  //     onTap: () {},
                  //     child: ShaderMask(
                  //       shaderCallback: (Rect bounds) {
                  //         return const LinearGradient(
                  //           colors: [
                  //             ColorPallet.lgg1,
                  //             ColorPallet.lgg2,
                  //             ColorPallet.lgg3,
                  //             ColorPallet.lgg4,
                  //             ColorPallet.lgg5,
                  //             ColorPallet.lgg6,
                  //             ColorPallet.lgg7,
                  //           ],
                  //           begin: Alignment.topLeft,
                  //           end: Alignment.bottomRight,
                  //         ).createShader(bounds);
                  //       },
                  //       child: Icon(
                  //         Icons.remove_red_eye_outlined,
                  //         color: ColorPallet.lgg3,
                  //       ),
                  //     ),
                  //   )
                  //     : null,
                ),
              ),
            ),
          ),

          //
          (widget.isObscureButton == true)
              ? IconButton(
                  onPressed: () {
                    isButtonVisibleButton();
                  },
                  icon: GoldenGradient(
                    child: Icon(
                      isButtonVisible == true
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: ColorPallet.lgg4,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
