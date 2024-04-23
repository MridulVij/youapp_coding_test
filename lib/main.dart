import 'package:flutter/material.dart';

import 'src/features/auth/login/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YouApp Coding Test App',
      home: LoginScreen(),
    );
  }
}
