import 'package:flutter/material.dart';
import 'side_navbar.dart'; 

class NotificationPage extends StatelessWidget {
  final List<NotificationItem> notifications = [
    NotificationItem(
      title: "Donation Confirmed",
      message: "Your food donation has been confirmed. Thank you!",
      timestamp: DateTime.now().subtract(Duration(minutes: 10)),
    ),
    NotificationItem(
      title: "Pickup Scheduled",
      message: "Volunteer will pick up your food at 4:00 PM.",
      timestamp: DateTime.now().subtract(Duration(hours: 1)),
    ),
    NotificationItem(
      title: "Thank You!",
      message: "Your food helped feed 3 people today. You're amazing!",
      timestamp: DateTime.now().subtract(Duration(days: 1)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        backgroundColor: Colors.green[700],
      ),
      drawer: SideNav(), 
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return NotificationCard(item: notifications[index]);
        },
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String message;
  final DateTime timestamp;

  NotificationItem({
    required this.title,
    required this.message,
    required this.timestamp,
  });
}

class NotificationCard extends StatelessWidget {
  final NotificationItem item;

  NotificationCard({required this.item});

  String _timeAgo(DateTime date) {
    final difference = DateTime.now().difference(date);
    if (difference.inMinutes < 60) return "${difference.inMinutes}m ago";
    if (difference.inHours < 24) return "${difference.inHours}h ago";
    return "${difference.inDays}d ago";
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: ListTile(
        leading: Icon(Icons.notifications, color: Colors.green[700]),
        title: Text(item.title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(item.message),
        trailing: Text(
          _timeAgo(item.timestamp),
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ),
    );
  }
}
