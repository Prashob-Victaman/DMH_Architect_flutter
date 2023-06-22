import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/OrdrHistory/widgets/selectedOrderDetails.dart';
import 'package:dmh_architect/Constants/constants.dart';
import 'package:dmh_architect/controller/ordercontroller.dart';
import 'package:dmh_architect/model/orderDataModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomerOrders extends StatelessWidget {
  OrderDataModel orderData;
  String orderUid;
  CustomerOrders({
    super.key,
    // required this.selectedServicesList,
    required this.orderData,
    required this.orderUid,
  });

  // List isaAproved = [true, false, true, false];
  // List isaCompleted = [true, false, false, false];
  // List selectedServiceListfiltered = [];

  TextEditingController deliveryDateController = TextEditingController();

  final formKeydeliveryDate = GlobalKey<FormState>();
  final orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    String formatedDate = DateFormat("dd-MMM-yyyy   hh:mm a")
        .format(orderData.orderDatetime.toDate());

    // for (var item in selectedServicesList) {
    //   if (item['isSelected'] == true) {
    //     selectedServiceListfiltered.add(item);
    //   }
    // }
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("orderData")
                .doc(orderUid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              // final DesignList = snapshot.data!['myDesigns'];

              final data = OrderDataModel.fromJson(snapshot.data!);

              List selectedServicesList = data.servicesSelectedModel;

              return ListView(
                children: [
                  heigh10,
                  Text(
                    'Customer Orders',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: kprimarycolor),
                    textAlign: TextAlign.center,
                  ),
                  heigh10,
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return selectedServicesList[index]['isSelected'] ==
                                false
                            ? const SizedBox()
                            : Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 10.0.w),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.w),
                                    color: kashcolor,
                                  ),
                                  padding: EdgeInsets.all(5.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                '${orderData.architectName}',
                                                style: normal14,
                                              ),
                                              Text(
                                                '${formatedDate}',
                                                style: normal12,
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Column(
                                            children: [
                                              // SizedBox(
                                              //   width: 135.w,
                                              //   height: 30.w,
                                              //   child: ElevatedButton(
                                              //       style: ButtonStyle(
                                              //           backgroundColor:
                                              //               MaterialStateProperty
                                              //                   .all(
                                              //                       kprimarycolor)),
                                              //       onPressed: () {
                                              //         Get.to(() =>
                                              //             const SelectedOrderDetails());
                                              //       },
                                              //       child: Container(
                                              //         // width: 100.w,
                                              //         // height: 40.w,
                                              //         decoration: BoxDecoration(
                                              //             borderRadius:
                                              //                 BorderRadius
                                              //                     .circular(
                                              //                         5.w)),
                                              //         child: Text(
                                              //           'Order Details',
                                              //           style: TextStyle(
                                              //             fontSize: 13.sp,
                                              //             color: kwhitecolor,
                                              //           ),
                                              //         ),
                                              //       )),
                                              // ),
                                              heigh5,
                                              Row(
                                                children: [
                                                  (selectedServicesList[index][
                                                                  'isAproved'] ==
                                                              false &&
                                                          selectedServicesList[
                                                                      index][
                                                                  'isRejected'] ==
                                                              false)
                                                      ? SizedBox(
                                                          width: 65.w,
                                                          height: 25.w,
                                                          child: ElevatedButton(
                                                              style: ButtonStyle(
                                                                  backgroundColor:
                                                                      MaterialStateProperty
                                                                          .all(
                                                                              ksuccesscolor)),
                                                              onPressed: () {
                                                                // print(index);

                                                                if (selectedServicesList[index]
                                                                            [
                                                                            'isAproved'] ==
                                                                        false &&
                                                                    selectedServicesList[index]
                                                                            [
                                                                            'isRejected'] ==
                                                                        false) {
                                                                  orderConfirmationAcceptPopup(
                                                                      context,
                                                                      'Accept',
                                                                      index,
                                                                      'isAproved',
                                                                      true);
                                                                }
                                                              },
                                                              child: Container(
                                                                // width: 100.w,
                                                                // height: 40.w,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.w)),
                                                                child: Text(
                                                                  'Accept',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        10.sp,
                                                                    color:
                                                                        kwhitecolor,
                                                                  ),
                                                                ),
                                                              )),
                                                        )
                                                      : SizedBox(),
                                                  width5,
                                                  (selectedServicesList[index][
                                                                  'isAproved'] ==
                                                              false &&
                                                          selectedServicesList[
                                                                      index][
                                                                  'isRejected'] ==
                                                              false)
                                                      ? SizedBox(
                                                          width: 65.w,
                                                          height: 25.w,
                                                          child: ElevatedButton(
                                                              style: ButtonStyle(
                                                                  backgroundColor:
                                                                      MaterialStateProperty
                                                                          .all(
                                                                              kredcolor)),
                                                              onPressed: () {
                                                                if (selectedServicesList[index]
                                                                            [
                                                                            'isAproved'] ==
                                                                        false &&
                                                                    selectedServicesList[index]
                                                                            [
                                                                            'isRejected'] ==
                                                                        false) {
                                                                  orderConfirmationPopup(
                                                                      context,
                                                                      'Reject',
                                                                      index,
                                                                      'isRejected',
                                                                      true);
                                                                }
                                                              },
                                                              child: Container(
                                                                width: 50.w,
                                                                // width: 100.w,
                                                                // height: 40.w,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.w)),
                                                                child: Text(
                                                                  'Reject',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        10.sp,
                                                                    color:
                                                                        kwhitecolor,
                                                                  ),
                                                                ),
                                                              )),
                                                        )
                                                      : SizedBox(),
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      heigh5,
                                      Row(
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
                                                      '${selectedServicesList[index]['serviceName']}',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: kprimarycolor),
                                                    ),
                                                  ],
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    // selectedServicesList[index]
                                                    //             ['isAproved'] ==
                                                    //         false
                                                    //     ? orderConfirmationPopup(
                                                    //         context, 'title')
                                                    //     : SizedBox();
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      selectedServicesList[index][
                                                                  'isSelected'] ==
                                                              false
                                                          ? Text(
                                                              'Not Selected',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      13.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color:
                                                                      kgreycolor),
                                                            )
                                                          : selectedServicesList[
                                                                          index][
                                                                      'isRejected'] ==
                                                                  true
                                                              ? Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      'Rejected',
                                                                      style: TextStyle(
                                                                          fontSize: 15
                                                                              .sp,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color:
                                                                              kredcolor),
                                                                    ),
                                                                    width5,
                                                                    Icon(
                                                                      Icons
                                                                          .error,
                                                                      color:
                                                                          kredcolor,
                                                                      size:
                                                                          20.w,
                                                                    )
                                                                  ],
                                                                )
                                                              : selectedServicesList[index]
                                                                          [
                                                                          'isCompleted'] ==
                                                                      true
                                                                  ? Text(
                                                                      'Completed',
                                                                      style: TextStyle(
                                                                          fontSize: 13
                                                                              .sp,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color:
                                                                              ksuccesscolor))
                                                                  : selectedServicesList[index]
                                                                              ['isPaid'] ==
                                                                          true
                                                                      ? Text(
                                                                          'Processing',
                                                                          style: TextStyle(
                                                                              fontSize: 15.sp,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Colors.orange),
                                                                        )
                                                                      : selectedServicesList[index]['isAproved'] == true
                                                                          ? Text(
                                                                              'Not paid',
                                                                              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: kyellowcolor),
                                                                            )
                                                                          : selectedServicesList[index]['isAproved'] == false
                                                                              ? Text(
                                                                                  'Not Accepted',
                                                                                  style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: kyellowcolor),
                                                                                )
                                                                              : SizedBox(),
                                                    ],
                                                  ),
                                                ),
                                                selectedServicesList[index]
                                                            ['deliveryDate'] !=
                                                        ""
                                                    ? Column(
                                                        children: [
                                                          Text(
                                                            'Delivery On',
                                                            style: normal12,
                                                          ),
                                                          Text(
                                                            selectedServicesList[
                                                                    index][
                                                                'deliveryDate'],
                                                            style: normal14,
                                                          ),
                                                        ],
                                                      )
                                                    : SizedBox()
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
                                                selectedServicesList[index]
                                                            ['isPaid'] ==
                                                        true
                                                    ? Text(
                                                        'Recieved Amount',
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            color:
                                                                ksuccesscolor),
                                                        textAlign:
                                                            TextAlign.center,
                                                      )
                                                    : Text(
                                                        'Pending Amount',
                                                        style: normal16,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                (selectedServicesList[index]
                                                                ['amount'] ==
                                                            '' ||
                                                        selectedServicesList[
                                                                    index]
                                                                ['amount'] ==
                                                            null)
                                                    ? Text(
                                                        'Not Updated',
                                                        style: bold16,
                                                      )
                                                    : Text(
                                                        'Rs${selectedServicesList[index]['amount']}',
                                                        style: bold16,
                                                      ),
                                                (selectedServicesList[index]
                                                                ['planurl'] ==
                                                            '' ||
                                                        selectedServicesList[
                                                                    index]
                                                                ['planurl'] ==
                                                            null)
                                                    ? Text(
                                                        'Not Delivered',
                                                        style: TextStyle(
                                                          color: kredcolor,
                                                          fontSize: 14.sp,
                                                        ),
                                                      )
                                                    : Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Delivered',
                                                            style: TextStyle(
                                                              color:
                                                                  ksuccesscolor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 14.sp,
                                                            ),
                                                          ),
                                                          Icon(
                                                              Icons
                                                                  .check_circle,
                                                              color:
                                                                  ksuccesscolor,
                                                              size: 16.sp)
                                                        ],
                                                      ),
                                                const Spacer(),
                                                GetBuilder<OrderController>(
                                                    builder: (getdata) {
                                                  return GestureDetector(
                                                    onTap: () async {
                                                      if (selectedServicesList[
                                                                  index]
                                                              ['isRejected'] ==
                                                          false) {
                                                        if (selectedServicesList[
                                                                    index]
                                                                ['isAproved'] ==
                                                            true) {
                                                          if (selectedServicesList[
                                                                      index]
                                                                  ['isPaid'] ==
                                                              true) {
                                                            orderController
                                                                .fetchPlanningfile(
                                                                    index);

                                                            showDialog<void>(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return AlertDialog(
                                                                  titlePadding:
                                                                      EdgeInsets
                                                                          .all(0
                                                                              .w),
                                                                  title:
                                                                      Container(
                                                                    height:
                                                                        114.w,
                                                                    width:
                                                                        282.w,
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Container(
                                                                            alignment:
                                                                                Alignment.center,
                                                                            height: 84.w,
                                                                            child: Text(
                                                                              'Are you sure you want to Upload?',
                                                                              style: TextStyle(fontSize: 16.sp, color: kblackcolor, fontWeight: FontWeight.bold),
                                                                            )),
                                                                        const Spacer(),
                                                                        Row(
                                                                          children: [
                                                                            GestureDetector(
                                                                              onTap: () async {
                                                                                if (getdata.floorplanUrl[index] != null) {
                                                                                  await FirebaseFirestore.instance.collection('orderData').doc(orderUid).get().then((documentSnapshot) {
                                                                                    if (documentSnapshot.exists) {
                                                                                      Map<String, dynamic>? documentData = documentSnapshot.data();

                                                                                      // Modify the desired string value
                                                                                      documentData!['servicesSelectedModel'][index]['planurl'] = getdata.floorplanUrl[index];

                                                                                      documentData['servicesSelectedModel'][index]['isCompleted'] = true;

                                                                                      // Update the document with the modified array
                                                                                      FirebaseFirestore.instance.collection('orderData').doc(orderUid).set(documentData).then((value) => print('Value updated successfully.')).catchError((error) => print('Error updating value: $error'));

                                                                                      getdata.flooplan[index] = null;
                                                                                      getdata.floorplanUrl[index] = null;
                                                                                    } else {
                                                                                      print('Document does not exist.');
                                                                                    }
                                                                                    getdata.floorplanUrl[index] = null;
                                                                                  });

                                                                                  Get.back();
                                                                                } else {
                                                                                  Fluttertoast.showToast(msg: 'Loading... Please Wait');
                                                                                }
                                                                                print(getdata.flooplan[index]);
                                                                              },
                                                                              child: Container(
                                                                                height: 30.w,
                                                                                width: 141.w,
                                                                                decoration: const BoxDecoration(color: kprimarycolor),
                                                                                child: Center(
                                                                                    child: Text(
                                                                                  'Yes',
                                                                                  style: TextStyle(fontSize: 14.sp, color: kwhitecolor),
                                                                                )),
                                                                              ),
                                                                            ),
                                                                            GestureDetector(
                                                                              onTap: () {
                                                                                if (getdata.floorplanUrl[index] != null || getdata.flooplan[index] == null) {
                                                                                  Get.back();
                                                                                  getdata.floorplanUrl[index] = null;
                                                                                } else {
                                                                                  Fluttertoast.showToast(msg: 'Please Wait Loading...');
                                                                                }
                                                                              },
                                                                              child: Container(
                                                                                height: 30.w,
                                                                                width: 141.w,
                                                                                decoration: BoxDecoration(color: kwhitecolor, border: Border.all(color: kprimarycolor)),
                                                                                child: Center(
                                                                                    child: Text(
                                                                                  'Cancel',
                                                                                  style: TextStyle(fontSize: 14.sp, color: kprimarycolor),
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
                                                          } else {
                                                            Fluttertoast.showToast(
                                                                msg:
                                                                    'Payment Not Recieved');
                                                          }
                                                        } else {
                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  'Please Accept Order');
                                                        }
                                                      }
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.vertical(
                                                                  bottom: Radius
                                                                      .circular(
                                                                          5.w)),
                                                          color: selectedServicesList[
                                                                          index]
                                                                      [
                                                                      'isRejected'] ==
                                                                  false
                                                              ? kprimarycolor
                                                              : kprimarycolor
                                                                  .withOpacity(
                                                                      0.2)),
                                                      width: 140.w,
                                                      height: 20.w,
                                                      child: (selectedServicesList[
                                                                          index]
                                                                      [
                                                                      'planurl'] ==
                                                                  "" ||
                                                              selectedServicesList[
                                                                          index]
                                                                      [
                                                                      'planurl'] ==
                                                                  null)
                                                          ? Text(
                                                              'Upload File',
                                                              style: TextStyle(
                                                                  color:
                                                                      kwhitecolor,
                                                                  fontSize:
                                                                      12.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )
                                                          : Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  'File Uploded',
                                                                  style: TextStyle(
                                                                      color:
                                                                          kwhitecolor,
                                                                      fontSize:
                                                                          12.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Icon(
                                                                    Icons
                                                                        .check_circle,
                                                                    color:
                                                                        kwhitecolor,
                                                                    size: 16.sp)
                                                              ],
                                                            ),
                                                    ),
                                                  );
                                                })
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
                                                const Icon(
                                                  Icons.call,
                                                  color: Color.fromARGB(
                                                      255, 0, 140, 255),
                                                ),
                                                // heigh5,
                                                FaIcon(
                                                  FontAwesomeIcons.whatsapp,
                                                  size: 24.sp,
                                                  color: ksuccesscolor,
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
                        return selectedServicesList[index]['isSelected'] ==
                                false
                            ? const SizedBox()
                            : SizedBox(
                                height: 10.w,
                              );
                      },
                      itemCount: selectedServicesList.length),
                  heigh20
                ],
              );
            }),
      ),
    );
  }

  Future<void> cofirmationPopup(BuildContext context, String title) {
    return showDialog<void>(
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
                      'Are you sure you want to ${title}?',
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: kblackcolor,
                          fontWeight: FontWeight.bold),
                    )),
                const Spacer(),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // await FirebaseFirestore.instance
                        //     .collection("order")
                        //     .doc(orderId)
                        //     .update({field: value});

                        Get.back();
                      },
                      child: Container(
                        height: 30.w,
                        width: 141.w,
                        decoration: const BoxDecoration(color: kprimarycolor),
                        child: Center(
                            child: Text(
                          'Yes',
                          style: TextStyle(fontSize: 14.sp, color: kwhitecolor),
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
                            border: Border.all(color: kprimarycolor)),
                        child: Center(
                            child: Text(
                          'Cancel',
                          style:
                              TextStyle(fontSize: 14.sp, color: kprimarycolor),
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
  }

  Future<void> orderConfirmationPopup(
      BuildContext context, String title, int index, String field, bool value) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(0.w),
          title: Container(
            height: 114.w,
            width: 320.w,
            child: Column(
              children: [
                Container(
                    alignment: Alignment.center,
                    height: 84.w,
                    child: Text(
                      'Are you sure you want to ${title} this order?',
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: kblackcolor,
                          fontWeight: FontWeight.bold),
                    )),
                const Spacer(),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await FirebaseFirestore.instance
                            .collection('orderData')
                            .doc(orderUid)
                            .get()
                            .then((documentSnapshot) {
                          if (documentSnapshot.exists) {
                            Map<String, dynamic>? documentData =
                                documentSnapshot.data();

                            // Modify the desired string value
                            documentData!['servicesSelectedModel'][index]
                                [field] = value;

                            // Update the document with the modified array
                            FirebaseFirestore.instance
                                .collection('orderData')
                                .doc(orderUid)
                                .set(documentData)
                                .then((value) =>
                                    print('Value updated successfully.'))
                                .catchError((error) =>
                                    print('Error updating value: $error'));
                          } else {
                            print('Document does not exist.');
                          }
                        });

                        // await FirebaseFirestore.instance
                        //     .collection("order")
                        //     .doc(orderUid)
                        //     .update({'servicesSelectedModel': value});

                        Get.back();
                      },
                      child: Container(
                        height: 30.w,
                        width: 152.w,
                        decoration: const BoxDecoration(color: kprimarycolor),
                        child: Center(
                            child: Text(
                          'Yes',
                          style: TextStyle(fontSize: 14.sp, color: kwhitecolor),
                        )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        height: 30.w,
                        width: 152.5.w,
                        decoration: BoxDecoration(
                            color: kwhitecolor,
                            border: Border.all(color: kprimarycolor)),
                        child: Center(
                            child: Text(
                          'No',
                          style:
                              TextStyle(fontSize: 14.sp, color: kprimarycolor),
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
  }

  Future<void> orderConfirmationAcceptPopup(
      BuildContext context, String title, int index, String field, bool value) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.only(top: 10.w),
          title: Container(
            height: 114.w,
            width: 320.w,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 84.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Expected Delivery Date : ',
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: kblackcolor,
                            fontWeight: FontWeight.bold),
                      ),
                      Form(
                        key: formKeydeliveryDate,
                        child: SizedBox(
                          width: 110.w,
                          height: 30.w,
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.datetime,
                            controller: deliveryDateController,
                            decoration: InputDecoration(
                                errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(255, 255, 0, 0)),
                                ),
                                errorStyle: TextStyle(
                                    height: 0,
                                    color: Colors.transparent,
                                    fontSize: 1.sp),
                                contentPadding: EdgeInsets.symmetric(
                                  // vertical: 10.0.w,
                                  horizontal: 10.0.w,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: kprimarycolor,
                                  ),
                                  borderRadius: BorderRadius.circular(2.w),
                                ),
                                hintText: 'dd.mm.yyyy',
                                hintStyle: TextStyle(
                                    fontSize: 14.sp, color: kgreycolor)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return '';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final form = formKeydeliveryDate.currentState;

                        if (form!.validate()) {
                          await FirebaseFirestore.instance
                              .collection('orderData')
                              .doc(orderUid)
                              .get()
                              .then((documentSnapshot) {
                            if (documentSnapshot.exists) {
                              Map<String, dynamic>? documentData =
                                  documentSnapshot.data();

                              // Modify the desired string value
                              documentData!['servicesSelectedModel'][index]
                                  [field] = value;

                              documentData['servicesSelectedModel'][index]
                                      ['deliveryDate'] =
                                  deliveryDateController.text;

                              // Update the document with the modified array
                              FirebaseFirestore.instance
                                  .collection('orderData')
                                  .doc(orderUid)
                                  .set(documentData)
                                  .then((value) =>
                                      print('Value updated successfully.'))
                                  .catchError((error) =>
                                      print('Error updating value: $error'));
                            } else {
                              print('Document does not exist.');
                            }
                          });

                          // await FirebaseFirestore.instance
                          //     .collection("order")
                          //     .doc(orderUid)
                          //     .update({'servicesSelectedModel': value});

                          Get.back();
                          deliveryDateController.clear();
                        } else
                          Fluttertoast.showToast(
                              msg: 'Please Enter Delivery Date');
                      },
                      child: Container(
                        height: 30.w,
                        width: 152.w,
                        decoration: const BoxDecoration(color: kprimarycolor),
                        child: Center(
                            child: Text(
                          'Submit',
                          style: TextStyle(fontSize: 14.sp, color: kwhitecolor),
                        )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        height: 30.w,
                        width: 152.5.w,
                        decoration: BoxDecoration(
                            color: kwhitecolor,
                            border: Border.all(color: kprimarycolor)),
                        child: Center(
                            child: Text(
                          'Cancel',
                          style:
                              TextStyle(fontSize: 14.sp, color: kprimarycolor),
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
  }
}
