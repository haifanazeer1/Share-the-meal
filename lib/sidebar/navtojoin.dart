import 'package:flutter/material.dart';
import 'package:share_the_meal_app/sidebar/joinus.dart';
import 'package:share_the_meal_app/sidebar/registered_ngos.dart';

class Navtojoin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BECOME A PART OF US'),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Color(0xFFE0F2FE), // Light blue background
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'JOIN US',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.teal[900],
              letterSpacing: 2,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '“Together, we can make a difference — one meal at a time.”',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HoverCard(
                title: 'REGISTER YOUR NGO HERE',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JoinUsPage()),
                  );
                },
              ),
              SizedBox(width: 20),
              HoverCard(
                title: 'REGISTERED NGO',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisteredNGOs()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HoverCard extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const HoverCard({required this.title, required this.onTap});

  @override
  _HoverCardState createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _isHovered = false;

  void _setHover(bool hover) {
    setState(() {
      _isHovered = hover;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _setHover(true),
      onExit: (_) => _setHover(false),
      child: GestureDetector(
        onTap: widget.onTap,
        onTapDown: (_) => _setHover(true),
        onTapUp: (_) => _setHover(false),
        onTapCancel: () => _setHover(false),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            color: _isHovered ? Colors.green : Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 4),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: _isHovered ? Colors.white : Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

// Dummy destination pages
class IndividualRegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Individual Registration')),
      body: Center(child: Text('This is the Individual Registration page')),
    );
  }
}

class RegisteredNGOPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registered NGO')),
      body: Center(child: Text('This is the Registered NGO page')),
    );
  }
}
