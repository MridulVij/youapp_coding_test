import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youapp_coding_test/src/common/common_scaffold_background.dart';
import 'package:youapp_coding_test/src/common/common_text.dart';
import 'package:youapp_coding_test/src/config/utils/assets/svg_assets.dart';

import '../../../../common/common_appbar.dart';
import '../../../../common/common_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CommonScaffoldBackground(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CommonAppBar(),
          SizedBox(
            height: 0.1.sh,
          ),
          Padding(
            padding: EdgeInsets.only(left: 0.06.sw),
            child: CommonText(
              text: 'Login',
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          CommonTextField(
            hintText: 'Enter Username/Email',
          )
        ],
      ),
    ));
  }
}
