import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youapp_coding_test/src/common/common_scaffold_background.dart';
import 'package:youapp_coding_test/src/common/common_text.dart';
import 'package:youapp_coding_test/src/config/themes/color_pallet.dart';
import 'package:youapp_coding_test/src/config/assets/svg_assets.dart';
import 'package:youapp_coding_test/src/features/auth/login/bloc/login_event.dart';

import '../../../../common/common_appbar.dart';
import '../../../../common/common_button.dart';
import '../../../../common/common_textfield.dart';
import '../../../../config/utils/snackbar.dart';
import '../bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailUsername = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
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
          CommonTextField(
            hintText: 'Enter Username/Email',
            controller: emailUsername,
          ),
          SizedBox(
            height: 0.02.sh,
          ),
          CommonTextField(
            isObscureButton: true,
            hintText: 'Enter Password',
            controller: password,
          ),
          SizedBox(
            height: 0.03.sh,
          ),
          BlocConsumer<LoginBloc, LoginState>(
            builder: (context, state) {
              // TODO: implement listener
              if (state is LoginLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is LoginFailureState) {
                print('Api Fetching is Failed');
                // CustomSnackbar.show(context, 'Faied to Login, Plese Try Again');
              }
              if (state is LoginSuccessState) {
                print('Api Fetched Successfullly!');
                // CustomSnackbar.show(context, 'Faied to Login, Plese Try Again');
              }

              return CommonButton(
                onTap: () {
                  loginBloc.add(LoginButtonPressedEvent(
                      email: emailUsername.text,
                      password: password.text,
                      username: emailUsername.text));
                },
                text: 'Login',
              );
            },
            listener: (context, state) {
              if (state is LoginLoadingState) {
                Center(
                  child: CircularProgressIndicator(
                    backgroundColor: ColorPallet.lgbb2,
                  ),
                );
              }
            },
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
