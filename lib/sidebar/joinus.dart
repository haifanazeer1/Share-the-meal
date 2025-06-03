import 'package:flutter/material.dart';
import 'package:share_the_meal_app/backend.dart';

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
  final JoinUsService _firebaseService = JoinUsService();
  String ngoName = '';
  String name = '';
  String email = '';
  String phone = '';
  String reference = '';
  String motivation = '';

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        await _firebaseService.saveJoinUsData(
          ngoName: ngoName,
          name: name,
          email: email,
          phone: phone,
          reference: reference,
          motivation: motivation,
          // profileImageUrl: (optional if added later)
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Thanks for joining, $name!')),
        );

        // Optionally reset form or navigate
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    }
  }

  Widget _buildInputBox({required String label, required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blueAccent),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 8),
          child,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true, // Adjusts for keyboard visibility
      extendBodyBehindAppBar: true, // Allows body to extend under app bar
      extendBody: true, // Allows body to extend beyond the safe area
      bottomNavigationBar: null, // No bottom navigation bar in this page
      drawer: null, // No drawer in this page (you can add one if needed)
      appBar: AppBar(
        title: Text('Join Our NGO'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Profile Picture
              GestureDetector(
                onTap: () {
                  // You can add image picking functionality here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('Profile picture upload coming soon!')),
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

              // Form fields wrapped in boxes
              _buildInputBox(
                label: 'NGO Name',
                child: TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  validator: (value) =>
                      value!.isEmpty ? 'Enter NGO name' : null,
                  onSaved: (value) => ngoName = value!,
                ),
              ),
              _buildInputBox(
                label: 'Full Name',
                child: TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  validator: (value) =>
                      value!.isEmpty ? 'Enter your name' : null,
                  onSaved: (value) => name = value!,
                ),
              ),
              _buildInputBox(
                label: 'Email ID',
                child: TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  validator: (value) =>
                      value!.contains('@') ? null : 'Enter a valid email',
                  onSaved: (value) => email = value!,
                ),
              ),
              _buildInputBox(
                label: 'Mobile Number',
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  validator: (value) =>
                      value!.length < 10 ? 'Enter valid phone number' : null,
                  onSaved: (value) => phone = value!,
                ),
              ),
              _buildInputBox(
                label: 'Reference Number',
                child: TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  onSaved: (value) => reference = value!,
                ),
              ),
              _buildInputBox(
                label: 'Why do you want to join?',
                child: TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  validator: (value) =>
                      value!.isEmpty ? 'Please share your motivation' : null,
                  onSaved: (value) => motivation = value!,
                ),
              ),

              SizedBox(height: 30),

              // JOIN US button centered
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
