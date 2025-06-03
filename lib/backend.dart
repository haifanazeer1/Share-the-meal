import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart'; // for kIsWeb

class FirebaseService {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Uploads image either from File (mobile) or from bytes (web).
  /// Returns download URL.
  Future<String> uploadImage({
    required Uint8List? imageBytes,
    File? imageFile,
  }) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference ref = _storage.ref().child('images/$fileName.jpg');

      UploadTask uploadTask;

      if (kIsWeb) {
        if (imageBytes == null) {
          throw Exception('No image bytes found for web upload');
        }
        uploadTask = ref.putData(
            imageBytes, SettableMetadata(contentType: 'image/jpeg'));
      } else {
        if (imageFile == null) {
          throw Exception('No image file found for mobile upload');
        }
        uploadTask = ref.putFile(imageFile);
      }

      TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw Exception('Image upload failed: $e');
    }
  }

  Future<void> saveMealData({
    required String name,
    required String phone,
    required String type,
    required String serveSize,
    required String date,
    required String location,
    required String notes,
    required String imageUrl,
  }) async {
    try {
      await _firestore.collection('meals').add({
        'name': name,
        'phone': phone,
        'type': type,
        'serveSize': serveSize,
        'date': date,
        'location': location,
        'notes': notes,
        'imageUrl': imageUrl,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Saving meal data failed: $e');
    }
  }
}

class RecycleFormService {
  final CollectionReference recycleForms =
      FirebaseFirestore.instance.collection('recycle_forms');

  Future<void> submitForm({
    required String name,
    required String email,
    required String phone,
    required String date,
    required String location,
    required String notes,
  }) async {
    try {
      await recycleForms.add({
        'name': name,
        'email': email,
        'phone': phone,
        'pickup_date': date,
        'location': location,
        'notes': notes,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to submit form: $e');
    }
  }
}

class JoinUsService {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ... existing uploadImage and saveMealData methods

  Future<void> saveJoinUsData({
    required String ngoName,
    required String name,
    required String email,
    required String phone,
    required String reference,
    required String motivation,
    String? profileImageUrl, // Optional, if profile image upload is later added
  }) async {
    try {
      await _firestore.collection('ngo_joins').add({
        'ngoName': ngoName,
        'name': name,
        'email': email,
        'phone': phone,
        'reference': reference,
        'motivation': motivation,
        'profileImageUrl': profileImageUrl ?? '',
        'joinedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to save join data: $e');
    }
  }
}
