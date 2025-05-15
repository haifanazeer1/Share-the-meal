import 'package:flutter/material.dart';

class OrgCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String time;
  final String cuisine;
  final String location;
  final String distance;
  final VoidCallback? onTap; // Callback function when the card is tapped

  const OrgCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.time,
    required this.cuisine,
    required this.location,
    required this.distance,
    this.onTap, // Optional onTap function
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  imageUrl,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('$cuisine', style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 4),
                    Text(
                      '$location . $distance',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 4),
                    Text(
                      time,
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
