import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../Constants/constants.dart';
import '../../controller/drawercontroller.dart';
import '../notification/notification.dart';

class ArchitectDrawerscreen extends StatelessWidget {
  ArchitectDrawerscreen({super.key});

  final getcontroller = Get.put(drawercontroller());

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;

    return Drawer(
      width: screenwidth,
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(10.w),
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              height: 89,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.w),
                  color: kprimarycolor),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("ArchitectData")
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return SizedBox(
                        height: 19.w,
                      );
                    }
                    if (!snapshot.hasData) {
                      return Center(
                          child: SizedBox(
                        height: 19.w,
                      ));
                    }

                    final data = snapshot.data;

                    final Username = data!['name'];
                    final email = data['email'];

                    return GestureDetector(
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 26.w,
                            child: Image.asset('asset/user.png'),
                          ),
                          width10,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Username,
                                style: TextStyle(
                                  fontSize: 16.w,
                                  color: kwhitecolor,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis, // new
                                ),
                              ),
                              Text(
                                email,
                                style: TextStyle(
                                  fontSize: 14.w,
                                  color: kwhitecolor,
                                  overflow: TextOverflow.ellipsis, // new
                                ),
                              )
                            ],
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: Icon(
                              Icons.close,
                              color: kwhitecolor,
                              size: 25.sp,
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, top: 20.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.account_circle_rounded),
                      width10,
                      Text(
                        'My Designs',
                        style: normal16,
                      )
                    ],
                  ),
                  heigh20,
                  Row(
                    children: [
                      Icon(Icons.location_city),
                      width10,
                      Text(
                        'Address',
                        style: normal16,
                      )
                    ],
                  ),
                  heigh20,
                  GestureDetector(
                    onTap: (){
                      showDialog(
                          barrierDismissible: true,
                          context: context, builder: (context){
                        return Center(child: const CircularProgressIndicator());
                      });

                      Share.share('check out my website https://example.com');
                    },
                    child: Row(
                      children: [
                        Icon(Icons.account_tree),
                        width10,
                        Text(
                          'Refer a Friend',
                          style: normal16,
                        )
                      ],
                    ),
                  ),
                  heigh20,
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationScreen()),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.notifications),
                        width10,
                        Text(
                          'Notification',
                          style: normal16,
                        )
                      ],
                    ),
                  ),
                  heigh20,
                  Row(
                    children: [
                      Icon(Icons.info),
                      width10,
                      Text(
                        'About App',
                        style: normal16,
                      )
                    ],
                  ),
                  heigh20,
                  GestureDetector(
                    onTap: () => showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          titlePadding: EdgeInsets.all(0.w),
                          title: Container(
                            height: 114.w,
                            width: 282.w,
                            child: Column(
                              children: [
                                Container(
                                    alignment: Alignment.center,
                                    height: 84.w,
                                    child: Text(
                                      'Call Support Helpline Number',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color: kblackcolor,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Spacer(),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: ()async{
                                        const number = '+919008337447'; //set the number here
                                        bool? res = await FlutterPhoneDirectCaller.callNumber(number);
                                        print(res);
                                      },
                                      child: Container(
                                        height: 30.w,
                                        width: 141.w,
                                        decoration: BoxDecoration(
                                            color: kprimarycolor),
                                        child: Center(
                                            child: Text(
                                              'Yes',
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: kwhitecolor),
                                            )),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => Get.back(),
                                      child: Container(
                                        height: 30.w,
                                        width: 141.w,
                                        decoration: BoxDecoration(
                                            color: kwhitecolor,
                                            border: Border.all(
                                                color: kprimarycolor)),
                                        child: Center(
                                            child: Text(
                                              'Cancel',
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: kprimarycolor),
                                            )),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.call),
                        width10,
                        Text(
                          'Support',
                          style: normal16,
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
