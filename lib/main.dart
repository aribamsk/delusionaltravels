import 'dart:async';

import 'package:flutter/material.dart';

import 'destinations.dart';
import 'login.dart';
import 'signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash', // Start with splash screen
      routes: {
        '/splash': (context) => SplashScreen(), // Splash Screen route
        '/': (context) => MainNavigation(), // Main navigation route
        '/login': (context) => LoginPage(), // Route for login page
        '/signup': (context) => SignUpPage(), // Route for sign-up page
      },
    );
  }
}

// Splash Screen class
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller and animation
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();

    // Navigate to the MainNavigation after a delay
    Timer(Duration(seconds: 2), () {
      Navigator.of(context)
          .pushReplacementNamed('/'); // Navigate to MainNavigation
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Image.asset(
            'assets/splash.jpeg', // Make sure the image exists at this path
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}

// Main Navigation with Bottom Navigation Bar
// class MainNavigation extends StatefulWidget {
//   @override
//   _MainNavigationState createState() => _MainNavigationState();
// }

// class _MainNavigationState extends State<MainNavigation> {
//   int _selectedIndex = 0;
//
//   // List of pages to display in the bottom navigation
//   final List<Widget> _pages = [
//     StartPage(),
//     destinationpage(), // Home Page for destinations
//     ExplorePage(), // Explore/Bookings Page
//      // Accounts/Main Page
//   ];
//
//   // Handle the navigation between pages
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedIndex], // Display the selected page
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.explore),
//             label: 'Explore',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.account_circle),
//             label: 'Account',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.blue, // Set the color for selected item
//         onTap: _onItemTapped, // Handle item tap
//       ),
//     );
//   }
// }

// Start Page class (after splash screen)
class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/1.webp'), // Your background image
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 70), // Space from the top
                Padding(
                  padding: EdgeInsets.all(20),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/logo.jpeg", // Path to logo image
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    "Let's Escape",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                // Sign-Up Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, '/signup'); // Navigate to Sign Up
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    foregroundColor: Colors.white,
                    minimumSize: Size(370, 50),
                  ),
                  child: Text('Sign Up'),
                ),
                SizedBox(height: 40),
                // Login Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login'); // Navigate to Login
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    foregroundColor: Colors.white,
                    minimumSize: Size(370, 50),
                  ),
                  child: Text("Log In"),
                ),
                SizedBox(height: 70),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
