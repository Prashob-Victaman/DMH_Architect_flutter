import 'package:dmh_architect/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';

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
              child: requiredData.isEmpty
                  ? Center(
                      child: SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.hourglass_empty,
                              size: 60.sp,
                              color: kprimarycolor,
                            ),
                            Text(
                              'Empty Requirements',
                              style: bold13,
                            ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 90.w,
                      width: 340.w,
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            // print(requiredData);
                            return Container(
                                // padding: EdgeInsets.only(left: 10.w),
                                color: kwhitecolor,
                                height: 90.w, 
                                width: 70.w,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      PageRouteBuilder(
                                        opaque: false,
                                        pageBuilder:
                                            (BuildContext context, _, __) {
                                          return Scaffold(
                                            backgroundColor: Colors.black,
                                            body: Stack(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Center(
                                                    child: Hero(
                                                      tag: requiredData[index],
                                                      child: PhotoView(
                                                          imageProvider:
                                                              NetworkImage(
                                                                  requiredData[
                                                                      index])),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 20.w,
                                                  right: 20.w,
                                                  child: IconButton(
                                                    onPressed: () =>
                                                        Navigator.pop(context),
                                                    icon: Icon(
                                                      Icons.close,
                                                      color: kwhitecolor,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: Image.network(
                                    requiredData[index],
                                    fit: BoxFit.cover,
                                  ),
                                ));
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 10.w,
                            );
                          },
                          itemCount: requiredData.length),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
