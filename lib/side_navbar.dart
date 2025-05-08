import 'package:flutter/material.dart';

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
                backgroundImage: AssetImage('assets/elon.jpg'), // Fixed path
              ),
            ),

            // Main navigation items
            _buildListTile(Icons.home, 'Home', context),
            _buildListTile(Icons.person, 'Profile', context),
            _buildListTile(Icons.notifications, 'Notifications', context),
            _buildListTile(Icons.dashboard, 'Dashboard', context),
            _buildListTile(Icons.favorite, 'Favourites', context),
            _buildListTile(Icons.fastfood, 'Food', context),
            _buildListTile(Icons.shopping_cart, 'Checkout', context),
            _buildListTile(Icons.history, 'Orders', context),

            SizedBox(height: 20), // Instead of Spacer()

            Divider(),
            _buildListTile(Icons.logout, 'Logout', context),
            _buildListTile(Icons.settings, 'Settings', context),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.green.shade800),
      title: Text(
        title,
        style: TextStyle(fontSize: 16, color: Colors.black87),
      ),
      hoverColor: Colors.green.withOpacity(0.1),
      onTap: () {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$title tapped')),
        );
      },
    );
  }
}
