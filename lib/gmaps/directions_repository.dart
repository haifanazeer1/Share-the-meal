import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:share_the_meal_app/gmaps/googlemaps.dart';
import 'package:share_the_meal_app/gmaps/env.dart';
import 'package:share_the_meal_app/gmaps/directions_model.dart';

class DirectionsRepository {
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';

  final Dio _dio;
  DirectionsRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<Directions?> getDirections({
    required LatLng origin,
    required LatLng destination,
  }) async {
    try {
      final response = await _dio.get(_baseUrl, queryParameters: {
        'origin': '${origin.latitude},${origin.longitude}',
        'destination': '${destination.latitude},${destination.longitude}',
        'key': googleAPIKey, // Use the actual variable, not a string
      });

      if (response.statusCode == 200) {
        return Directions.fromMap(response.data);
      }
    } catch (e) {
      debugPrint('Directions API error: $e');
    }

    return null; // Return null on failure
  }
}
