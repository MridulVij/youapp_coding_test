import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youapp_coding_test/src/common/common_scaffold_background.dart';
import 'package:youapp_coding_test/src/common/common_text.dart';
import 'package:youapp_coding_test/src/config/themes/color_pallet.dart';
import '../../../../common/common_appbar.dart';
import '../../../../common/common_button.dart';
import '../../../../common/common_textfield.dart';
import '../widgets/golden_gradient.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  bool isButtonVisible = true;

  final email = TextEditingController();
  final password = TextEditingController();
  final username = TextEditingController();

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
                text: 'Register',
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 0.02.sh,
            ),
            CommonTextField(
              hintText: 'Enter Email',
              controller: email,
            ),
            SizedBox(
              height: 0.02.sh,
            ),
            CommonTextField(
              hintText: 'Create Username',
              controller: username,
            ),
            SizedBox(
              height: 0.02.sh,
            ),
            CommonTextField(
              isObscureButton: true,
              hintText: 'Create Password',
              controller: password,
            ),
            SizedBox(
              height: 0.02.sh,
            ),
            CommonTextField(
              isObscureButton: true,
              hintText: 'Confirm Password',
              controller: password,
            ),
            SizedBox(
              height: 0.03.sh,
            ),
            CommonButton(
              onTap: () {},
              text: 'Register',
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
                    text: 'Have an account? ',
                  ),
                  GoldenGradient(
                    child: CommonText(
                      textDecoration: TextDecoration.underline,
                      color: ColorPallet.lgg4,
                      decorationColor: ColorPallet.lgg4,
                      text: 'Login here',
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
