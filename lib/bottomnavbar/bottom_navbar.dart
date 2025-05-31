import 'package:flutter/material.dart';
import 'package:share_the_meal_app/home.dart';
import 'package:share_the_meal_app/bottomnavbar/recycle.dart';
import 'package:share_the_meal_app/gmaps/googlemaps.dart';

class BottomNav extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNav({super.key, required this.currentIndex, required this.onTap});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;
  final List<String> _pages = [
    '/home',
    '/upload',
    '/recycle',
    '/maps',
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    Navigator.pushNamed(context, _pages[index]);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // Ensures all labels are shown
      onTap: _onItemTapped,
      currentIndex: selectedIndex,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.black,
      selectedLabelStyle: TextStyle(color: Colors.green),
      unselectedLabelStyle: TextStyle(color: Colors.black),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.upload), label: 'Upload'),
        BottomNavigationBarItem(
            icon: Icon(Icons.recycling_rounded), label: 'Recycle'),
        BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Maps'),
      ],
    );
  }
}
