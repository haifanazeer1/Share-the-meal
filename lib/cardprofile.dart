import 'package:flutter/material.dart';

class Cardprofile extends StatelessWidget {
  const Cardprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Details",
          style: TextStyle(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(16),
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage('assets/image1.jpeg'),
                    fit: BoxFit.cover,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'St Josephs NGO',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      "About the NGO",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Text(
                          """We strive to make sure that no one falls through the cracks and that everyone can live a safe, healthy, and happy life. We are proud to use our resources to make a difference in the lives of those in need. Join us in our mission to Help The Needy and make a real difference in people's lives. With your contribution, you can help us provide essential resources and support to those who need it the most.""",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            "Location:Hyderabad",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  // Buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          icon: Icon(Icons.chat),
                          label: Text(
                            'Chat',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          onPressed: () {},
                        ),
                        ElevatedButton.icon(
                          icon: Icon(Icons.favorite),
                          label: Text(
                            'Donate Now',
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          onPressed: () {
                            Navigator.pushNamed(context, '/upload');
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
