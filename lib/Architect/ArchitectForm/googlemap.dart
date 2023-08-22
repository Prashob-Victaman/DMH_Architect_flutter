import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../../Constants/constants.dart';
import '../../../controller/googlemapcontroller.dart';
import '../../getDesign/chooseArchitect.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GoogleMapScreen extends StatefulWidget {

LatLng selectedLocation = const LatLng(25.5941, 85.1376);
LocationData? currentLocation;

  GoogleMapScreen({
    super.key,
  });

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  GoogleMapController? mapController;

  // LatLng? selectedLocation = LatLng(12.9716, 77.5946);

  // LatLng selectedLocation = widget.currentLocation;

  final getGooglemapController = Get.put(GooglemapController());

  final TextEditingController _searchController = TextEditingController();
  final PlacesApi _placesApi =
  PlacesApi(mapApiKey, http.Client());
  List<Map> _suggestions = [];

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
      widget.selectedLocation = location;
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

    // print(selectedLocation);
  }

  Future<void> _getCurrentLocation() async {
    final location = Location();
    try {
      final currentLocationData = await location.getLocation();
      setState(() {
        widget.currentLocation = currentLocationData;
      });
    } catch (e) {
      // Handle location exception, if any
      print("Error getting user's location: $e");
    }
  }

  void _updateSuggestions(String input) async {
    final suggestions = await _placesApi.getPlaceSuggestions(input);
    setState(() {
      _suggestions = suggestions;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(

              onCameraIdle: () {
                //  Future.delayed(Duration(seconds: 2), () {
                getGooglemapController.getAdress(widget.selectedLocation!);
                //  });
              },
              onCameraMove: (camPos) {
                _onMapTapped(camPos.target);
              },
              mapType: MapType.hybrid,
              myLocationEnabled: true,
              onMapCreated: _onMapCreated,
              onTap: _onMapTapped,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  widget.currentLocation?.latitude ?? 25.5941,
                  widget.currentLocation?.longitude ?? 85.1376,
                ),
                zoom: 12.0,
              ),
              // markers: {
              //   Marker(
              //     markerId: MarkerId('selected_location'),
              //     position: widget.selectedLocation!,
              //   ),
              // },
            ),
            Positioned(
              bottom: (MediaQuery.of(context).size.height / 2) - 18.w,
              left: (screenwidth - 40.w) / 2,
              child: Icon(
                Icons.location_on,
                color: Colors.lightBlueAccent,
                size: 40.sp,
              ),
            ),
            Positioned(
              left: 10.w,
              top: 12.w,
              child: Container(
                height: 38,
                width: screenwidth - 70.w,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                child: Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        size: 25.sp,
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: SizedBox(
                        width: screenwidth - 120.w,
                        child: TextField(
                          controller: _searchController,
                          onChanged: _updateSuggestions,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search Location',
                            hintStyle: TextStyle(
                                fontSize: 16.sp, color: Colors.white70),
                          ),
                          style:
                          TextStyle(fontSize: 16.sp, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            _suggestions.length == 0?SizedBox():Positioned(
              top: 55,
              left: 0,
              child: SizedBox(
                height: 500.w,
                width: screenwidth,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: ListView.builder(
                    itemCount: _suggestions.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          final placeDetails = await _placesApi
                              .getPlaceDetails(_suggestions[index]['place_id']);
                          final location = placeDetails['geometry']['location'];
                          final latitude = location['lat'];
                          final longitude = location['lng'];
                          print('Coordinates: $latitude, $longitude');
                          LatLng mylatlng = LatLng(latitude, longitude);
                          _onMapTapped(mylatlng);
                          mapController?.animateCamera(CameraUpdate.newLatLng(mylatlng));
                          setState(() {
                            _suggestions =[];
                          });
                        },
                        child: Container(
                          width: screenwidth - 20.w,
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                heigh10,
                                Text(
                                  _suggestions[index]['description'],
                                  style: normal18,
                                  maxLines: 2,
                                ),
                                heigh10
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 150,
                width: screenwidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.sp),
                ),
                child: GetBuilder<GooglemapController>(
                  builder: (getdata) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.location_on_outlined),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 100,
                              child: Text(
                                getdata.address,
                                // selectedLocation.latitude.toString(),
                                style: normal18,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            // getGoogleMapController.selectedLocationAdress =
                            //     getGoogleMapController.placemark;
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.w),
                              ),
                              backgroundColor:
                              const Color.fromARGB(255, 250, 199, 131),
                              foregroundColor:
                              const Color.fromARGB(255, 17, 70, 60)),
                          child: SizedBox(
                            width: screenwidth - 100,
                            child: Center(
                              child: Text(
                                'Select Location',
                                style: bold15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlacesApi {
  final String apiKey;
  final http.Client client;

  PlacesApi(this.apiKey, this.client);

  Future<List<Map>> getPlaceSuggestions(String input) async {
    final response = await client.get(
        Uri.parse('https://maps.googleapis.com/maps/api/place/autocomplete/json'
            '?input=$input'
            '&key=$apiKey'));

    if (response.statusCode == 200) {
      final predictions = json.decode(response.body)['predictions'] as List;
      print(predictions[0]['place_id']);
      return predictions.map<Map>((prediction) => prediction).toList();
    } else {
      throw Exception('Failed to load place suggestions');
    }
  }

  Future<Map<String, dynamic>> getPlaceDetails(String placeId) async {
    final response = await client
        .get(Uri.parse('https://maps.googleapis.com/maps/api/place/details/json'
        '?placeid=$placeId'
        '&key=$apiKey'));

    if (response.statusCode == 200) {
      return json.decode(response.body)['result'];
    } else {
      throw Exception('Failed to load place details');
    }
  }
}

