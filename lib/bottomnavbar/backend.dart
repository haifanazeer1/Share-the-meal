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
