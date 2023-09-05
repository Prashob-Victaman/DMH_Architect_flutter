import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/MyServices/UploadWorkFiles.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/OrdrHistory/orderHistory.dart';
import 'package:dmh_architect/model/OrderServiceModel.dart';
import 'package:dmh_architect/model/orderDataModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Constants/constants.dart';
import '../../../controller/ordercontroller.dart';

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

    final screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
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

            //print(snapshot.data['serviceOrderHistory'].length);
            // List selectedServicesList = orderData.servicesSelectedModel;

            var orderHistoryLength;
            try {
              if (snapshot.data['serviceOrderHistory'].length == 0) {
                orderHistoryLength = 0;
              } else {
                orderHistoryLength =
                    snapshot.data['serviceOrderHistory'].length;
              }
            } catch (e) {
              orderHistoryLength = 0;
            }

            return ListView(
              children: [
                heigh10,
                Text(
                  'My Services',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: kprimarycolor),
                  textAlign: TextAlign.center,
                ),
                heigh10,
                orderHistoryLength == 0
                    ? Container(
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: screenheight / 2 - 150.h,
                              ),
                              Icon(
                                Icons.description_sharp,
                                size: 100.sp,
                                color: kprimarycolor,
                              ),
                              Text(
                                'No service pending',
                                style: bold18,
                              ),
                            ],
                          ),
                        ),
                      )
                    : ListView.separated(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context, index) {
                          index = orderHistoryLength - index - 1;
                          OrderServiceModel orderData;
                          try {
                            orderData = OrderServiceModel.fromJson(snapshot.data['serviceOrderHistory'][index]);
                          } catch (e) {
                            // print(e);
                            return const SizedBox();
                          }

                          String formatedDate =
                              DateFormat("dd-MMM-yyyy   hh:mm a")
                                  .format(orderData.orderDatetime.toDate());

                          String formattedDeliveryDate =
                              DateFormat('yyyy-MM-dd')
                                  .format((orderData.deliveryDate.toDate()));

                          // print(deliveryDate);

                          return StreamBuilder(

                            builder: (context,ordersnapshot) {


                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.0.w,
                                ),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                          Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.to(
                                                  OrderHistoryUser(
                                                    dateTime: orderData
                                                        .orderDatetime
                                                        .toDate(),
                                                    orderId: orderData.orderId,
                                                    imageUrlList: [],
                                                    architectName:
                                                        orderData.architectName,
                                                    orderUid: orderData.orderUid,
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.redAccent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.sp)),
                                                height: 25.w,
                                                width: 100.w,
                                                child: Center(
                                                  child: Text(
                                                    'View Details',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 12.sp),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      heigh5,
                                      IgnorePointer(
                                        ignoring: orderData.isDeliverer,
                                        child: Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5.w),
                                                  color: kwhitecolor),
                                              padding: EdgeInsets.only(left: 0.w),
                                              width: 140.w,
                                              height: 90.w,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        orderData.servicesname,
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                                        '${formattedDeliveryDate}',
                                                        style: normal14,
                                                      ),

                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: List.generate(5 , (changeIndex) {
                                                          return Padding(
                                                            padding: EdgeInsets.only(right: 2.w),
                                                            child: Container(
                                                              height: 20,
                                                              width: 20,
                                                              decoration: BoxDecoration(
                                                                color: changeIndex <2
                                                                    ? Colors.green
                                                                    : Colors.grey.shade400,
                                                                borderRadius: BorderRadius.circular(10),
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  '${changeIndex + 1}',
                                                                  style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            width5,
                                            Container(

                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5.w),
                                                  color: kwhitecolor),



                                              width: 140.w,
                                              height: 90.w,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Spacer(),
                                                  Text(
                                                    'Recieved Amount',
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        color: ksuccesscolor),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  Text(
                                                    'Rs ${orderData.amount.toStringAsFixed(2)}',
                                                    style: bold16,
                                                  ),
                                                  serviceListItems.indexOf(orderData
                                                                  .servicesname) !=
                                                              9 &&
                                                          serviceListItems.indexOf(
                                                                  orderData
                                                                      .servicesname) !=
                                                              10
                                                      ? orderData.isDeliverer == true
                                                          ? Text(
                                                              'Delivered',
                                                              style: TextStyle(
                                                                  color: Colors.green,
                                                                  fontSize: 14.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )
                                                          : Text(
                                                              'Not Delivered',
                                                              style: TextStyle(
                                                                color: kredcolor,
                                                                fontSize: 14.sp,
                                                              ),
                                                            )
                                                      : const SizedBox(),
                                                  const Spacer(),
                                                  serviceListItems.indexOf(orderData
                                                                  .servicesname) !=
                                                              9 &&
                                                          serviceListItems.indexOf(
                                                                  orderData
                                                                      .servicesname) !=
                                                              10
                                                      ? GestureDetector(
                                                          onTap: () {
                                                            showDialog<void>(
                                                              context: context,
                                                              barrierDismissible:
                                                                  false,
                                                              builder: (BuildContext
                                                                  context) {
                                                                return AlertDialog(
                                                                  titlePadding:
                                                                      EdgeInsets.all(
                                                                          0.w),
                                                                  title: Column(
                                                                    children: [
                                                                      UploadWorkFiles(
                                                                          orderData:
                                                                              orderData,
                                                                          screenWidth:
                                                                              screenWidth,
                                                                          orderUid:
                                                                              orderData
                                                                                  .orderUid,
                                                                          requirementList:
                                                                              orderData
                                                                                  .requirementData,
                                                                          serviceIndex:
                                                                              index),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                          child: Container(
                                                              alignment:
                                                                  Alignment.center,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .vertical(
                                                                        bottom: Radius
                                                                            .circular(
                                                                                5.w),
                                                                      ),
                                                                      color:
                                                                          kprimarycolor),
                                                              width: 140.w,
                                                              height: 20.w,
                                                              child: Text(
                                                                'Upload Files',
                                                                style: TextStyle(
                                                                    color:
                                                                        kwhitecolor,
                                                                    fontSize: 12.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              )))
                                                      : GestureDetector(
                                                          onTap: () async {
                                                            var mysnap =
                                                                await FirebaseFirestore
                                                                    .instance
                                                                    .collection(
                                                                        'orderData')
                                                                    .doc(orderData
                                                                        .orderUid)
                                                                    .get();
                                                            OrderDataModel order =
                                                                OrderDataModel
                                                                    .fromJson(mysnap);

                                                            double
                                                                destinationLatitude =
                                                                order
                                                                    .constomerLocation
                                                                    .latitude;
                                                            double
                                                                destinationLongitude =
                                                                order
                                                                    .constomerLocation
                                                                    .longitude;
                                                            openGoogleMapsApp(
                                                                destinationLatitude,
                                                                destinationLongitude);
                                                          },
                                                          child: Container(
                                                              alignment:
                                                                  Alignment.center,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .vertical(
                                                                        bottom: Radius
                                                                            .circular(
                                                                                5.w),
                                                                      ),
                                                                      color:
                                                                          kprimarycolor),
                                                              width: 140.w,
                                                              height: 20.w,
                                                              child: Text(
                                                                'Direction',
                                                                style: TextStyle(
                                                                    color:
                                                                        kwhitecolor,
                                                                    fontSize: 12.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              )),
                                                        ),
                                                  // error starts
                                                ],
                                              ),
                                            ),
                                            const Spacer(),
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5.w),
                                                  color: kashcolor),
                                              width: 60.w,
                                              height: 90.w,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () async {
                                                      var userdata =
                                                          await FirebaseFirestore
                                                              .instance
                                                              .collection('UserData')
                                                              .doc(orderData
                                                                  .customerUid)
                                                              .get();

                                                      if (!await launchUrl(Uri.parse(
                                                          'tel:+91${userdata['ProfileDetails']['mobileNumber']}'))) {
                                                        throw Exception(
                                                            'Could not launch');
                                                      }
                                                    },
                                                    child: const Icon(
                                                      Icons.call,
                                                      color: Color.fromARGB(
                                                          255, 0, 140, 255),
                                                    ),
                                                  ),
                                                  // heigh5,
                                                  GestureDetector(
                                                    onTap: () async {
                                                      var userdata =
                                                          await FirebaseFirestore
                                                              .instance
                                                              .collection('UserData')
                                                              .doc(orderData
                                                                  .customerUid)
                                                              .get();
                                                      if (!await launchUrl(Uri.parse(
                                                          'whatsapp://send?phone=+91${userdata['ProfileDetails']['mobileNumber']}'))) {
                                                        throw Exception(
                                                            'Could not launch');
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
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 10.w,
                          );
                        },
                        itemCount: orderHistoryLength),
              ],
            );
          },
        ),
      ),
    );
  }

  void openGoogleMapsApp(
      double destinationLatitude, double destinationLongitude) async {
    String googleMapsUrl =
        "https://www.google.com/maps/search/?api=1&query=$destinationLatitude,$destinationLongitude";

    if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not open Google Maps.';
    }
  }
}
