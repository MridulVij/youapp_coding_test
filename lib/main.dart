import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youapp_coding_test/src/features/auth/login/bloc/login_bloc.dart';
import 'package:youapp_coding_test/src/features/auth/register/bloc/register_bloc.dart';

import 'src/features/auth/login/screens/login_screen.dart';
import 'src/features/auth/register/screens/register_screen.dart';
import 'src/features/profile/screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ScreenUtilInit(
      designSize: Size(size.height, size.width),
      child: MultiBlocProvider(
          providers: [
            BlocProvider<LoginBloc>(
              create: (context) => LoginBloc(),
            ),
            BlocProvider<RegisterBloc>(
              create: (context) => RegisterBloc(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'YouApp Coding Test App',
            home: ProfileScreen(),
          )),
    );
  }
}
