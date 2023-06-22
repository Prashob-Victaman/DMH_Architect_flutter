import 'package:dmh_architect/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadRequirements extends StatelessWidget {
  List requiredData;
  UploadRequirements({
    super.key,
    required this.screenWidth,
    required this.requiredData,
  });

  final double screenWidth;

  // List uploadedData = ['', ''];

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
                  'View Requirements',
                  style: TextStyle(
                      fontSize: 14.sp,
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
                    height: 90.w,
                    width: 275.w,
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          print(requiredData.length);
                          return Container(
                            padding: EdgeInsets.only(left: 10.w),
                            color: kwhitecolor,
                            height: 90.w,
                            width: 70.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(requiredData[index]))),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 10.w,
                          );
                        },
                        itemCount: requiredData.length),
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
