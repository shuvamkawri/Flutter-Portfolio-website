import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart'; // Add this package in pubspec.yaml
import 'package:my_portfolio/pages/projects.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2), // Duration for the animation
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_circle, size: 28, color: Colors.white),
            SizedBox(width: 8),
            Text(
              "Welcome to My Portfolio",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.white,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 4,
        backgroundColor: Colors.deepOrangeAccent,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Header(),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Left Side: Image with modern shadow
                  Container(
                    width: 450,
                    height: 450,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/shuvam.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 15,
                          offset: Offset(6, 6),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 30),
                  // Right Side: Description Text with smoother animation
                  Expanded(
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'I am a Flutter developer who specializes in building beautiful, high-performance mobile and web applications. Explore my projects and get in touch!',
                              textStyle: TextStyle(
                                fontSize: 60,
                                color: Colors.white,
                                height: 1.6,
                              ),
                              speed: Duration(milliseconds: 80),
                            ),
                          ],
                          isRepeatingAnimation: false,
                          totalRepeatCount: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            // Call to action button with modern gradient
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GestureDetector(
                onTap: () {
                  // Navigate to the ProjectsPage when the text is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProjectsPage()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blueAccent, Colors.purpleAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.6),
                        blurRadius: 15,
                        offset: Offset(4, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 28),
                    child: Text(
                      'View My Projects',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 120),
            Footer(),
          ],
        ),
      ),
    );
  }
}
