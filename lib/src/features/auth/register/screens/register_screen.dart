import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youapp_coding_test/src/common/common_scaffold_background.dart';
import 'package:youapp_coding_test/src/common/common_text.dart';
import 'package:youapp_coding_test/src/config/routes/route_names.dart';
import 'package:youapp_coding_test/src/config/themes/color_pallet.dart';
import 'package:youapp_coding_test/src/features/auth/register/bloc/register_bloc.dart';
import '../../../../common/common_appbar.dart';
import '../../../../common/common_button.dart';
import '../../../../common/common_textfield.dart';
import '../../../../config/utils/snackbar.dart';
import '../widgets/golden_gradient.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  bool isButtonVisible = true;

  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  final username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final registerBloc = BlocProvider.of<RegisterBloc>(context);
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
              controller: confirmPassword,
            ),
            SizedBox(
              height: 0.03.sh,
            ),
            BlocConsumer<RegisterBloc, RegisterState>(
              builder: (context, state) {
                // TODO: implement listener
                if (state is RegisterLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: ColorPallet.lgbb2,
                    ),
                  );
                }

                if (state is RegisterSuccessState) {
                  print('Api Fetched Successfullly!');
                  Navigator.pushReplacementNamed(context, RouteNames.login);
                }

                return CommonButton(
                  onTap: () {
                    registerBloc.add(
                      RegisterButtonClickedEvent(
                          email: email.text,
                          password: confirmPassword.text,
                          username: username.text),
                    );
                  },
                  text: 'Register',
                );
              },
              listener: (context, state) {
                if (state is RegisterSuccessState) {
                  CustomSnackbar.show(
                      context, 'Welcome, Registered Successfully!');
                }
                if (state is RegisterFailureState) {
                  print('Api Fetching is Failed');
                  CustomSnackbar.show(
                      context, 'Failed to Register, Please Try Again!');
                }
              },
            ),
            SizedBox(
              height: 0.1.sh,
            ),
            InkWell(
              onTap: () {
                print('tapped');
                Navigator.pushNamed(context, RouteNames.login);
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
