import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonTextField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final double? contentPaddingVertical;
  final double? contentPaddinghorizontal;
  final TextEditingController? controller;
  const CommonTextField({
    super.key,
    this.controller,
    this.suffixIcon,
    this.obscureText = false,
    this.contentPaddingVertical,
    this.contentPaddinghorizontal,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontFamily: 'Inter', fontSize: 0.015.sh),
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(
          vertical: contentPaddingVertical ?? 0.018.sh,
          horizontal: contentPaddinghorizontal ?? 0.04.sw,
        ),
      ),
    );
  }
}
