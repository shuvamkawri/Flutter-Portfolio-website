import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';  // Import url_launcher to open URLs

class ProjectsPage extends StatelessWidget {
  final List<Map<String, String>> projects = [
    {
      'title': 'Flutter Portfolio Website',
      'description': 'A personal portfolio website showcasing projects and skills built using Flutter.',
      'link': 'https://github.com/shuvamkawri/Flutter-Portfolio-website',
    },
    {
      'title': 'Smart Health',
      'description': 'A health management app with user authentication, task management, and CRUD functionality.',
      'link': 'https://github.com/shuvamkawri/smart_health',
    },
    {
      'title': 'Smart Agriculture',
      'description': 'An agricultural e-commerce platform offering products for farmers with a payment gateway integration.',
      'link': 'https://github.com/e-commerce-app',
    },
    {
      'title': 'Smart Doctor',
      'description': 'An online doctor consultation platform with e-commerce features for healthcare products.',
      'link': 'https://github.com/e-commerce-app',
    },
    {
      'title': 'Smart Pathology',
      'description': 'An e-commerce app with pathology services and payment gateway for patients to book tests and services.',
      'link': 'https://github.com/e-commerce-app',
    },
    {
      'title': 'Smart Pharmacy',
      'description': 'A fully functional pharmacy e-commerce app where users can buy medicines and healthcare products online.',
      'link': 'https://github.com/e-commerce-app',
    },
    {
      'title': 'Smart Hospital',
      'description': 'A hospital management app that allows patients to book appointments, order prescriptions, and access medical records.',
      'link': 'https://github.com/e-commerce-app',
    },
  ];

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Projects',
          style: TextStyle(color: Colors.white), // Title text color
        ),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white, // Back button icon color
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: projects.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              shadowColor: Colors.black.withOpacity(0.2),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                title: Text(
                  projects[index]['title']!,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    projects[index]['description']!,
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.link,
                    color: Colors.deepPurpleAccent,
                  ),
                  onPressed: () {
                    _launchURL(projects[index]['link']!);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
