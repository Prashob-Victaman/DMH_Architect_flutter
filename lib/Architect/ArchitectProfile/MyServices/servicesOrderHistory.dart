import 'package:cloud_firestore/cloud_firestore.dart';
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

          final orderData = OrderServiceModel.fromJson(snapshot.data['serviceOrderHistory'][0]);


          String formatedDate = DateFormat("dd-MMM-yyyy   hh:mm a")
              .format(orderData.orderDatetime.toDate());

          // List selectedServicesList = orderData.servicesSelectedModel;

          return ListView.separated(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
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
                                        orderData.deliveryDate,
                                        style: normal14,
                                      ),
                                    ],
                                  )
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

                                  GestureDetector(
                                    onTap: () async {
                                      orderController.fetchPlanningfile(index);

                                      showDialog<void>(
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
                                                      alignment:
                                                          Alignment.center,
                                                      height: 84.w,
                                                      child: Text(
                                                        'Are you sure you want to Upload?',
                                                        style: TextStyle(
                                                            fontSize: 16.sp,
                                                            color: kblackcolor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  const Spacer(),
                                                  Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () async {
                                                          if (orderController
                                                                      .floorplanUrl[
                                                                  index] !=
                                                              null) {
                                                            final documentReference =
                                                                await FirebaseFirestore
                                                                    .instance
                                                                    .collection(
                                                                        'ArchitectData')
                                                                    .doc(FirebaseAuth
                                                                        .instance
                                                                        .currentUser!
                                                                        .uid);

                                                            await documentReference
                                                                .update({
                                                              'dashboardData.deliveredServices':
                                                                  FieldValue
                                                                      .increment(
                                                                          1),
                                                            });
                                                            await FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'orderData')
                                                                .doc("orderUid!")
                                                                .get()
                                                                .then(
                                                                    (documentSnapshot) {
                                                              if (documentSnapshot
                                                                  .exists) {
                                                                Map<String,
                                                                        dynamic>?
                                                                    documentData =
                                                                    documentSnapshot
                                                                        .data();

                                                                // Modify the desired string value
                                                                documentData!['servicesSelectedModel']
                                                                            [
                                                                            index]
                                                                        [
                                                                        'planurl'] =
                                                                    orderController
                                                                            .floorplanUrl[
                                                                        index];

                                                                documentData[
                                                                            'servicesSelectedModel']
                                                                        [index][
                                                                    'isCompleted'] = true;

                                                                // Update the document with the modified array
                                                                FirebaseFirestore
                                                                    .instance
                                                                    .collection(
                                                                        'orderData').doc(
                                                                        "orderUid!").set(
                                                                        documentData).then((value) =>
                                                                        print('Value updated successfully.')).catchError(
                                                                        (error) =>
                                                                            print('Error updating value: $error'));

                                                                orderController
                                                                        .flooplan[
                                                                    index] = null;
                                                                orderController
                                                                        .floorplanUrl[
                                                                    index] = null;

                                                                // print(widget.architectUid);
                                                              } else {
                                                                print(
                                                                    'Document does not exist.');
                                                              }
                                                              orderController
                                                                      .floorplanUrl[
                                                                  index] = null;
                                                            });

                                                            Get.back();
                                                          } else {
                                                            Fluttertoast.showToast(
                                                                msg:
                                                                    'Loading... Please Wait');
                                                          }
                                                        },
                                                        child: Container(
                                                          height: 30.w,
                                                          width: 141.w,
                                                          decoration:
                                                              const BoxDecoration(
                                                                  color:
                                                                      kprimarycolor),
                                                          child: Center(
                                                              child: Text(
                                                            'Yes',
                                                            style: TextStyle(
                                                                fontSize: 14.sp,
                                                                color:
                                                                    kwhitecolor),
                                                          )),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          if (orderController
                                                                          .floorplanUrl[
                                                                      index] !=
                                                                  null ||
                                                              orderController
                                                                          .flooplan[
                                                                      index] ==
                                                                  null) {
                                                            Get.back();
                                                            orderController
                                                                    .floorplanUrl[
                                                                index] = null;
                                                          } else {
                                                            Fluttertoast.showToast(
                                                                msg:
                                                                    'Please Wait Loading...');
                                                          }
                                                        },
                                                        child: Container(
                                                          height: 30.w,
                                                          width: 141.w,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  kwhitecolor,
                                                              border: Border.all(
                                                                  color:
                                                                      kprimarycolor)),
                                                          child: Center(
                                                              child: Text(
                                                            'Cancel',
                                                            style: TextStyle(
                                                                fontSize: 14.sp,
                                                                color:
                                                                    kprimarycolor),
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
                                      );
                                    },
                                    child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.vertical(
                                              bottom: Radius.circular(5.w),
                                            ),
                                            color: kprimarycolor),
                                        width: 140.w,
                                        height: 20.w,
                                        child: Text(
                                          'Upload File',
                                          style: TextStyle(
                                              color: kwhitecolor,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
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
              itemCount: 1);
        },
      ),
    );
  }
}
