import 'package:flutter/material.dart';

void main() => runApp(JoinUsApp());

class JoinUsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Join Us',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: JoinUsPage(),
    );
  }
}

class JoinUsPage extends StatefulWidget {
  @override
  _JoinUsPageState createState() => _JoinUsPageState();
}

class _JoinUsPageState extends State<JoinUsPage> {
  final _formKey = GlobalKey<FormState>();
  String ngoName = '';
  String name = '';
  String email = '';
  String phone = '';
  String reference = '';
  String motivation = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Thanks for joining, $name!')),
      );
      // Here you can send data to a server, Firebase, etc.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Join Our NGO')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Profile Picture Placeholder
              GestureDetector(
                onTap: () {
                  // You can integrate image_picker here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Profile picture upload coming soon!')),
                  );
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey.shade300,
                  child: Icon(Icons.camera_alt, size: 40, color: Colors.white),
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Let's make a difference together 💙",
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 20),

              // Form Fields
              TextFormField(
                decoration: InputDecoration(labelText: 'NGO Name'),
                validator: (value) => value!.isEmpty ? 'Enter NGO name' : null,
                onSaved: (value) => ngoName = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Full Name'),
                validator: (value) => value!.isEmpty ? 'Enter your name' : null,
                onSaved: (value) => name = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email ID'),
                validator: (value) =>
                    value!.contains('@') ? null : 'Enter a valid email',
                onSaved: (value) => email = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Mobile Number'),
                keyboardType: TextInputType.phone,
                validator: (value) =>
                    value!.length < 10 ? 'Enter valid phone number' : null,
                onSaved: (value) => phone = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Reference Number'),
                onSaved: (value) => reference = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Why do you want to join?'),
                maxLines: 3,
                validator: (value) =>
                    value!.isEmpty ? 'Please share your motivation' : null,
                onSaved: (value) => motivation = value!,
              ),
              SizedBox(height: 30),

              // Centered Join Button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: _submitForm,
                  child: Text('JOIN US', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
