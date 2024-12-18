import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/about.dart';
import 'pages/projects.dart';
import 'pages/contact.dart';

void main() {
  runApp(PortfolioWebsite());
}

class PortfolioWebsite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Portfolio',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/about': (context) => AboutPage(),
        '/projects': (context) => ProjectsPage(),
        '/contact': (context) => ContactPage(),
      },
    );
  }
}
