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
import '../../../Gupshup/gupshuptemplates.dart';
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
          stream: FirebaseFirestore.instance.collection('ArchitectData').doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),
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
                orderHistoryLength = snapshot.data['serviceOrderHistory'].length;
              }
            } catch (e) {
              orderHistoryLength = 0;
            }

            return ListView(
              children: [
                heigh10,
                Text(
                  'My Services',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: kprimarycolor),
                  textAlign: TextAlign.center,
                ),
                heigh10,
                if (orderHistoryLength == 0)
                  Container(
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
                else
                  ListView.separated(
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
                        int serviceIndex = serviceListItems.indexOf(orderData.servicesname);

                        String formatedDate = DateFormat("dd-MMM-yyyy   hh:mm a").format(orderData.orderDatetime.toDate());

                        String formattedDeliveryDate = DateFormat('yyyy-MM-dd').format((orderData.deliveryDate.toDate()));

                        // print(deliveryDate);

                        return StreamBuilder(
                            stream: FirebaseFirestore.instance.collection("orderData").doc(orderData.orderUid).snapshots(),
                            builder: (context, ordersnapshot) {
                              OrderDataModel data;
                              try {
                                data = OrderDataModel.fromJson(ordersnapshot.data!);
                              } catch (e) {
                                print(e);
                                return const SizedBox();
                              }

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
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Order ID: DMH${orderData.orderId}',
                                                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: kblackcolor),
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
                                                  () => OrderHistoryUser(
                                                    dateTime: orderData.orderDatetime.toDate(),
                                                    orderId: orderData.orderId,
                                                    imageUrlList: [],
                                                    architectName: orderData.architectName,
                                                    orderUid: orderData.orderUid,
                                                    index: 0,
                                                    orderList: [],
                                                    userUid: '',
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(5.sp)),
                                                height: 25.w,
                                                width: 100.w,
                                                child: Center(
                                                  child: Text(
                                                    'View Details',
                                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12.sp),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      heigh5,
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.w), color: kwhitecolor),
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
                                                      orderData.servicesname,
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: kprimarycolor),
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
                                                    serviceIndex == 9 || serviceIndex == 10
                                                        ? orderData.isDeliverer
                                                            ? const Text(
                                                                'FINISHED',
                                                                style: TextStyle(color: Colors.grey),
                                                              )
                                                            : GestureDetector(
                                                                onTap: () async {
                                                                  print(orderData.orderUid);
                                                                  print(data.servicesSelectedModel[9]['planurl']);
                                                                  confirmOtp(index, orderData, data.servicesSelectedModel[9]['planurl']['0'][0]);
                                                                },
                                                                child: Container(
                                                                  width: 100.w,
                                                                  height: 20.w,
                                                                  decoration:
                                                                      BoxDecoration(color: kprimarycolor, borderRadius: BorderRadius.circular(6.sp)),
                                                                  child: Center(
                                                                    child: Text(
                                                                      'Verify OTP',
                                                                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                        : Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: List.generate(serviceIndex == 0 ? 5 : 2, (changeIndex) {
                                                              return Padding(
                                                                padding: EdgeInsets.only(right: 2.w),
                                                                child: GestureDetector(
                                                                  onTap: () {},
                                                                  child: Container(
                                                                    height: 20,
                                                                    width: 20,
                                                                    decoration: BoxDecoration(
                                                                      color: orderData.numberOfchangesDone == changeIndex
                                                                          ? orderData.isDeliverer == false
                                                                              ? Colors.red
                                                                              : Colors.green
                                                                          : changeIndex < orderData.numberOfchangesDone
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
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.w), color: kwhitecolor),
                                            width: 140.w,
                                            height: 90.w,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                const Spacer(),
                                                orderData.numberOfchangesDone == 0
                                                    ? Column(
                                                        children: [
                                                          Text(
                                                            'Recieved Amount',
                                                            style: TextStyle(fontSize: 14.sp, color: ksuccesscolor),
                                                            textAlign: TextAlign.center,
                                                          ),
                                                          Text(
                                                            'Rs ${orderData.amount.toStringAsFixed(2)}',
                                                            style: bold16,
                                                          ),
                                                        ],
                                                      )
                                                    : Column(
                                                        children: [
                                                          Text(
                                                            'Recieved',
                                                            style: TextStyle(fontSize: 14.sp, color: ksuccesscolor),
                                                            textAlign: TextAlign.center,
                                                          ),
                                                          Text(
                                                            'Change',
                                                            style: bold16,
                                                          ),
                                                        ],
                                                      ),

                                                serviceListItems.indexOf(orderData.servicesname) != 9 &&
                                                        serviceListItems.indexOf(orderData.servicesname) != 10
                                                    ? orderData.isDeliverer == true
                                                        ? Text(
                                                            'Delivered',
                                                            style: TextStyle(color: Colors.green, fontSize: 14.sp, fontWeight: FontWeight.bold),
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
                                                serviceListItems.indexOf(orderData.servicesname) != 9 &&
                                                        serviceListItems.indexOf(orderData.servicesname) != 10
                                                    ? orderData.isDeliverer == false
                                                        ? GestureDetector(
                                                            onTap: () {
                                                              showDialog<void>(
                                                                context: context,
                                                                barrierDismissible: false,
                                                                builder: (BuildContext context) {
                                                                  return AlertDialog(
                                                                    titlePadding: EdgeInsets.all(0.w),
                                                                    title: Column(
                                                                      children: [
                                                                        UploadWorkFiles(
                                                                            orderData: orderData,
                                                                            screenWidth: screenWidth,
                                                                            orderUid: orderData.orderUid,
                                                                            requirementList: orderData.requirementData,
                                                                            serviceIndex: index),
                                                                      ],
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
                                                                  'Upload Files',
                                                                  style: TextStyle(color: kwhitecolor, fontSize: 12.sp, fontWeight: FontWeight.bold),
                                                                )))
                                                        : GestureDetector(
                                                            onTap: () {
                                                              showDialog<void>(
                                                                context: context,
                                                                barrierDismissible: false,
                                                                builder: (BuildContext context) {
                                                                  return AlertDialog(
                                                                    titlePadding: EdgeInsets.all(0.w),
                                                                    title: Column(
                                                                      children: [
                                                                        UploadWorkFiles(
                                                                            orderData: orderData,
                                                                            screenWidth: screenWidth,
                                                                            orderUid: orderData.orderUid,
                                                                            requirementList: orderData.requirementData,
                                                                            serviceIndex: index),
                                                                      ],
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
                                                                    color: Colors.lightBlue[300]),
                                                                width: 140.w,
                                                                height: 20.w,
                                                                child: Text(
                                                                  'Edit Files',
                                                                  style: TextStyle(color: kwhitecolor, fontSize: 12.sp, fontWeight: FontWeight.bold),
                                                                )),
                                                          )
                                                    : GestureDetector(
                                                        onTap: () async {
                                                          var mysnap =
                                                              await FirebaseFirestore.instance.collection('orderData').doc(orderData.orderUid).get();
                                                          OrderDataModel order = OrderDataModel.fromJson(mysnap);

                                                          double destinationLatitude = order.constomerLocation.latitude;
                                                          double destinationLongitude = order.constomerLocation.longitude;
                                                          openGoogleMapsApp(destinationLatitude, destinationLongitude);
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
                                                              'Direction',
                                                              style: TextStyle(color: kwhitecolor, fontSize: 12.sp, fontWeight: FontWeight.bold),
                                                            )),
                                                      ),
                                                // error starts
                                              ],
                                            ),
                                          ),
                                          const Spacer(),
                                          Container(
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.w), color: kashcolor),
                                            width: 60.w,
                                            height: 90.w,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                GestureDetector(
                                                  onTap: () async {
                                                    var userdata =
                                                        await FirebaseFirestore.instance.collection('UserData').doc(orderData.customerUid).get();

                                                    if (!await launchUrl(Uri.parse('tel:+91${userdata['ProfileDetails']['mobileNumber']}'))) {
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
                                                    var userdata =
                                                        await FirebaseFirestore.instance.collection('UserData').doc(orderData.customerUid).get();
                                                    if (!await launchUrl(
                                                        Uri.parse('whatsapp://send?phone=+91${userdata['ProfileDetails']['mobileNumber']}'))) {
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
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
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

  void openGoogleMapsApp(double destinationLatitude, double destinationLongitude) async {
    String googleMapsUrl = "https://www.google.com/maps/search/?api=1&query=$destinationLatitude,$destinationLongitude";

    if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not open Google Maps.';
    }
  }

  confirmOtp(index, OrderServiceModel orderData, ogotp) {
    TextEditingController otpController = TextEditingController();
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(0.w),
          title: Container(
            height: 144.w,
            width: 282.w,
            child: Column(
              children: [
                Spacer(),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Please Enter OTP to Close this Service',
                    style: TextStyle(fontSize: 14.sp, color: kblackcolor, fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
                Container(
                  width: 120.w,
                  height: 30.w,
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      controller: otpController,
                      style: normal16,
                      textAlignVertical: TextAlignVertical.top,
                      // controller: mobilecontroller,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 14.w),
                        hintText: 'Enter OTP',
                        hintStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                        labelStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                        border: InputBorder.none,
                        // border: const OutlineInputBorder(),
                        // labelText: 'Email',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    finishDirection(index, orderData, otpController.text, ogotp);

                    //print(orderData.toString());
                  },
                  child: Container(
                    height: 30.w,
                    width: 60.w,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.sp), color: kprimarycolor),
                    child: Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(fontSize: 12.sp, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }

  finishDirection(index, orderData, inputOtp, ogotp) async {
    if (ogotp == inputOtp) {
      final documentReference = await FirebaseFirestore.instance.collection('ArchitectData').doc(FirebaseAuth.instance.currentUser!.uid);
      await documentReference.update({'dashboardData.deliveredServices': FieldValue.increment(1)});

      await FirebaseFirestore.instance.collection('ArchitectData').doc(FirebaseAuth.instance.currentUser!.uid).get().then((documentSnapshot) {
        if (documentSnapshot.exists) {
          Map<String, dynamic>? documentData = documentSnapshot.data();

          // Modify the desired string value
          documentData!['serviceOrderHistory'][index]['isDeliverer'] = true;

          FirebaseFirestore.instance
              .collection('ArchitectData')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .set(documentData)
              .then((value) => print('Value updated successfully.1'))
              .catchError((error) => print('Error updating value: $error'));
        } else {
          print('Document does not exist.');
        }
      });
      await FirebaseFirestore.instance.collection('orderData').doc(orderData.orderUid).get().then((documentSnapshot) {
        if (documentSnapshot.exists) {
          Map<String, dynamic>? documentData = documentSnapshot.data();

          int serviceNameIndex = serviceListItems.indexOf(orderData.servicesname);
          // print(serviceNameIndex.toString());

          documentData!['servicesSelectedModel'][serviceNameIndex]['requestChange'] = false;
          documentData['servicesSelectedModel'][serviceNameIndex]['planurl']['0'] = [];
          documentData['servicesSelectedModel'][serviceNameIndex]['isCompleted'] = true;
          documentData['servicesSelectedModel'][serviceNameIndex]['isPaid'] = false;

          // Update the document with the modified array
          FirebaseFirestore.instance
              .collection('orderData')
              .doc(orderData.orderUid)
              .set(documentData)
              .then((value) => print('Value updated successfully.1'))
              .catchError((error) => print('Error updating value: $error'));
          print(orderData.orderUid);
          // print(widget.architectUid);
        } else {
          print('Document does not exist.');
        }
      });
      // print(orderData.customerUid);
      Fluttertoast.showToast(msg: 'OTP verified successfully');
      Get.back();
      await FirebaseFirestore.instance.collection('UserData').doc(orderData.customerUid).get().then((documentSnapshot) {
        if (documentSnapshot.exists) {
          Map<String, dynamic>? documentData = documentSnapshot.data();
          costomerOrderUpdated(documentData!['ProfileDetails']['mobileNumber'],
              documentData!['ProfileDetails']['firstName'] + ' ' + documentData!['ProfileDetails']['lastName'], orderData.orderId);
          // print('sms sent');
        }
      });
    } else {
      Fluttertoast.showToast(msg: 'Invalid OTP');
    }
  }
}
