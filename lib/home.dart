import 'package:flutter/material.dart';
import 'sidebar/side_navbar.dart';
import 'bottomnavbar/bottom_navbar.dart';
import 'widgets/filtersortbar.dart';
import 'widgets/cards.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('HOME PAGE')),
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
        ),
      ),

      drawer: const SideNav(), // ✅ Side Navigation Drawer

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const FilterSortBar(),
              const SizedBox(height: 20),

              // Sample Org Cards
              OrgCard(
                imageUrl: 'assets/image1.jpeg',
                name: 'Waheed Ul Uloom',
                time: '5-10 mins',
                cuisine: 'veg and non-veg',
                location: 'RedHills',
                distance: '0.5km',
                onTap: () {
                  Navigator.pushNamed(context, '/cardprofile');
                },
              ),
              OrgCard(
                imageUrl: 'assets/image1.jpeg',
                name: 'Niswan Education Center',
                time: '10-15 mins',
                cuisine: 'veg and non-veg',
                location: 'Maasab Tank',
                distance: '1km',
                onTap: () {
                  Navigator.pushNamed(context, '/cardprofile');
                },
              ),
              OrgCard(
                imageUrl: 'assets/image1.jpeg',
                name: 'GuruKrishn Center',
                time: '20-25 mins',
                cuisine: 'veg only',
                location: 'Mehdipatnam',
                distance: '3km',
                onTap: () {
                  Navigator.pushNamed(context, '/cardprofile');
                },
              ),
              OrgCard(
                imageUrl: 'assets/image1.jpeg',
                name: 'St Josephs NGO',
                time: '20-25 mins',
                cuisine: 'veg and non-veg',
                location: 'Abids',
                distance: '3.5km',
                onTap: () {
                  Navigator.pushNamed(context, '/cardprofile');
                },
              ),
              OrgCard(
                imageUrl: 'assets/image1.jpeg',
                name: 'Nina NGO',
                time: '30-35 mins',
                cuisine: 'veg and non-veg',
                location: 'Banjara Hills',
                distance: '4.5km',
                onTap: () {
                  Navigator.pushNamed(context, '/cardprofile');
                },
              ),
            ],
          ),
        ),
      ),

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
