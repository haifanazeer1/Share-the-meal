import 'package:flutter/material.dart';
import 'package:share_the_meal_app/widgets/custom_text_input.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadFormScreen extends StatefulWidget {
  const UploadFormScreen({super.key});

  @override
  State<UploadFormScreen> createState() => _UploadFormScreenState();
}

class _UploadFormScreenState extends State<UploadFormScreen> {
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

  Future<void> _pickImage() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

  final TextEditingController _name = TextEditingController();
  final TextEditingController _type = TextEditingController();
  final TextEditingController _servesize = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _notes = TextEditingController();
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Center(child: Text("Upload Form")),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[100],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color.fromARGB(255, 10, 61, 104),
                      width: 2,
                    ),
                    image: _imageFile != null
                        ? DecorationImage(
                            image: FileImage(_imageFile!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: _imageFile == null
                      ? const Center(child: Text("Tap to upload an image"))
                      : null,
                ),
              ),
            ),
            /*GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[100],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color.fromARGB(255, 10, 61, 104), width: 2),
                  ),
                ),
              ),
            ),*/
            CustomTextInput(
              controller: _name,
              icon: const Icon(Icons.person),
              hint: 'Enter your  full name',
              isObscure: false,
            ),
            CustomTextInput(
              controller: _phone,
              icon: const Icon(Icons.phone),
              hint: 'Enter your phone number',
              isObscure: false,
            ),
            CustomTextInput(
              controller: _type,
              icon: const Icon(Icons.type_specimen),
              hint: 'Enter the type of food(veg/nonveg)',
              isObscure: false,
            ),
            CustomTextInput(
              controller: _servesize,
              icon: const Icon(Icons.production_quantity_limits),
              hint: 'Enter the serving size',
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
              onPressed: () async {
                try {
                  String? imageUrl;
                  if (_imageFile != null) {
                    final storageRef = FirebaseStorage.instance.ref().child(
                        'uploads/${DateTime.now().millisecondsSinceEpoch}.jpg');
                    final UploadTask = await storageRef.putFile(_imageFile!);
                    print("upload complete");
                    imageUrl = await storageRef.getDownloadURL();
                    print("image URL: $imageUrl");
                  }
                  await FirebaseFirestore.instance.collection('meals').add({
                    'name': _name.text,
                    'phone': _phone.text,
                    'type': _type.text,
                    'serving_size': _servesize.text,
                    'pickup_date': _date.text,
                    'location': _location.text,
                    'notes': _notes.text,
                    'image_url': imageUrl,
                    'timestamp': FieldValue.serverTimestamp(),
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Data submitted successfully!')),
                  );

                  Navigator.pop(
                      context); // Optionally return to the previous screen
                } catch (e) {
                  String errorMessage = 'An error occurred';
                  if (e is FirebaseException) {
                    errorMessage = e.message ?? errorMessage;
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to submit: $errorMessage')),
                  );
                }
              },
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
