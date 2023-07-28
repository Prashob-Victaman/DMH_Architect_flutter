import 'package:dmh_architect/Constants/constants.dart';
import 'package:dmh_architect/controller/googlemapcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:location/location.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  GoogleMapController? mapController;
  // LatLng? selectedLocation = LatLng(12.9716, 77.5946);
  LatLng selectedLocation = LatLng(12.9716, 77.5946);

  var currentLocation;

  final getGooglemapController = Get.put(GooglemapController());

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _onMapTapped(LatLng location) async {
    setState(() {
      selectedLocation = location;
    });

    // try {
    //   List<Placemark> placemarks = await placemarkFromCoordinates(
    //     location.latitude,
    //     location.longitude,
    //   );
    //   if (placemarks != null && placemarks.isNotEmpty) {
    //     Placemark placemark = placemarks[0];
    //     String newAddress =
    //         '${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}';
    //     setState(() {
    //       address = newAddress;
    //     });
    //   }
    // } catch (e) {
    //   print("Error getting address: $e");
    // }

    print(selectedLocation);
  }

  Future<void> _getCurrentLocation() async {
    final location = Location();
    try {
      final currentLocationData = await location.getLocation();
      setState(() {
        currentLocation = currentLocationData;
      });
    } catch (e) {
      // Handle location exception, if any
      print("Error getting user's location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: 600.w,
        width: screenwidth - 20.w,
        child: Stack(
          children: [
            GoogleMap(
                myLocationEnabled: true,
                onMapCreated: _onMapCreated,
                onTap: _onMapTapped,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    currentLocation?.latitude ??
                        12.9716, // Use current location if available, else San Francisco coordinates
                    currentLocation?.longitude ?? 77.5946,
                  ),
                  zoom: 12.0,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId('selected_location'),
                    position: selectedLocation,
                  ),
                }),
            Positioned(
                bottom: 10.w,
                left: 10.w,
                child: ElevatedButton(
                    onPressed: () async {
                      // getGoogleMapController.selectedLocationAdress =
                      //     getGoogleMapController.placemark;
                      getGooglemapController.getAdress(selectedLocation);
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.w),
                        ),
                        backgroundColor:
                            const Color.fromARGB(255, 250, 199, 131),
                        foregroundColor: const Color.fromARGB(255, 17, 70, 60)),
                    child: Text(
                      'Select Location',
                      style: bold15,
                    ))),
            Positioned(
                left: 10.w,
                top: 10.w,
                child: CircleAvatar(
                    radius: 18.w,
                    backgroundColor: kblackcolor,
                    child: IconButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          size: 25.sp,
                          Icons.close_sharp,
                          color: kwhitecolor,
                        ))))
          ],
        ),
      ),
    );
  }
}

// import 'package:geocoding/geocoding.dart' ;

// class GooglemapWidget extends StatelessWidget {
//   const GooglemapWidget({
//     super.key,
//     required this.screenwidth,
//   });

//   // void _onMapTapped(LatLng location) async {
//   //   setState(() {
//   //     selectedLocation = location;
//   //   });

//   //   try {
//   //     List<Placemark> placemarks = await placemarkFromCoordinates(
//   //       location.latitude,
//   //       location.longitude,
//   //     );
//   //     if (placemarks != null && placemarks.isNotEmpty) {
//   //       Placemark placemark = placemarks[0];
//   //       String newAddress =
//   //           '${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}';
//   //       setState(() {
//   //         address = newAddress;
//   //       });
//   //     }
//   //   } catch (e) {
//   //     print("Error getting address: $e");
//   //   }

//   //   print(selectedLocation);
//   // }

//   // final LocationController getlocationcontroller;
//   final double screenwidth;

//   @override
//   Widget build(BuildContext context) {
//     final screenwidth = MediaQuery.of(context).size.width;

//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 5.w),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           SizedBox(
//             width: (MediaQuery.of(context).size.width / 1.3) - 80,
//             child: Container(
//               child: Text(
//                 'sad',
//                 // selectedLocation.latitude.toString(),
//                 style: normal15,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.only(top: 3.w),
//             height: 50.w,
//             alignment: Alignment.center,
//             child: GestureDetector(
//               onTap: () {
//                 // getlocationcontroller.fetchLocationforform();

//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       titlePadding: EdgeInsets.all(0.w),
//                       title: SizedBox(
//                           height: 600.w,
//                           width: screenwidth - 20.w,
//                           child: GoogleMapScreen()),
//                     );
//                   },
//                 );
//               },
//               child: SizedBox(
//                 width: 40.w,
//                 height: 40.w,
//                 child: Image.asset(
//                     'asset/png-clipart-google-maps-google-i-o-logo-map-icon-google-map-logo-text-sign.png'),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
