import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SizedBox(height: 10),

          SizedBox(height: 20),
          // Navigation Links
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _navLink(context, "Home", '/'),
              _navLink(context, "About", '/about'),
              _navLink(context, "Projects", '/projects'),
              _navLink(context, "Contact", '/contact'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _navLink(BuildContext context, String text, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}
