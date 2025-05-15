import 'package:flutter/material.dart';
import 'package:share_the_meal_app/cardprofile.dart';
import 'package:share_the_meal_app/bottomnavbar/upload.dart';

import 'package:share_the_meal_app/home.dart';
import 'package:share_the_meal_app/bottomnavbar/recycle.dart';
import 'package:share_the_meal_app/register.dart';
import 'package:share_the_meal_app/sidebar/aboutus.dart';
import 'package:share_the_meal_app/sidebar/donation.dart';
import 'package:share_the_meal_app/signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: SigninScreen(),
      routes: {
        '/home': (context) => const Home(),
        '/sign-in': (context) => SigninScreen(),
        '/register': (context) => const RegisterScreen(),
        '/recycle': (context) => RecycleFormScreen(),
        '/upload': (context) => const UploadFormScreen(),
        '/cardprofile': (context) => Cardprofile()
      },
    );
  }
}
