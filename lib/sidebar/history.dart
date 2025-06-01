import 'package:flutter/material.dart';
import 'side_navbar.dart'; 
import 'package:intl/intl.dart';

void main() {
  runApp(ShareAMealApp());
}

class ShareAMealApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Share A Meal',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: DonationHistoryPage(),
    );
  }
}

class DonationHistoryPage extends StatelessWidget {
  final List<DonationEntry> donationHistory = [
    DonationEntry(
      ngoName: 'Wahheed-ul-Uloom',
      date: DateTime(2025, 2, 2),
    ),
  ];

  final DateFormat formatter = DateFormat('MMMM d, yyyy'); // e.g., February 2, 2025

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donation History'),
      ),
      body: ListView.builder(
        itemCount: donationHistory.length,
        itemBuilder: (context, index) {
          final entry = donationHistory[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Icon(Icons.restaurant, color: Colors.green),
              title: Text('Donated to ${entry.ngoName}'),
              subtitle: Text('on ${formatter.format(entry.date)}'),
            ),
          );
        },
      ),
    );
  }
}

class DonationEntry {
  final String ngoName;
  final DateTime date;

  DonationEntry({required this.ngoName, required this.date});
}
