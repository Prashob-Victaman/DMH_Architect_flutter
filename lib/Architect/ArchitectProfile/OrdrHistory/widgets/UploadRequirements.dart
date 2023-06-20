import 'package:dmh_architect/Architect/ArchitectProfile/OrdrHistory/widgets/customerOrders.dart';
import 'package:dmh_architect/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UploadRequirements extends StatelessWidget {
  UploadRequirements({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  List uploadedData = ['', ''];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0.w),
      child: Container(
        width: screenWidth,
        // height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.w), color: kashcolor),
        child: Column(
          children: [
            GestureDetector(
              // onTap: () => Get.to(CustomerOrders()),
              child: Container(
                alignment: Alignment.center,
                width: screenWidth,
                height: 30.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.w),
                    color: kgreycolor),
                child: Text(
                  'Upload Requirements',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      color: kwhitecolor),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0.w),
              child: Row(
                children: [
                  Container(
                    height: 70.w,
                    width: 60.w,
                    color: kwhitecolor,
                    child: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                  ),
                  width5,
                  Container(
                    height: 90.w,
                    width: 275.w,
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(left: 10.w),
                            color: kashcolor,
                            height: 100.w,

                            // width: screenWidth,w
                            width: 80.w,
                            child: Stack(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  height: 90.w,
                                  width: 70.w,
                                  color: kashcolor,
                                  child: Container(
                                    height: 70.w,
                                    width: 60.w,
                                    color: kwhitecolor,
                                  ),
                                ),
                                Positioned(
                                  left: 35.w,
                                  bottom: 50.w,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.remove_circle)),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 0.w,
                          );
                        },
                        itemCount: uploadedData.length),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
