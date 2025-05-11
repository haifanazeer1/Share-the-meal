import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfilePage(),
  ));
}

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditing = false;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController =
      TextEditingController(text: 'Ahamadi Hareem');
  final TextEditingController _dobController =
      TextEditingController(text: '01 Jan 1990');
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final boxSize = screenHeight * 0.75;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Profile Info
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.green.shade100,
                          child:
                              Icon(Icons.person, size: 50, color: Colors.green),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Ahamadi Hareem',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text('Email: ahamadi@example.com',
                            style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        Text('Phone: +1234567890',
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),

                  SizedBox(width: 30),

                  // Right Form Box
                  Expanded(
                    flex: 2,
                    child: Stack(
                      children: [
                        Container(
                          height: boxSize,
                          width: boxSize,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 40),
                                TextFormField(
                                  controller: _nameController,
                                  enabled: isEditing,
                                  decoration: InputDecoration(
                                    labelText: 'Name',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  controller: _dobController,
                                  enabled: isEditing,
                                  decoration: InputDecoration(
                                    labelText: 'Birth Date',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  controller: _stateController,
                                  enabled: isEditing,
                                  decoration: InputDecoration(
                                    labelText: 'State',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  controller: _cityController,
                                  enabled: isEditing,
                                  decoration: InputDecoration(
                                    labelText: 'City',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  controller: _addressController,
                                  enabled: isEditing,
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                    labelText: 'Address',
                                    alignLabelWithHint: true,
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Edit/Save Button
                        Positioned(
                          top: 0,
                          right: 0,
                          child: TextButton.icon(
                            onPressed: () {
                              setState(() {
                                if (isEditing &&
                                    _formKey.currentState!.validate()) {
                                  // Save logic here
                                }
                                isEditing = !isEditing;
                              });
                            },
                            icon: Icon(
                              isEditing ? Icons.save : Icons.edit,
                              color: Colors.blue,
                            ),
                            label: Text(
                              isEditing ? 'Save' : 'Edit',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Full-Width Beige Box with Clickable About Us
          Container(
            width: double.infinity,
            color: Color(0xFFF5F5DC), // Beige color
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(fontSize: 16, color: Colors.black),
                children: [
                  TextSpan(
                      text: 'Contact Us: 123-456-7854, 987-654-3210  |  '),
                  TextSpan(
                    text: 'About Us',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('About Us tapped')),
                        );
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
