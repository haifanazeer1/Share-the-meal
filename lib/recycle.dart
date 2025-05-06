import 'package:flutter/material.dart';
import 'package:share_the_meal_app/widgets/custom_text_input.dart';

class RecycleFormScreen extends StatefulWidget {
  @override
  _RecycleFormScreenState createState() => _RecycleFormScreenState();
}

class _RecycleFormScreenState extends State<RecycleFormScreen> {
  DateTime? _selectedDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _date.text = _formatDate(picked);
      });
    }
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _notes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Center(child: Text("Recycle Form")),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[100],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.green, width: 2),
                  ),
                ),
              ),
            ),
            CustomTextInput(
              controller: _name,
              icon: Icon(Icons.person),
              hint: 'Enter your  full name',
              isObscure: false,
            ),
            CustomTextInput(
              controller: _email,
              icon: Icon(Icons.email),
              hint: 'Enter your email',
              isObscure: false,
            ),
            CustomTextInput(
              controller: _phone,
              icon: Icon(Icons.phone),
              hint: 'Enter your phone number',
              isObscure: false,
            ),
            CustomTextInput(
              controller: _date,
              onTap: () => _selectDate(context),
              icon: Icon(Icons.calendar_month),
              hint: 'pick a date for pickup',
              isObscure: false,
            ),
            CustomTextInput(
              controller: _location,
              icon: Icon(Icons.location_city),
              hint: 'Enter your location',
              isObscure: false,
            ),
            CustomTextInput(
              controller: _notes,
              icon: Icon(Icons.description),
              hint: 'Describe the condition of the food',
              isObscure: false,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, '/home');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 30),
              ),
              child: Text("Submit",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        )));
  }
}
