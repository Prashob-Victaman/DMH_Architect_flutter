import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class LocationController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
    fetchLocation();
  }
  // Position? position;

  var latitude = 0.0.obs;
  var longitude = 0.0.obs;

  // String? address;

  fetchLocation() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isLocationServiceEnabled) {
      // Handle when location service is not enabled
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        // Handle when location permission is denied
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Handle when location permission is permanently denied
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    latitude.value = position.latitude;
    longitude.value = position.longitude;

    String address =
        await getAddress(latitude.toDouble(), longitude.toDouble());

    return address;
  }

  Future<String> getAddress(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks != null && placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        String address =
            '${placemark.street}, ${placemark.subLocality}, ${placemark.locality} ';
            // print(address);
        return address;
      }
    } catch (e) {
    }
    return '';
  }
}
