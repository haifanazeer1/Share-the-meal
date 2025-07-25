import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:share_the_meal_app/gmaps/googlemaps.dart';
import 'package:share_the_meal_app/sidebar/joinus.dart';
import 'package:share_the_meal_app/sidebar/profile.dart';
import 'package:share_the_meal_app/sidebar/registered_ngos.dart';
import 'package:share_the_meal_app/sidebar/settings.dart';
import 'package:share_the_meal_app/signin.dart';
import 'package:share_the_meal_app/firebase_options.dart';
import 'package:share_the_meal_app/splashcreen.dart';
import 'package:share_the_meal_app/cardprofile.dart';
import 'package:share_the_meal_app/bottomnavbar/upload.dart';

import 'package:share_the_meal_app/home.dart';
import 'package:share_the_meal_app/bottomnavbar/recycle.dart';
import 'package:share_the_meal_app/register.dart';
import 'package:share_the_meal_app/splashcreen.dart';

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
      title: 'Share The Meal',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/home': (context) => const Home(),
        '/sign-in': (context) => SigninScreen(),
        '/register': (context) => RegisterScreen(),
        '/recycle': (context) => RecycleFormScreen(),
        '/upload': (context) => const UploadFormScreen(),
        '/maps': (context) => const MapScreen(),
        '/cardprofile': (context) => Cardprofile(),
        '/profile': (context) => ProfilePage(),
        '/joinus': (context) => JoinUsPage(),
        '/registeredngos': (context) => RegisteredNGOs(),
      },
    );
  }
}
