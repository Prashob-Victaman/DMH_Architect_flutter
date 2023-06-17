import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmh_architect/Constants/constants.dart';
import 'package:dmh_architect/controller/ordercontroller.dart';
import 'package:dmh_architect/model/orderModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class individualOrder extends StatelessWidget {
  String orderId;
  individualOrder({super.key, required this.orderId});
  TextEditingController initialAmountController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController secondAmountController = TextEditingController();

  final formKeyInitialPayment = GlobalKey<FormState>();
  final formKeydate = GlobalKey<FormState>();
  final formKeysecondPayment = GlobalKey<FormState>();

  final orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("order")
                .doc(orderId)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              // final DesignList = snapshot.data!['myDesigns'];

              final data = OrderModel.fromJson(snapshot.data!);

              return ListView(
                padding: EdgeInsets.all(10.w),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.arrow_back,
                          size: 20.sp,
                        ),
                      ),
                      Text(
                        'Order Status',
                        style: bold18,
                      ),
                      SizedBox()
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0.w, top: 20.w),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order Id : DMH${data.orderId}',
                            style:
                                TextStyle(color: kblackcolor, fontSize: 18.sp),
                          ),
                          heigh10,
                          circleandtext(title: 'Order Pending', isDone: true),
                          Row(
                            children: [
                              SizedBox(
                                width: 9.w,
                              ),
                              Container(
                                height: 50.w,
                                width: 2.w,
                                color: kprimarycolor,
                              ),
                              width20,
                              Container(
                                  alignment: Alignment.center,
                                  width: 100.w,
                                  height: 30.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.w),
                                      color: data.isOrderConfirmed == true
                                          ? kprimarycolor
                                          : kprimarycolor.withOpacity(0.5)),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                kprimarycolor)),
                                    onPressed: () {
                                      if (data.isRejected == false &&
                                          data.isOrderConfirmed == false) {
                                        cofirmationPopup(
                                            context, 'isOrderConfirmed', true);
                                      }
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Accept',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: kwhitecolor,
                                        ),
                                      ),
                                    ),
                                  )),
                              width10,
                              Container(
                                alignment: Alignment.center,
                                width: 100.w,
                                height: 30.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.w),
                                    color: data.isOrderConfirmed == true
                                        ? kprimarycolor
                                        : kprimarycolor.withOpacity(0.5)),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              kprimarycolor)),
                                  onPressed: () {
                                    if (data.isRejected == false &&
                                        data.isOrderConfirmed == false) {
                                      cofirmationPopup(
                                          context, 'isRejected', true);
                                    }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Reject',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: kwhitecolor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            child: data.isRejected == true
                                ? Row(
                                    children: [
                                      SizedBox(
                                        width: 9.w,
                                      ),
                                      Container(
                                        height: 25.w,
                                        width: 2.w,
                                        color: kprimarycolor,
                                      ),
                                      width20,
                                      Text(
                                        'Order Rejected',
                                        style: TextStyle(
                                            color: kredcolor,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.error,
                                        color: kredcolor,
                                      )
                                    ],
                                  )
                                : SizedBox(),
                          ),
                          circleandtext(
                              title: 'Order Confirmed',
                              isDone: data.isOrderConfirmed),
                          Row(
                            children: [
                              SizedBox(
                                width: 9.w,
                              ),
                              Container(
                                height: 50.w,
                                width: 2.w,
                                color: kprimarycolor,
                              ),
                              width20,
                              Form(
                                key: formKeyInitialPayment,
                                child: Container(
                                  height: 30.w,
                                  width: 100.w,
                                  // padding: EdgeInsets.symmetric(vertical: 10.w),
                                  child: TextFormField(
                                    enabled: data.isOrderConfirmed == true &&
                                            data.isinitialPaymentDone == false
                                        ? true
                                        : false,
                                    textAlignVertical: TextAlignVertical.center,
                                    controller: initialAmountController,
                                    keyboardType: TextInputType.number,
                                    decoration:
                                        textfieldDecoration('Enter Amount'),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return '';
                                      }

                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              width10,
                              Container(
                                  alignment: Alignment.center,
                                  width: 100.w,
                                  height: 30.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.w),
                                    // color: data.isOrderConfirmed == true
                                    //     ? kprimarycolor
                                    //     : kprimarycolor.withOpacity(0.5)
                                  ),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                data.isOrderConfirmed == true
                                                    ? kprimarycolor
                                                    : kprimarycolor50)),
                                    onPressed: () {
                                      final form =
                                          formKeyInitialPayment.currentState;
                                      if (data.isInitialpaymentAdded == false) {
                                        if (form!.validate()) {
                                          cofirmationPopuptwofiels(
                                              context,
                                              'initialPayment',
                                              initialAmountController.text,
                                              'isInitialpaymentAdded',
                                              true);
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: 'Please Enter Amount');
                                        }
                                      }
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Submit',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: kwhitecolor,
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                          circleandtext(
                              title:
                                  'Pay Rs ${data.initialPayment == '' ? 0 : data.initialPayment}.00',
                              isDone: data.initialPayment == "" ? false : true),
                          Row(
                            children: [
                              SizedBox(
                                width: 9.w,
                              ),
                              Container(
                                height: 10.w,
                                width: 2.w,
                                color: kprimarycolor,
                              ),
                            ],
                          ),
                          circleandtext(
                              title:
                                  'Paid Rs  ${data.initialPayment == '' ? 0 : data.initialPayment}.00',
                              isDone: data.isinitialPaymentDone),
                          Row(
                            children: [
                              SizedBox(
                                width: 9.w,
                              ),
                              Container(
                                height: 10.w,
                                width: 2.w,
                                color: kprimarycolor,
                              ),
                            ],
                          ),
                          circleandtext(
                              title: 'Uploaded Requirements',
                              isDone: data.isUploadRequirements),
                          Row(
                            children: [
                              SizedBox(
                                width: 9.w,
                              ),
                              Container(
                                height: 50.w,
                                width: 2.w,
                                color: kprimarycolor,
                              ),
                              width20,
                              Container(
                                  alignment: Alignment.center,
                                  width: 210.w,
                                  height: 30.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.w),
                                      color: data.isUploadRequirements == true
                                          ? kprimarycolor
                                          : kprimarycolor.withOpacity(0.5)),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                data.isUploadRequirements ==
                                                        true
                                                    ? kprimarycolor
                                                    : kprimarycolor50)),
                                    onPressed: () async {
                                      if (data.isUploadRequirements == true) {
                                        await FirebaseFirestore.instance
                                            .collection("order")
                                            .doc(orderId)
                                            .update({'isWorkStarted': true});
                                      }
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'View Requirement',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: kwhitecolor,
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                          circleandtext(
                              title: 'Your Planing Work in progress',
                              isDone: data.isWorkStarted),
                          Row(
                            children: [
                              SizedBox(
                                width: 9.w,
                              ),
                              Container(
                                height: 50.w,
                                width: 2.w,
                                color: kprimarycolor,
                              ),
                              width20,
                              Form(
                                key: formKeydate,
                                child: Container(
                                  height: 30.w,
                                  width: 100.w,
                                  // padding: EdgeInsets.symmetric(vertical: 10.w),
                                  child: TextFormField(
                                    enabled: data.isWorkStarted == true &&
                                            data.isExpectedDeliveryAdded ==
                                                false
                                        ? true
                                        : false,
                                    keyboardType: TextInputType.datetime,
                                    controller: dateController,
                                    decoration: textfieldDecoration('DD/MM/YY'),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return '';
                                      }

                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              width10,
                              Container(
                                  alignment: Alignment.center,
                                  width: 100.w,
                                  height: 30.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.w),
                                      color: data.isWorkStarted == true
                                          ? kprimarycolor
                                          : kprimarycolor.withOpacity(0.5)),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                data.isWorkStarted == true
                                                    ? kprimarycolor
                                                    : kprimarycolor50)),
                                    onPressed: () {
                                      final form = formKeydate.currentState;

                                      if (data.isExpectedDeliveryAdded ==
                                          false) {
                                        if (form!.validate()) {
                                          cofirmationPopuptwofiels(
                                              context,
                                              'expectedDelivery',
                                              dateController.text,
                                              'isExpectedDeliveryAdded',
                                              true);
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: 'Please Enter Date');
                                        }
                                      }
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Submit',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: kwhitecolor,
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                          circleandtext(
                              title:
                                  'Expected Delivery On  ${data.expectedDelivery == '' ? 'DD/MM/YY' : data.expectedDelivery}',
                              isDone: data.isExpectedDeliveryAdded),
                          GetBuilder<OrderController>(builder: (getdata) {
                            return Row(
                              children: [
                                SizedBox(
                                  width: 9.w,
                                ),
                                Container(
                                  height: 50.w,
                                  width: 2.w,
                                  color: kprimarycolor,
                                ),
                                width20,
                                GestureDetector(
                                  onTap: () {
                                    orderController.fetchPlanningfile();
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      width: 100.w,
                                      height: 30.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.w),
                                          color: getdata.flooplan == null
                                              ? kashcolor
                                              : ksuccesscolor),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          getdata.flooplan == null
                                              ? Text('Attach', style: normal16)
                                              : Text('Attached',
                                                  style: normal16),
                                          Icon(
                                            Icons.attach_file,
                                            size: 20,
                                          ),
                                        ],
                                      )),
                                ),
                                width10,
                                Container(
                                    alignment: Alignment.center,
                                    width: 100.w,
                                    height: 30.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.w),
                                      // color: data.isOrderConfirmed == true
                                      //     ? kprimarycolor
                                      //     : kprimarycolor.withOpacity(0.5)
                                    ),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  data.isExpectedDeliveryAdded ==
                                                          true
                                                      ? kprimarycolor
                                                      : kprimarycolor50)),
                                      onPressed: () {
                                        if (getdata.flooplan != null &&
                                            data.floorPlanDataUpload == false) {
                                          cofirmationPopuptwofiels(
                                              context,
                                              'floorPlanData',
                                              getdata.floorplanUrl,
                                              'floorPlanDataUpload',
                                              true);
                                        }
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Submit',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: kwhitecolor,
                                          ),
                                        ),
                                      ),
                                    )),
                              ],
                            );
                          }),
                          circleandtext(
                              title: 'Floor Plan Attached',
                              isDone: data.floorPlanDataUpload),
                          Row(
                            children: [
                              SizedBox(
                                width: 9.w,
                              ),
                              Container(
                                height: 50.w,
                                width: 2.w,
                                color: kprimarycolor,
                              ),
                              width20,
                              Form(
                                key: formKeysecondPayment,
                                child: Container(
                                  height: 30.w,
                                  width: 100.w,
                                  // padding: EdgeInsets.symmetric(vertical: 10.w),
                                  child: TextFormField(
                                    enabled: data.floorPlanDataUpload == true &&
                                            data.secondaryAmount == ''
                                        ? true
                                        : false,
                                    textAlignVertical: TextAlignVertical.center,
                                    controller: secondAmountController,
                                    keyboardType: TextInputType.number,
                                    decoration:
                                        textfieldDecoration('Enter Amount'),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return '';
                                      }

                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              width10,
                              Container(
                                  alignment: Alignment.center,
                                  width: 100.w,
                                  height: 30.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.w),
                                      color: data.isWorkStarted == true
                                          ? kprimarycolor
                                          : kprimarycolor.withOpacity(0.5)),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                data.floorPlanDataUpload == true
                                                    ? kprimarycolor
                                                    : kprimarycolor50)),
                                    onPressed: () {
                                      final form =
                                          formKeysecondPayment.currentState;

                                      if (data.floorPlanDataUpload == true &&
                                          data.isSecondaryPamentAdded ==
                                              false) {
                                        if (form!.validate()) {
                                          cofirmationPopuptwofiels(
                                              context,
                                              'secondaryAmount',
                                              secondAmountController.text,
                                              'isSecondaryPamentAdded',
                                              true);
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: 'Please Enter Amount');
                                        }
                                      }
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Submit',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: kwhitecolor,
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                          circleandtext(
                              title: 'Pay Rs ${data.secondaryAmount}.00',
                              isDone: data.isSecondaryPamentAdded),
                          Row(
                            children: [
                              SizedBox(
                                width: 9.w,
                              ),
                              Container(
                                height: 10.w,
                                width: 2.w,
                                color: kprimarycolor,
                              ),
                            ],
                          ),
                          circleandtext(
                              title: 'Paid Rs  ${data.secondaryAmount}.00',
                              isDone: data.issecondaryAmountPaid),
                          Row(
                            children: [
                              SizedBox(
                                width: 9.w,
                              ),
                              Container(
                                height: 10.w,
                                width: 2.w,
                                color: kprimarycolor,
                              ),
                            ],
                          ),
                          circleandtext(
                              title: 'Completed',
                              isDone: data.issecondaryAmountPaid),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }

  Future<void> cofirmationPopup(BuildContext context, String field, value) {
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
                      'Are you sure you want to Submit?',
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: kblackcolor,
                          fontWeight: FontWeight.bold),
                    )),
                Spacer(),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await FirebaseFirestore.instance
                            .collection("order")
                            .doc(orderId)
                            .update({field: value});

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

  Future<void> cofirmationPopuptwofiels(BuildContext context, String field,
      value, String secondField, bool secondValue) {
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
                      'Are you sure you want to Submit?',
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: kblackcolor,
                          fontWeight: FontWeight.bold),
                    )),
                Spacer(),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await FirebaseFirestore.instance
                            .collection("order")
                            .doc(orderId)
                            .update({field: value, secondField: secondValue});

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

  InputDecoration textfieldDecoration(hint) {
    return InputDecoration(
        errorBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(width: 1, color: Color.fromARGB(255, 255, 0, 0)),
        ),
        errorStyle:
            TextStyle(height: 0, color: Colors.transparent, fontSize: 1.sp),
        contentPadding: EdgeInsets.only(
          // vertical: 10.0.w,
          left: 10.0.w,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: kprimarycolor,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        hintText: hint,
        hintStyle: TextStyle(fontSize: 14.sp, color: kgreycolor));
  }
}

class circleandtext extends StatelessWidget {
  String title;
  bool isDone;
  circleandtext({
    required this.title,
    required this.isDone,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 10.w,
          backgroundColor: kprimarycolor,
          child: CircleAvatar(
            radius: 8.w,
            backgroundColor: isDone == true ? kprimarycolor : kwhitecolor,
            foregroundColor: kpinkcolor,
          ),
        ),
        width10,
        Text(
          title,
          style: TextStyle(
              color: isDone == true ? kblackcolor : kgreycolor,
              fontSize: 18.sp),
        ),
      ],
    );
  }
}
