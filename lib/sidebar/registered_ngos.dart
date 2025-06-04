import 'package:flutter/material.dart';
import 'package:share_the_meal_app/backend.dart'; // adjust as per your path

class RegisteredNGOs extends StatefulWidget {
  @override
  _RegisteredNGOsState createState() => _RegisteredNGOsState();
}

class _RegisteredNGOsState extends State<RegisteredNGOs> {
  late Future<List<Map<String, String>>> _registeredUsersFuture;

  @override
  void initState() {
    super.initState();
    _registeredUsersFuture = JoinUsService().fetchRegisteredUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NGOS WITH US'),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List<Map<String, String>>>(
        future: _registeredUsersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No registered NGOs found.'));
          }

          final users = snapshot.data!;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  leading: Icon(Icons.business, color: Colors.green),
                  title: Text(user['ngoName'] ?? ''),
                  subtitle: Text('Phone: ${user['phone'] ?? ''}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
