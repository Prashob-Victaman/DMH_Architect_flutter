import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GooglemapController extends GetxController {
  String address = 'Select Location';
  LatLng? location;

  void getAdress(LatLng location) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        location.latitude,
        location.longitude,
      );
      if (placemarks != null && placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        String newAddress =
            '${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea}';
        // setState(() {
        address = newAddress;
        this.location = location;
        // });
        print(address);
      }
    } catch (e) {
      print("Error getting address: $e");
    }
    refresh();
  }
}
