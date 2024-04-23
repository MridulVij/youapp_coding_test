import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youapp_coding_test/src/common/common_scaffold_background.dart';
import 'package:youapp_coding_test/src/common/common_text.dart';
import 'package:youapp_coding_test/src/config/themes/color_pallet.dart';
import 'package:youapp_coding_test/src/config/utils/assets/svg_assets.dart';

import '../../../../common/common_appbar.dart';
import '../../../../common/common_button.dart';
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
          SizedBox(
            height: 0.02.sh,
          ),
          const CommonTextField(
            hintText: 'Enter Username/Email',
          ),
          SizedBox(
            height: 0.02.sh,
          ),
          const CommonTextField(
            isObscureButton: true,
            hintText: 'Enter Password',
          ),
          SizedBox(
            height: 0.03.sh,
          ),
          CommonButton(
            onTap: () {},
            text: 'Login',
          ),
          SizedBox(
            height: 0.1.sh,
          ),
          InkWell(
            onTap: () {
              print('tapped');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonText(
                  text: 'No account? ',
                ),
                ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
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
                    child: CommonText(
                      textDecoration: TextDecoration.underline,
                      color: ColorPallet.lgg4,
                      decorationColor: ColorPallet.lgg4,
                      text: 'Register here',
                    ))
              ],
            ),
          )
        ],
      ),
    ));
  }
}
