import 'package:dmh_architect/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestWidget extends StatelessWidget {
  Map requestList;
  RequestWidget(
      {super.key, required this.screenWidth, required this.requestList});

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    // print(requestList['isPaidNaksha']);
    return Padding(
      padding: EdgeInsets.all(10.0.w),
      child: Container(
        width: screenWidth,
        // height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.w), color: kashcolor),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: screenWidth,
              height: 30.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.w), color: kgreycolor),
              child: Text(
                'Request',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    color: kwhitecolor),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.w),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 5.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.w),
                        color: kwhitecolor),
                    width: (screenWidth / 2) - 25.w,
                    height: 70.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Site Supervision',
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.info,
                              size: 18.sp,
                            )
                          ],
                        ),
                        SizedBox(
                          // width: (screenWidth / 2) ,
                          child: Text(
                            'Rs ${requestList['superVisionAmount']} ',
                            style: TextStyle(fontSize: 13.sp),
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 20,
                          decoration: BoxDecoration(
                            color: requestList['isPaidSupervision'] == false
                                ? kprimarycolor
                                : ksuccesscolor,
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(5.w)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              requestList['isPaidSupervision'] == false
                                  ? Text(
                                      'Payment Pending',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: kwhitecolor,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      'Paid',
                                      style: TextStyle(
                                          fontSize: 12.sp, color: kwhitecolor),
                                    ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  width10,
                  Container(
                    padding: EdgeInsets.only(top: 5.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.w),
                        color: kwhitecolor),
                    width: (screenWidth / 2) - 25.w,
                    height: 70.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Naksha Layout',
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.info,
                              size: 18.sp,
                            )
                          ],
                        ),
                        SizedBox(
                          // width: (screenWidth / 2) ,
                          child: Text(
                            'Rs ${requestList['nakshaAmount']}',
                            style: TextStyle(fontSize: 13.sp),
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 20,
                          decoration: BoxDecoration(
                            color: requestList['isPaidNaksha'] == false
                                ? kprimarycolor
                                : ksuccesscolor,
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(5.w)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              requestList['isPaidNaksha'] == false
                                  ? Text(
                                      'Payment Pending',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: kwhitecolor,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      'Paid',
                                      style: TextStyle(
                                          fontSize: 12.sp, color: kwhitecolor),
                                    ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
