import 'package:flutter/material.dart';

class CustomSnackbar {
  static void show(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.info),
            SizedBox(width: 10),
            Text(
              message,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.blue, // Customize background color
        behavior: SnackBarBehavior.floating, // Customize behavior
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Customize border radius
        ),
      ),
    );
  }
}
