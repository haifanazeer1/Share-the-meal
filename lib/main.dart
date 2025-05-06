import 'package:flutter/material.dart';
import 'package:share_the_meal_app/home.dart';
import 'package:share_the_meal_app/recycle.dart';
import 'package:share_the_meal_app/register.dart';
import 'package:share_the_meal_app/signin.dart';
import 'package:share_the_meal_app/upload.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo -1',
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: {
        '/home': (context) => Home(),
        '/sign-in': (context) => SigninScreen(),
        '/register': (context) => RegisterScreen(),
        '/recycle': (context) => RecycleFormScreen(),
        '/upload': (context) => UploadFormScreen(),
      },
    );
  }
}
