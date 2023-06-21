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

  // int? totalDesigns = 0;
  // int? totalOrders = 0;
  // int? totalpendingOrders;
  // int? rejectedOrders;
  // int? totalEarnings;
  // int? deliveredOrders;
}

class _ArchitecthomePageState extends State<ArchitecthomePage> {
  final getcontroller = Get.put(LocationController());

  @override
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;

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
                  return SizedBox(
                      height: 10.w,
                      width: 10.w,
                      child: const CircularProgressIndicator());
                }
                if (!snapshot.hasData) {
                  return Center(
                      child: SizedBox(
                          height: 10.w,
                          width: 10.w,
                          child: const CircularProgressIndicator()));
                }

                final data = snapshot.data;
                final totalDesigns = data!['myDesigns'].length;

                final totalOrders = data['orders'].length;
                final totalEarnings = data['totalEarnings'];

                // print(data!['ProfileDetails']);

                // final Username = data!['ProfileDetails']['firstName'];

                // print(Username);

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi ${data['name']}..! How Have you been',
                        style: bold13,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0.0.w),
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
                                    style: TextStyle(
                                        fontSize: 14.sp, color: kbluecolor),
                                  ),
                                ],
                              );
                            }),
                      ),
                      Container(
                        // padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.w),
                        ),
                        width: screenwidth,
                        // height: 280.w,
                        child: Column(
                          children: [
                            // heigh10,
                            // Container(
                            //   width: screenwidth - 20.w,
                            //   height: 50.w,
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(5.w),
                            //       color: kprimarycolor),
                            // ),
                            heigh10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DashboardWidget(
                                    screenwidth: screenwidth,
                                    title: 'Total Designs',
                                    subtitle: totalDesigns.toString()),
                                DashboardWidget(
                                    screenwidth: screenwidth,
                                    title: 'Total Orders',
                                    subtitle: totalOrders.toString()),
                              ],
                            ),
                            heigh10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DashboardWidget(
                                    screenwidth: screenwidth,
                                    title: 'Pending Orders',
                                    subtitle: '10'),
                                DashboardWidget(
                                    screenwidth: screenwidth,
                                    title: 'Rejected Orders',
                                    subtitle: '10'),
                              ],
                            ),
                            heigh10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DashboardWidget(
                                    screenwidth: screenwidth,
                                    title: 'Total Earnings',
                                    subtitle: totalEarnings.toString()
                                ),
                                DashboardWidget(
                                    screenwidth: screenwidth,
                                    title: 'Delivered Orders',
                                    subtitle: '10'),
                              ],
                            ),
                            heigh10
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
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
                      return const Center(child: CircularProgressIndicator());
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

class DashboardWidget extends StatelessWidget {
  String title;
  String subtitle;
  DashboardWidget({
    super.key,
    required this.screenwidth,
    required this.title,
    required this.subtitle,
  });

  final double screenwidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w),
      width: screenwidth / 2 - 15.w,
      height: 65.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.w), color: kashcolor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: normal18,
          ),
          Text(
            subtitle,
            style: bold22,
          )
        ],
      ),
    );
  }
}
