// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class fetchLocation extends StatefulWidget {
//   const fetchLocation({super.key});

//   @override
//   State<fetchLocation> createState() => _fetchLocationState();
// }

// LatLng initialCameraPosition = LatLng(0, 0); // Set an initial position

// late GoogleMapController mapController;

// @override
// void initState() {
//   _requestLocationPermission();
// }

// void _requestLocationPermission() async {
//   LocationPermission permission = await Geolocator.requestPermission();

//   if (permission == LocationPermission.denied) {
//     // Handle the case when location permission is denied
//     print('Location permission denied');
//   } else if (permission == LocationPermission.deniedForever) {
//     // Handle the case when location permission is permanently denied
//     print('Location permission permanently denied');
//   } else {
//     // Location permission granted
//     _getCurrentLocation();
//   }
// }

// void _getCurrentLocation() async {
//   Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high);

//   initialCameraPosition = LatLng(position.latitude, position.longitude);

//   mapController.animateCamera(CameraUpdate.newLatLng(initialCameraPosition));
// }

// class _fetchLocationState extends State<fetchLocation> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: GoogleMap(
//           initialCameraPosition: CameraPosition(
//             target: initialCameraPosition,
//             zoom: 15.0,
//           ),
//           onMapCreated: (controller) {
//             setState(() {
//               mapController = controller;
//             });
//           },
//         ),
//       ),
//     );
//   }
// }


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: Stack(
      children: <Widget>[
      GoogleMap(initialCameraPosition: CameraPosition(target:
      LatLng(-33.870840,151.206286),
        zoom: 12)
    )
    ],
        )
      ),
    );
  }
}
