import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Shaped Button'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                text: 'Sign up',
                color: Colors.orange,
                onPressed: () {
                  // Sign up action
                },
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Sign in',
                color: Colors.white,
                onPressed: () {
                  // Sign in action
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  CustomButton(
      {required this.text, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomShapeClipper(),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0), // Remove default rounding
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: color == Colors.white ? Colors.black : Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double radius = 30.0;

    // Starting point
    path.moveTo(0, 0);

    // Top straight line
    path.lineTo(size.width - radius, 0);

    // Top-right rounded corner
    path.quadraticBezierTo(size.width, 0, size.width, radius);

    // Right straight line
    path.lineTo(size.width, size.height - radius);

    // Bottom-right rounded corner
    path.quadraticBezierTo(
        size.width, size.height, size.width - radius, size.height);

    // Bottom straight line
    path.lineTo(0, size.height);

    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
