import 'package:flutter/material.dart';
import 'package:share_the_meal_app/home.dart';
import 'package:share_the_meal_app/sidebar/favorites.dart';
import 'package:share_the_meal_app/sidebar/settings.dart';
import 'package:share_the_meal_app/signin.dart';
import 'package:share_the_meal_app/sidebar/joinus.dart';


import 'history.dart';
import 'donation.dart';
import 'aboutus.dart';
import 'dash.dart';
import 'notification.dart';
import 'profile.dart';
import 'settings.dart';

class SideNav extends StatelessWidget {
  const SideNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Header with profile
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              accountName: Text(
                'Ahamadi Hareem',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              accountEmail: Text('example@gmail.com'),
              currentAccountPicture: CircleAvatar(
                  //backgroundImage: AssetImage('assets/elon.jpg'), // Fixed path
                  ),
            ),

            SizedBox(height: 20), // Instead of Spacer()

            // Main navigation items
            _buildListTile(Icons.home, 'Home', context, const Home()),
            _buildListTile(Icons.person, 'Profile', context, ProfilePage()),
            _buildListTile(Icons.notifications, 'Notifications', context,
                NotificationPage()),
            _buildListTile(
                Icons.dashboard, 'Dashboard', context, DashBoardPage()),
            // _buildListTile(
            //  Icons.favorite, 'Favourites', context, FavoritesPage()),
            _buildListTile(Icons.attach_money, 'Donate', context, DonatePage()),
            _buildListTile(Icons.info, 'About Us', context, AboutUsPage()),
            _buildListTile(Icons.group_add, 'Join Us', context, JoinUsPage()),


            Divider(),
            _buildListTile(Icons.logout, 'Logout', context, SigninScreen()),
            _buildListTile(Icons.settings, 'Settings', context, SettingsPage()),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

Widget _buildListTile(
    IconData icon, String title, BuildContext context, Widget destination) {
  return ListTile(
    leading: Icon(icon, color: Colors.green.shade800),
    title: Text(
      title,
      style: TextStyle(fontSize: 16, color: Colors.black87),
    ),
    hoverColor: Colors.green.withOpacity(0.1),
    onTap: () {
      Navigator.pop(context); // Close the drawer
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => destination),
      );
    },
  );
}
