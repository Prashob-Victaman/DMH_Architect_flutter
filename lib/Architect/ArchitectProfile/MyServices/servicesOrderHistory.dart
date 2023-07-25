import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/MyServices/UploadWorkFiles.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/OrdrHistory/widgets/UploadRequirements.dart';
import 'package:dmh_architect/model/OrderServiceModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Constants/constants.dart';
import '../../../controller/OrderServiceHistory/uploadWorkFiles.dart';
import '../../../controller/ordercontroller.dart';
import '../../../model/orderDataModel.dart';

class ServicesOrderHistory extends StatefulWidget {
  const ServicesOrderHistory({Key? key}) : super(key: key);

  @override
  State<ServicesOrderHistory> createState() => _ServicesOrderHistoryState();
}

class _ServicesOrderHistoryState extends State<ServicesOrderHistory> {
  final orderController = Get.put(OrderController());



  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('ArchitectData')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          // List selectedServicesList = orderData.servicesSelectedModel;

          return ListView.separated(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {


                OrderServiceModel orderData = OrderServiceModel.fromJson(
                    snapshot.data['serviceOrderHistory'][index]);
                String formatedDate = DateFormat("dd-MMM-yyyy   hh:mm a")
                    .format(orderData.orderDatetime.toDate());

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.w),
                      color: kashcolor,
                    ),
                    padding: EdgeInsets.all(5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Order ID: DMH${orderData.orderId}',
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                      color: kblackcolor),
                                ),
                                Text(
                                  '${orderData.customerName}',
                                  style: normal14,
                                ),
                                Text(
                                  '${formatedDate}',
                                  style: normal12,
                                ),
                              ],
                            ),
                          ],
                        ),
                        heigh5,
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.w),
                                  color: kwhitecolor),
                              padding: EdgeInsets.only(left: 0.w),
                              width: 140.w,
                              height: 90.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${orderData.servicesname}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            color: kprimarycolor),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Delivery On',
                                        style: normal12,
                                      ),
                                      Text(
                                        DateFormat('yyyy-MM-dd').format(
                                            DateTime.parse(
                                                orderData.deliveryDate)),
                                        style: normal14,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            width5,
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.w),
                                  color: kwhitecolor),
                              width: 140.w,
                              height: 90.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Spacer(),
                                  Text(
                                    'Recieved Amount',
                                    style: TextStyle(
                                        fontSize: 14.sp, color: ksuccesscolor),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    'Rs ${orderData.amount}',
                                    style: bold16,
                                  ),
                                  Text(
                                    'Not Delivered',
                                    style: TextStyle(
                                      color: kredcolor,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  const Spacer(),

                                  // error starts
                                ],
                              ),
                            ),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.w),
                                  color: kashcolor),
                              width: 60.w,
                              height: 90.w,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      var userdata = await FirebaseFirestore
                                          .instance
                                          .collection('UserData')
                                          .doc(orderData.customerUid)
                                          .get();

                                      if (!await launchUrl(Uri.parse(
                                          'tel:+91${userdata['ProfileDetails']['mobileNumber']}'))) {
                                        throw Exception('Could not launch');
                                      }
                                    },
                                    child: const Icon(
                                      Icons.call,
                                      color: Color.fromARGB(255, 0, 140, 255),
                                    ),
                                  ),
                                  // heigh5,
                                  GestureDetector(
                                    onTap: () async {
                                      var userdata = await FirebaseFirestore
                                          .instance
                                          .collection('UserData')
                                          .doc(orderData.customerUid)
                                          .get();
                                      if (!await launchUrl(Uri.parse(
                                          'whatsapp://send?phone=+91${userdata['ProfileDetails']['mobileNumber']}'))) {
                                        throw Exception('Could not launch');
                                      }
                                    },
                                    child: FaIcon(
                                      FontAwesomeIcons.whatsapp,
                                      size: 24.sp,
                                      color: ksuccesscolor,
                                    ),
                                  ),
                                ],
                              ),
                            )

                          ],
                        ),
                        UploadWorkFiles(
                            orderData: orderData,
                            screenWidth: screenWidth,
                            orderUid: orderData.orderUid,
                            requirementList: orderData.requirementData,
                            serviceIndex:index

                        ),

                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10.w,
                );
              },
              itemCount: snapshot.data['serviceOrderHistory'].length);
        },
      ),
    );
  }
}
