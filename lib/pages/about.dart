import 'package:flutter/material.dart';

import 'contact.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    // Delay the appearance of text to trigger animation
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About  Me',
          style: TextStyle(color: Colors.white), // Title text color
        ),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white, // Back button icon color
        ),
      ),

      body: SingleChildScrollView(  // Add SingleChildScrollView to prevent overflow
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purpleAccent, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image with Border and Shadow
              Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/shuvam_profile_portfolio.jpg'),
                  backgroundColor: Colors.transparent,
                ),
              ),
              SizedBox(height: 20),
              // Animated Name Text
              AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0,
                duration: Duration(seconds: 1),
                child: Text(
                  'Hi, I am Shuvam',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Animated Description Text with styling adjustments to avoid overflow
              AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0,
                duration: Duration(seconds: 1),
                child: Text(
                  'I am a passionate Flutter Developer, and I love building beautiful and responsive applications. '
                      'With experience in both mobile and web development, I create seamless experiences for users.',
                  style: TextStyle(fontSize: 25, color: Colors.white70), // Reduced font size to avoid overflow
                  softWrap: true, // Ensure text wraps within the available space
                ),
              ),
              SizedBox(height: 30),
              // Animated Skills Section Header
              AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0,
                duration: Duration(seconds: 1),
                child: Text(
                  'Skills:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              SizedBox(height: 10),
              // Skills List with Animation
              _buildSkill('• Flutter & Dart'),
              _buildSkill('• Firebase'),
              _buildSkill('• REST APIs'),
              _buildSkill('• UI/UX Design'),
              _buildSkill('• Push Notification'),
              _buildSkill('• Local Notification'),
              _buildSkill('• Video call'),
              _buildSkill('• Chat'),
              _buildSkill('• Payment Gateway'),
              SizedBox(height: 20),
              // Animated Contact Button
              AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0,
                duration: Duration(seconds: 1),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the ContactPage when the button is clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactPage()), // Push the ContactPage
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    child: Text(
                      'Contact Me',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method for animating skills list
  Widget _buildSkill(String skill) {
    return AnimatedOpacity(
      opacity: _isVisible ? 1.0 : 0.0,
      duration: Duration(seconds: 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Text(
          skill,
          style: TextStyle(fontSize: 18, color: Colors.white70),
        ),
      ),
    );
  }
}
