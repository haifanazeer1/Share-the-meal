import 'package:flutter/material.dart';

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
      onTap: _onItemTapped,
      currentIndex: selectedIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.upload), label: 'Upload'),
        BottomNavigationBarItem(
            icon: Icon(Icons.recycling_rounded), label: 'Recycle'),
      ],
    );
  }
}
