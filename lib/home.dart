import 'package:flutter/material.dart';
import 'sidebar/side_navbar.dart';
import 'bottomnavbar/bottom_navbar.dart';
import 'widgets/cards.dart';
import 'widgets/filtersortbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int myIndex = 0;
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              icon: Icon(Icons.search, color: Colors.grey),
              hintText: 'Search...',
              border: InputBorder.none,
            ),
            style: const TextStyle(fontSize: 16),
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FilterSortBar(),
              const SizedBox(
                height: 20,
              )
              /* Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Curent Location',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),*/
              ,
              OrgCard(
                  imageUrl: 'assets/image1.jpeg',
                  name: 'Waheed Ul Uloom',
                  time: '5-10 mins',
                  cuisine: 'veg and non-veg',
                  location: 'RedHills',
                  distance: '0.5km',
                  onTap: () {
                    Navigator.pushNamed(context, '/cardprofile');
                  }),
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
              )
            ],
          ),
        ),
      ),
      drawer: SideNav(),
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
