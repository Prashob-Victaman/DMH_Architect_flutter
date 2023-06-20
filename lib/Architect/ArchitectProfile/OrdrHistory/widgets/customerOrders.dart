import 'package:dmh_architect/Architect/ArchitectProfile/OrdrHistory/widgets/selectedOrderDetails.dart';
import 'package:dmh_architect/Constants/constants.dart';
import 'package:dmh_architect/model/orderDataModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomerOrders extends StatelessWidget {
  List selectedServicesList;
  OrderDataModel orderData;
  CustomerOrders(
      {super.key, required this.selectedServicesList, required this.orderData});

  // List isaAproved = [true, false, true, false];
  // List isaCompleted = [true, false, false, false];
  List selectedServiceListfiltered = [];

  @override
  Widget build(BuildContext context) {
    String formatedDate = DateFormat("dd-MMM-yyyy   hh:mm a")
        .format(orderData.orderDatetime.toDate());

    for (var item in selectedServicesList) {
      if (item['isSelected'] == true) {
        selectedServiceListfiltered.add(item);
      }
    }
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            heigh10,
            Text(
              'Customer Orders',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: kprimarycolor),
              textAlign: TextAlign.center,
            ),
            heigh10,
            ListView.separated(
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
                                        fontSize: 15.sp,
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
                              Spacer(),
                              Column(
                                children: [
                                  SizedBox(
                                    width: 135.w,
                                    height: 30.w,
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    kprimarycolor)),
                                        onPressed: () {
                                          Get.to(() => SelectedOrderDetails());
                                        },
                                        child: Container(
                                          // width: 100.w,
                                          // height: 40.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.w)),
                                          child: Text(
                                            'Order Details',
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              color: kwhitecolor,
                                            ),
                                          ),
                                        )),
                                  ),
                                  heigh5,
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 65.w,
                                        height: 25.w,
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        ksuccesscolor)),
                                            onPressed: () {
                                              orderConfirmationPopup(
                                                  context, 'Accept');
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
                                                style: TextStyle(
                                                  fontSize: 10.sp,
                                                  color: kwhitecolor,
                                                ),
                                              ),
                                            )),
                                      ),
                                      width5,
                                      SizedBox(
                                        width: 65.w,
                                        height: 25.w,
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        kredcolor)),
                                            onPressed: () {
                                              orderConfirmationPopup(
                                                  context, 'Reject');
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
                                                style: TextStyle(
                                                  fontSize: 10.sp,
                                                  color: kwhitecolor,
                                                ),
                                              ),
                                            )),
                                      ),
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
                                    borderRadius: BorderRadius.circular(5.w),
                                    color: kwhitecolor),
                                padding: EdgeInsets.only(left: 0.w),
                                width: 140.w,
                                height: 90.w,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${selectedServiceListfiltered[index]['serviceName']}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold,
                                              color: kprimarycolor),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        selectedServicesList[index]
                                                    ['isAproved'] ==
                                                false
                                            ? orderConfirmationPopup(
                                                context, 'title')
                                            : SizedBox();
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          selectedServicesList[index]
                                                      ['isCompleted'] ==
                                                  true
                                              ? Text('Completed',
                                                  style: TextStyle(
                                                      fontSize: 17.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ksuccesscolor))
                                              : selectedServicesList[index]
                                                          ['isAproved'] ==
                                                      true
                                                  ? Text(
                                                      'Processing',
                                                      style: TextStyle(
                                                          fontSize: 17.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: kredcolor),
                                                    )
                                                  : Text(
                                                      'Pending',
                                                      style: TextStyle(
                                                          fontSize: 17.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: kyellowcolor),
                                                    ),
                                          width5,
                                          selectedServicesList[index]
                                                      ['isAproved'] ==
                                                  false
                                              ? Row(
                                                  children: [
                                                    Icon(
                                                      Icons.check_box,
                                                      size: 18.sp,
                                                      color: ksuccesscolor,
                                                    ),
                                                    width5,
                                                    Icon(
                                                      Icons.close,
                                                      size: 18.sp,
                                                      color: kredcolor,
                                                    )
                                                  ],
                                                )
                                              : SizedBox()
                                        ],
                                      ),
                                    ),
                                    Text(
                                      'Delivery On',
                                      style: normal12,
                                    ),
                                    Text(
                                      '25.05.2023',
                                      style: normal14,
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
                                    Spacer(),
                                    Text(
                                      'Recieved Amount',
                                      style: normal16,
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'Rs.5000.00',
                                      style: bold16,
                                    ),
                                    Text(
                                      'Not Delivered',
                                      style: TextStyle(
                                        color: kredcolor,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.vertical(
                                              bottom: Radius.circular(5.w)),
                                          color: kprimarycolor),
                                      width: 140.w,
                                      height: 20.w,
                                      child: Text(
                                        'Upload File',
                                        style: TextStyle(
                                            color: kwhitecolor,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Spacer(),
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
                                    const Icon(
                                      Icons.call,
                                      color: Color.fromARGB(255, 0, 140, 255),
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
                  return SizedBox(
                    height: 10.w,
                  );
                },
                itemCount: selectedServiceListfiltered.length),
          ],
        ),
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
                Spacer(),
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
                        decoration: BoxDecoration(color: kprimarycolor),
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

  Future<void> orderConfirmationPopup(BuildContext context, String title) {
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
                Spacer(),
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
                        width: 152.w,
                        decoration: BoxDecoration(color: kprimarycolor),
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
}
