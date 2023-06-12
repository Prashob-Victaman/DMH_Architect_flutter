import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmh_architect/Architect/Architectbottomnavigationbar/Architectbottomnavigationbar.dart';
import 'package:dmh_architect/Architect/Architecthomepage/widgets/corouselslider.dart';
import 'package:dmh_architect/Architect/Architecthomepage/widgets/housedesigngridview.dart';
import 'package:dmh_architect/Architect/Architecthomepage/widgets/houserenewgridview.dart';
import 'package:dmh_architect/Architect/Architecthomepage/widgets/reasontoorderhousegridview.dart';
import 'package:dmh_architect/controller/locationcontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../Constants/constants.dart';
import '../ArchitectDrawer/ArchitectDrawerscreen.dart';
import '../widgets/appbar.dart';

class ArchitecthomePage extends StatefulWidget {
  ArchitecthomePage({super.key});

  @override
  State<ArchitecthomePage> createState() => _ArchitecthomePageState();

  var location;
}

class _ArchitecthomePageState extends State<ArchitecthomePage> {
  final getcontroller = Get.put(LocationController());

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ArchitectDrawerscreen(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.w),
        child: const appbar(),
      ),
      body: ListView(
        children: [
          const Carouselslider(),
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("ArchitectData")
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const CircularProgressIndicator();
                }
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final data = snapshot.data;
                // print(data!['ProfileDetails']);

                // final Username = data!['ProfileDetails']['firstName'];

                // print(Username);

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Text(
                    'Hi ${data!['name']}..! How Have you been',
                    style: bold13,
                  ),
                );
              }),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: FutureBuilder(
                future: getcontroller.fetchLocation(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(
                      'Location Loading...',
                      style: normal14,
                    );
                  }
                  if (!snapshot.hasData) {
                    return Text(
                      'Location Loading...',
                      style: normal14,
                    );
                  }
                  log(snapshot.data!.toString());
                  return Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 15.sp,
                        color: kbluecolor,
                      ),
                      Text(
                        // widget.location,

                        '${snapshot.data}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14.sp, color: kbluecolor),
                      ),
                    ],
                  );
                }),
          ),
          heigh10,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: Text(
              'Let\'s get your house design',
              style: bold18,
            ),
          ),
          housedesigngridview(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Architectbottomnavigationbar(selectedindex: 1))),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.w),
                  color: kprimarycolor,
                ),
                height: 40.w,
                child: Center(
                  child: Text(
                    'View All Designs',
                    style: TextStyle(fontSize: 16.sp, color: kwhitecolor),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.w),
            child: Text(
              'If it\'s a house we will renew it',
              style: bold18,
            ),
          ),
          const houserenewgridview(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.w),
            child: Text(
              'Reason To Order House Designs',
              style: bold18,
            ),
          ),
          const reasontoorderhousegridview(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.w),
            child: Text(
              'Refer and Earn',
              style: bold18,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: Container(
              height: 125.w,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('asset/refer_image.png')),
                  borderRadius: BorderRadius.circular(10.w),
                  color: kgreycolor),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.w),
            child: GestureDetector(
              onTap: () {
                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (context) {
                      return Center(child: const CircularProgressIndicator());
                    });

                Share.share(
                    'Download Design My House https://play.google.com/store/apps/details?id=com.victaman.designmyhouse');
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.w),
                  color: kprimarycolor,
                ),
                height: 40.w,
                child: Center(
                  child: Text(
                    'Invite Now',
                    style: TextStyle(fontSize: 16.sp, color: kwhitecolor),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
