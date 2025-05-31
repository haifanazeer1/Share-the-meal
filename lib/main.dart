import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:share_the_meal_app/gmaps/googlemaps.dart';
import 'package:share_the_meal_app/signin.dart';
import 'package:share_the_meal_app/firebase_options.dart';

import 'package:share_the_meal_app/cardprofile.dart';
import 'package:share_the_meal_app/bottomnavbar/upload.dart';

import 'package:share_the_meal_app/home.dart';
import 'package:share_the_meal_app/bottomnavbar/recycle.dart';
import 'package:share_the_meal_app/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        '/register': (context) => RegisterScreen(),
        '/recycle': (context) => RecycleFormScreen(),
        '/upload': (context) => const UploadFormScreen(),
        '/maps': (context) => const MapScreen(),
        '/cardprofile': (context) => Cardprofile()
      },
    );
  }
}
