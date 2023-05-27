import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../model/notificationModel.dart';

import '../../Constants/constants.dart';

class ArchitectnotificationScreen extends StatelessWidget {
  ArchitectnotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.view_headline,
                  size: 35,
                  color: kblackcolor,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          backgroundColor: kwhitecolor,
          title: Container(
              height: 45.w,
              width: 220.w,
              child: Image.asset('asset/Logo-03.png')),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("Notifications")
                .orderBy("sortid", descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.data == null) {
                return Center(child: CircularProgressIndicator());
              }
              int notificationsCount = snapshot.data!.size;

              return ListView(
                padding: EdgeInsets.all(10.w),
                children: [
                  Container(
                    width: screenwidth,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Icon(
                            Icons.arrow_back,
                            size: 25.w,
                          ),
                        ),
                        Text(
                          'Notification',
                          style: normal16,
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  heigh10,
                  Container(
                    child: notificationsCount == 0
                        ? Container(
                            child: Center(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: screenheight / 2 - 170.w,
                                  ),
                                  Icon(
                                    Icons.notifications_none,
                                    size: 100.sp,
                                    color: kprimarycolor,
                                  ),
                                  Text(
                                    'No Notification',
                                    style: bold18,
                                  ),
                                ],
                              ),
                            ),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemBuilder: (context, index) {
                              final data = notificationModel
                                  .fromJson(snapshot.data!.docs[index].data());

                              return notificationtab(
                                screenwidth: screenwidth,
                                notificationsData: data,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider();
                            },
                            itemCount: notificationsCount),
                  ),
                ],
              );
            }));
  }
}

class notificationtab extends StatelessWidget {
  notificationModel notificationsData;
  notificationtab(
      {super.key, required this.screenwidth, required this.notificationsData});

  final double screenwidth;

  @override
  Widget build(BuildContext context) {
    Timestamp timestamp = notificationsData.time;
    DateTime dateTime = timestamp.toDate();
    DateTime currentTime = DateTime.now();
    Duration timeDif = currentTime.difference(dateTime);
    return SizedBox(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.w),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(notificationsData.imgUrl))),
            height: 50.w,
            width: 50.w,
          ),
          width10,
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${notificationsData.title}',
                  overflow: TextOverflow.ellipsis,
                  style: normal16,
                ),
                Text(
                  timeDif.inSeconds < 60
                      ? '${timeDif.inSeconds} seconds ago'
                      : timeDif.inMinutes < 60
                          ? '${timeDif.inMinutes} min ago'
                          : '${timeDif.inHours} hour ago',
                  style: TextStyle(fontSize: 12.sp, color: kgreycolor),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
