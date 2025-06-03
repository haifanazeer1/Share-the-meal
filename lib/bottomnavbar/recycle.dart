import 'package:flutter/material.dart';
import 'package:share_the_meal_app/widgets/custom_text_input.dart';
import 'package:share_the_meal_app/backend.dart';

class RecycleFormScreen extends StatefulWidget {
  const RecycleFormScreen({super.key});

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

  final RecycleFormService _formService = RecycleFormService();
  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  bool _isLoading = false;

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _notes = TextEditingController();
  Future<void> _submitRecycleForm() async {
    if (_name.text.isEmpty ||
        _email.text.isEmpty ||
        _phone.text.isEmpty ||
        _date.text.isEmpty ||
        _location.text.isEmpty ||
        _notes.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields')),
      );
      return;
    }

    try {
      setState(() {
        _isLoading = true;
      });

      await _formService.submitForm(
        name: _name.text.trim(),
        email: _email.text.trim(),
        phone: _phone.text.trim(),
        date: _date.text.trim(),
        location: _location.text.trim(),
        notes: _notes.text.trim(),
      );

      setState(() {
        _isLoading = false;
        _name.clear();
        _email.clear();
        _phone.clear();
        _date.clear();
        _location.clear();
        _notes.clear();
        _selectedDate = null;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully!')),
      );

      Navigator.pop(context);
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Submission failed: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Center(child: Text("Recycle Form")),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            CustomTextInput(
              controller: _name,
              icon: const Icon(Icons.person),
              hint: 'Enter your  full name',
              isObscure: false,
            ),
            CustomTextInput(
              controller: _email,
              icon: const Icon(Icons.email),
              hint: 'Enter your email',
              isObscure: false,
            ),
            CustomTextInput(
              controller: _phone,
              icon: const Icon(Icons.phone),
              hint: 'Enter your phone number',
              isObscure: false,
            ),
            CustomTextInput(
              controller: _date,
              onTap: () => _selectDate(context),
              icon: const Icon(Icons.calendar_month),
              hint: 'pick a date for pickup',
              isObscure: false,
            ),
            CustomTextInput(
              controller: _location,
              icon: const Icon(Icons.location_city),
              hint: 'Enter your location',
              isObscure: false,
            ),
            CustomTextInput(
              controller: _notes,
              icon: const Icon(Icons.description),
              hint: 'Describe the condition of the food',
              isObscure: false,
            ),
            ElevatedButton(
              onPressed: _submitRecycleForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
              ),
              child: const Text("Submit",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        )));
  }
}
