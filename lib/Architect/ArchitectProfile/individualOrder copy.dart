import 'package:dmh_architect/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class individualOrderUser extends StatelessWidget {
  const individualOrderUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(10.w),
          children: [
            Row(
              children: [
                const Spacer(),
                Text(
                  'Order Status',
                  style: bold18,
                ),
                const Spacer()
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, top: 20.w),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    circleandtext(title: 'Order Pending', isDone: true),
                    Row(
                      children: [
                        SizedBox(
                          width: 9.w,
                        ),
                        Container(
                          height: 10.w,
                          width: 2.w,
                          color: kprimarycolor,
                        ),
                      ],
                    ),
                    circleandtext(title: 'Order Confirmed', isDone: true),
                    Row(
                      children: [
                        SizedBox(
                          width: 9.w,
                        ),
                        Container(
                          height: 10.w,
                          width: 2.w,
                          color: kprimarycolor,
                        ),
                      ],
                    ),
                    circleandtext(title: 'Pay Rs 5000.00', isDone: true),
                    Row(
                      children: [
                        SizedBox(
                          width: 9.w,
                        ),
                        Container(
                          height: 10.w,
                          width: 2.w,
                          color: kprimarycolor,
                        ),
                      ],
                    ),
                    circleandtext(title: 'Payed Rs 5000.00', isDone: true),
                    Row(
                      children: [
                        SizedBox(
                          width: 9.w,
                        ),
                        Container(
                          height: 10.w,
                          width: 2.w,
                          color: kprimarycolor,
                        ),
                      ],
                    ),
                    circleandtext(
                        title: 'Upload your Requirements', isDone: true),
                    Row(
                      children: [
                        SizedBox(
                          width: 9.w,
                        ),
                        Container(
                          height: 10.w,
                          width: 2.w,
                          color: kprimarycolor,
                        ),
                      ],
                    ),
                    circleandtext(title: 'Uploaded Requirements', isDone: true),
                    Row(
                      children: [
                        SizedBox(
                          width: 9.w,
                        ),
                        Container(
                          height: 10.w,
                          width: 2.w,
                          color: kprimarycolor,
                        ),
                      ],
                    ),
                    circleandtext(
                        title: 'Your Planing Work in progress', isDone: true),
                    Row(
                      children: [
                        SizedBox(
                          width: 9.w,
                        ),
                        Container(
                          height: 10.w,
                          width: 2.w,
                          color: kprimarycolor,
                        ),
                      ],
                    ),
                    circleandtext(
                        title: 'Expected Delivery On 12-06-2023', isDone: true),
                    Row(
                      children: [
                        SizedBox(
                          width: 9.w,
                        ),
                        Container(
                          height: 10.w,
                          width: 2.w,
                          color: kprimarycolor,
                        ),
                      ],
                    ),
                    circleandtext(title: 'Floor Plan Recieved', isDone: false),
                    Row(
                      children: [
                        SizedBox(
                          width: 9.w,
                        ),
                        Container(
                          height: 10.w,
                          width: 2.w,
                          color: kprimarycolor,
                        ),
                      ],
                    ),
                    circleandtext(title: 'Pay Rs 6000.00', isDone: true),
                    Row(
                      children: [
                        SizedBox(
                          width: 9.w,
                        ),
                        Container(
                          height: 10.w,
                          width: 2.w,
                          color: kprimarycolor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class circleandtext extends StatelessWidget {
  String title;
  bool isDone;
  circleandtext({
    required this.title,
    required this.isDone,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 10.w,
          backgroundColor: kprimarycolor,
          child: CircleAvatar(
            radius: 8.w,
            backgroundColor: isDone == true ? kprimarycolor : kwhitecolor,
            foregroundColor: kpinkcolor,
          ),
        ),
        width10,
        Text(
          title,
          style: TextStyle(
              color: isDone == true ? kblackcolor : kgreycolor,
              fontSize: 18.sp),
        ),
      ],
    );
  }
}
