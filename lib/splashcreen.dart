import 'dart:async';
import 'package:flutter/material.dart';
import 'package:share_the_meal_app/signin.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to HomeScreen after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SigninScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Share The Meal',
        ),
      ),
      backgroundColor: Colors.green, // or any color you like
      body: Center(
        child: Image.asset(
          'assets/shareameallogo.jpg',
          width: 200,
          height: 300,
        ), // your logo
      ),
    );
  }
}
