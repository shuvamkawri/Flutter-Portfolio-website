import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Black background
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Center(
        child: Text(
          '© 2024 Shuvam Kawri. All Rights Reserved.',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black, // White text
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
