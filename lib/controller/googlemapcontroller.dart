import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../Constants/constants.dart';

class GooglemapController extends GetxController {
  String address = 'Select Location';
  LatLng? location;


  void getAdress(LatLng location) async {
    try {
      final url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=${location.latitude},${location.longitude}&key=$mapApiKey';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        if (result['status'] == 'OK') {

          address = result['results'][0]['formatted_address'];
          this.location = location;

        } else {
          address = 'Loading..';
        }
      } else {
        address = 'Error';
      }

      List<Placemark> placemarks = await placemarkFromCoordinates(
        location.latitude,
        location.longitude,
      );
    } catch (e) {
      print("Error getting address: $e");
    }
    refresh();
  }
}
