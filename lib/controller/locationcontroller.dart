// import 'package:get/get.dart';
// import 'package:geolocator/geolocator.dart';

// class LocationController extends GetxController {
//   Future<Position> fectchlocationfn() async {
//     // fetchlocation = 'location';
//     LocationPermission permission = await Geolocator.requestPermission();

//     if (permission == LocationPermission.denied) {
//     } else if (permission == LocationPermission.deniedForever) {}
//     {
//       // Request the user's location
//       Position fetchlocation = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//       );

//       // final currentLocation = fetchlocation;
//       // final coordinates =
//       //     new Coordinates(myLocation.latitude, myLocation.longitude);
//       // var addresses =
//       //     await Geocoder.local.findAddressesFromCoordinates(coordinates);
//       return fetchlocation;
//     }

//     // refresh();
//   }
// }
