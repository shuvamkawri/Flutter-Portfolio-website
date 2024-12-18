import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  final String email = 'shuvam5kawri@gmail.com';
  final String phone = '9608775136';

  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunch(emailUri.toString())) {
      await launch(emailUri.toString());
    } else {
      throw 'Could not launch $emailUri';
    }
  }

  Future<void> _launchPhone() async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: phone,
    );
    if (await canLaunch(phoneUri.toString())) {
      await launch(phoneUri.toString());
    } else {
      throw 'Could not launch $phoneUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Me',
          style: TextStyle(color: Colors.white), // Title text color
        ),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white, // Back button icon color
        ),
      ),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purpleAccent, Colors.blueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Title with animation
            AnimatedOpacity(
              opacity: 1.0,
              duration: Duration(seconds: 1),
              child: Text(
                'Get in Touch!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),

            // Subheading with animation
            AnimatedOpacity(
              opacity: 1.0,
              duration: Duration(seconds: 1),
              child: Text(
                'Feel free to contact me via email or phone.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
            ),
            SizedBox(height: 30),

            // Email Section with animation
            _buildContactCard(
              icon: Icons.email,
              text: email,
              onTap: _launchEmail,
            ),
            SizedBox(height: 20),

            // Phone Section with animation
            _buildContactCard(
              icon: Icons.phone,
              text: phone,
              onTap: _launchPhone,
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build contact cards
  Widget _buildContactCard({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: Duration(seconds: 1),
      child: Card(
        elevation: 8,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          contentPadding: EdgeInsets.all(16),
          leading: Icon(
            icon,
            size: 32,
            color: Colors.deepPurpleAccent,
          ),
          title: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.deepPurpleAccent,
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
