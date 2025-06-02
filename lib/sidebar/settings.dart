import 'package:flutter/material.dart';
import 'side_navbar.dart';

void main() => runApp(SettingsApp());

class SettingsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings Page',
      theme: ThemeData.light(),
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool pushNotifications = true;
  String appearanceMode = 'light'; // Options: 'light' or 'dark'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(24.0),
        children: [
          // Account Section
          Text('Account Settings',
              style: Theme.of(context).textTheme.headlineMedium),
          SizedBox(height: 16),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit Profile'),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Change Password'),
            onTap: () {},
          ),

          Divider(height: 40),

          // Notifications Section
          Text('Notifications',
              style: Theme.of(context).textTheme.headlineMedium),
          SwitchListTile(
            title: Text('Push Notifications'),
            secondary: Icon(Icons.notifications),
            value: pushNotifications,
            onChanged: (val) {
              setState(() {
                pushNotifications = val;
              });
            },
          ),

          Divider(height: 40),

          // Privacy Section
          Text('Privacy', style: Theme.of(context).textTheme.headlineMedium),
          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text('Privacy Settings'),
            onTap: () {},
          ),

          Divider(height: 40),

          // Appearance Section
          Text('Appearance', style: Theme.of(context).textTheme.headlineMedium),
          RadioListTile<String>(
            title: Text('Light Mode'),
            value: 'light',
            groupValue: appearanceMode,
            secondary: Icon(Icons.light_mode),
            onChanged: (value) {
              setState(() {
                appearanceMode = value!;
              });
            },
          ),
          RadioListTile<String>(
            title: Text('Dark Mode'),
            value: 'dark',
            groupValue: appearanceMode,
            secondary: Icon(Icons.dark_mode),
            onChanged: (value) {
              setState(() {
                appearanceMode = value!;
              });
            },
          ),

          SizedBox(height: 50),

          // Logout
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text(
              'Log Out',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              // Handle logout
            },
          ),
        ],
      ),
    );
  }
}
