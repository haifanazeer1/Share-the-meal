import 'package:flutter/material.dart';

class Navtojoin extends StatelessWidget {
  const Navtojoin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Become A Part Of Us'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/joinus');
              },
              child: Text('Join Us'),
            ),
            SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/registeredngos');
              },
              child: Text("Registered NGO's"),
            ),
          ],
        ),
      ),
    );
  }
}
