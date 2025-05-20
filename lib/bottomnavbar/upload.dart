import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart'; // for kIsWeb
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_the_meal_app/bottomnavbar/backend.dart';

class UploadFormScreen extends StatefulWidget {
  const UploadFormScreen({super.key});

  @override
  State<UploadFormScreen> createState() => _UploadFormScreenState();
}

class _UploadFormScreenState extends State<UploadFormScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _type = TextEditingController();
  final TextEditingController _servesize = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _notes = TextEditingController();

  File? _imageFile; // For mobile
  Uint8List? _webImage; // For web bytes

  final ImagePicker _picker = ImagePicker();
  DateTime? _selectedDate;

  bool _isLoading = false;
  final FirebaseService _firebaseService = FirebaseService();

  Future<void> _pickImage() async {
    try {
      final XFile? pickedImage =
          await _picker.pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        if (kIsWeb) {
          // On web, load bytes
          Uint8List imageBytes = await pickedImage.readAsBytes();
          setState(() {
            _webImage = imageBytes;
            _imageFile = null;
          });
        } else {
          // On mobile, use File
          setState(() {
            _imageFile = File(pickedImage.path);
            _webImage = null;
          });
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick image: $e')),
      );
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _date.text = _formatDate(picked);
      });
    }
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  Widget _buildTextField(
    TextEditingController controller,
    Icon icon,
    String hintText, {
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        decoration: InputDecoration(
          prefixIcon: icon,
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Future<void> _submitForm() async {
    if (_imageFile == null && _webImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please upload an image')),
      );
      return;
    }
    if (_name.text.isEmpty ||
        _phone.text.isEmpty ||
        _type.text.isEmpty ||
        _servesize.text.isEmpty ||
        _date.text.isEmpty ||
        _location.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields')),
      );
      return;
    }

    try {
      setState(() {
        _isLoading = true;
      });

      // Upload image based on platform
      String imageUrl = await _firebaseService.uploadImage(
        imageFile: _imageFile,
        imageBytes: _webImage,
      );

      // Save data
      await _firebaseService.saveMealData(
        name: _name.text.trim(),
        phone: _phone.text.trim(),
        type: _type.text.trim(),
        serveSize: _servesize.text.trim(),
        date: _date.text.trim(),
        location: _location.text.trim(),
        notes: _notes.text.trim(),
        imageUrl: imageUrl,
      );

      setState(() {
        _isLoading = false;
        _name.clear();
        _phone.clear();
        _type.clear();
        _servesize.clear();
        _date.clear();
        _location.clear();
        _notes.clear();
        _imageFile = null;
        _webImage = null;
        _selectedDate = null;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully!')),
      );
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
        title: const Text("Upload Form"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(12),
                    image: _imageFile != null
                        ? DecorationImage(
                            image: FileImage(_imageFile!),
                            fit: BoxFit.cover,
                          )
                        : _webImage != null
                            ? DecorationImage(
                                image: MemoryImage(_webImage!),
                                fit: BoxFit.cover,
                              )
                            : null,
                  ),
                  child: _imageFile == null && _webImage == null
                      ? const Center(child: Text("Tap to upload an image"))
                      : null,
                ),
              ),
            ),
            _buildTextField(_name, const Icon(Icons.person), 'Full Name'),
            _buildTextField(_phone, const Icon(Icons.phone), 'Phone Number'),
            _buildTextField(_type, const Icon(Icons.food_bank), 'Food Type'),
            _buildTextField(_servesize, const Icon(Icons.format_list_numbered),
                'Serving Size'),
            _buildTextField(
                _date, const Icon(Icons.date_range), 'Pick a date for pickup',
                readOnly: true, onTap: () => _selectDate(context)),
            _buildTextField(
                _location, const Icon(Icons.location_on), 'Location'),
            _buildTextField(
                _notes, const Icon(Icons.note), 'Food Condition / Notes'),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text("Submit",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
