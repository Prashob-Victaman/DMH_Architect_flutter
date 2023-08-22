import 'package:dmh_architect/Architect/ArchitectForm/googlemap.dart';
import 'package:dmh_architect/Constants/constants.dart';
import 'package:dmh_architect/controller/googlemapcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GooglemapWidget extends StatelessWidget {
  GooglemapWidget({
    super.key,
    required this.screenwidth,
  });

  final double screenwidth;
  final getGooglemapController = Get.put(GooglemapController());

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GetBuilder<GooglemapController>(builder: (getdata) {
            return SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              child: Text(
                getdata.address,
                // selectedLocation.latitude.toString(),
                style: normal15,
                overflow: TextOverflow.ellipsis,
              ),
            );
          }),
          Container(
            padding: EdgeInsets.only(top: 3.w),
            height: 50.w,
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                // getlocationcontroller.fetchLocationforform();

                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return AlertDialog(
                //       titlePadding: EdgeInsets.all(0.w),
                //       title: SizedBox(
                //           height: 600.w,
                //           width: screenwidth - 20.w,
                //           child: ),
                //     );
                //   },
                // );

                Get.to(GoogleMapScreen());

              },
              child: SizedBox(
                width: 40.w,
                height: 40.w,
                child: Image.asset(
                    'asset/png-clipart-google-maps-google-i-o-logo-map-icon-google-map-logo-text-sign.png'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
