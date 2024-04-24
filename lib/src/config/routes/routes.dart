import 'package:flutter/material.dart';
import 'package:youapp_coding_test/src/config/routes/route_names.dart';
import 'package:youapp_coding_test/src/features/auth/login/screens/login_screen.dart';
import 'package:youapp_coding_test/src/features/auth/register/screens/register_screen.dart';
import 'package:youapp_coding_test/src/features/about/screens/about_screen.dart';

import '../../features/home/home_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 190),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset(0.0, 0.0);
        const curve = Curves.linear;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        switch (settings.name) {
          case RouteNames.login:
            return LoginScreen();
          case RouteNames.register:
            return RegisterScreen();
          case RouteNames.about:
            return AboutScreen();
          case RouteNames.about:
          case RouteNames.interest:
          case RouteNames.home:
            return HomeScreen();
          default:
            return const Scaffold(
              body: Center(
                child: Text("No Page Found, Please Try Again!"),
              ),
            );
        }
      },
    );
  }
}
