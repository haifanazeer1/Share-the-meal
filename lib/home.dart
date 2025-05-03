import 'package:flutter/material.dart';
import 'side_navbar.dart';
import 'bottom_navbar.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('HOME PAGE')),
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              Navigator.pop(context, '/sign-in');
            },
            child: Icon(Icons.arrow_back),
          ),
        ],
      ),
      drawer: SideNav(),
      bottomNavigationBar: BottomNav(
        currentIndex: myIndex,
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
      ),
    );
  }
}
