import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'src/features/auth/login/screens/login_screen.dart';

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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'YouApp Coding Test App',
        home: LoginScreen(),
      ),
    );
  }
}
