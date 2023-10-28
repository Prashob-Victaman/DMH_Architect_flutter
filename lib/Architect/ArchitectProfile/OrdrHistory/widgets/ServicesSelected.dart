import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmh_architect/Constants/constants.dart';
import 'package:dmh_architect/controller/servicesSelectedController.dart';
import 'package:dmh_architect/model/orderDataModel.dart';
import 'package:dmh_architect/model/servicelistmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ServicesSelected extends StatefulWidget {
  List serviceTitle;
  List aboutService;
  List selectedServicesList;
  OrderDataModel orderData;

  ServicesSelected({
    required this.serviceTitle,
    required this.aboutService,
    required this.selectedServicesList,
    required this.orderData,
    super.key,
  });

  @override
  State<ServicesSelected> createState() => _ServicesSelectedState();
}

class _ServicesSelectedState extends State<ServicesSelected> {
  bool _shouldRebuild = true;

  final getServiceSelectedController = Get.put(ServiceSelectedController());
  void initState() {
    super.initState();

    // Delayed rebuild after 2 seconds
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _shouldRebuild = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    @override
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
      child: Column(
        children: [
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('ArchitectData')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return SizedBox(
                    height: 19.w,
                  );
                }
                if (!snapshot.hasData) {
                  return Center(
                      child: SizedBox(
                    height: 19.w,
                  ));
                }

                return GridView.count(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  childAspectRatio: 1.2.w,
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.w,
                  children: List.generate(9, (index) {
                    String designType;
                    if (widget.orderData.designType == 'Classical') {
                      designType = 'classic';
                    } else {
                      designType = 'modern';
                    }

                    final serviceRateData = ServiceListModel.fromJson(
                        snapshot.data!['serviceRateamountList']);

                    // print(serviceRateData.)

                    final serviceRateDataList = [
                      serviceRateData.FloorPlan,
                      serviceRateData.StructuralDrawing,
                      serviceRateData.ThreeDFrontElevation,
                      serviceRateData.TwoDFrontElevation,
                      serviceRateData.ThreeDFloorPlan,
                      serviceRateData.WorkingDrawing,
                      serviceRateData.ElectricalPlan,
                      serviceRateData.PlumbingPlan,
                      serviceRateData.WalkthoughVideo,
                      serviceRateData.SiteSupervision,
                      serviceRateData.NakshaLayout
                    ];

                    List architectServiceSelectedList = [
                      serviceRateDataList[0][designType]['isSelected'],
                      serviceRateDataList[1][designType]['isSelected'],
                      serviceRateDataList[2][designType]['isSelected'],
                      serviceRateDataList[3][designType]['isSelected'],
                      serviceRateDataList[4][designType]['isSelected'],
                      serviceRateDataList[5][designType]['isSelected'],
                      serviceRateDataList[6][designType]['isSelected'],
                      serviceRateDataList[7][designType]['isSelected'],
                      serviceRateDataList[8][designType]['isSelected'],
                      serviceRateDataList[9][designType]['isSelected'],
                      serviceRateDataList[10][designType]['isSelected']
                    ];

                    List architectServicepriceList = [
                      serviceRateDataList[0][designType]['pricesqft'],
                      serviceRateDataList[1][designType]['pricesqft'],
                      serviceRateDataList[2][designType]['pricesqft'],
                      serviceRateDataList[3][designType]['pricesqft'],
                      serviceRateDataList[4][designType]['pricesqft'],
                      serviceRateDataList[5][designType]['pricesqft'],
                      serviceRateDataList[6][designType]['pricesqft'],
                      serviceRateDataList[7][designType]['pricesqft'],
                      serviceRateDataList[8][designType]['pricesqft'],
                      serviceRateDataList[9][designType]['pricesqft'],
                      serviceRateDataList[10][designType]['pricesqft']
                    ];

                    List architectServiceMinpriceList = [
                      serviceRateDataList[0][designType]['minprice'],
                      serviceRateDataList[1][designType]['minprice'],
                      serviceRateDataList[2][designType]['minprice'],
                      serviceRateDataList[3][designType]['minprice'],
                      serviceRateDataList[4][designType]['minprice'],
                      serviceRateDataList[5][designType]['minprice'],
                      serviceRateDataList[6][designType]['minprice'],
                      serviceRateDataList[7][designType]['minprice'],
                      serviceRateDataList[8][designType]['minprice'],
                      serviceRateDataList[9][designType]['minprice'],
                      serviceRateDataList[10][designType]['minprice']
                    ];

                    double areaForAmoutCalculation;
                    try {
                      areaForAmoutCalculation = double.parse(
                          widget.orderData.averageAreaDimension['averageArea']);
                    } catch (e) {
                      areaForAmoutCalculation = 0;
                    }

                    double amount = 0;

                    double amountAccordingSqft;

                    try {
                      if (architectServicepriceList[index] != '') {
                        amountAccordingSqft =
                            double.parse(architectServicepriceList[index]) *
                                areaForAmoutCalculation;
                        if (architectServicepriceList[10] != '') {
                          getServiceSelectedController.nakshshaamount =
                              double.parse(architectServicepriceList[10]) *
                                  areaForAmoutCalculation;
                        }
                      } else {
                        amountAccordingSqft = 0;
                        getServiceSelectedController.nakshshaamount = 0;
                      }
                    } catch (e) {
                      amountAccordingSqft = 0;
                      getServiceSelectedController.nakshshaamount = 0;
                    }

                    if (architectServiceMinpriceList[9] != '') {
                      if (double.parse(architectServiceMinpriceList[9]) <
                          (double.parse(architectServicepriceList[9]) *
                              widget.orderData
                                  .distanceBetweenSiteandArchitectKm)) {
                        getServiceSelectedController.sitesupervisionamount =
                            (double.parse(architectServicepriceList[9]) *
                                widget.orderData
                                    .distanceBetweenSiteandArchitectKm);

                        // print('try');
                      } else {
                        getServiceSelectedController.sitesupervisionamount =
                            double.parse(architectServiceMinpriceList[9]);
                      }
                    }

                    if (architectServiceMinpriceList[10] != '') {
                      if (double.parse(architectServiceMinpriceList[10]) <
                          (double.parse(architectServicepriceList[10]) *
                              widget.orderData
                                  .distanceBetweenSiteandArchitectKm)) {
                        getServiceSelectedController.nakshshaamount =
                            (double.parse(architectServicepriceList[10]) *
                                widget.orderData
                                    .distanceBetweenSiteandArchitectKm);
                        // print('try');
                      } else {
                        getServiceSelectedController.nakshshaamount =
                            double.parse(architectServiceMinpriceList[10]);
                      }
                    }

                    if (architectServiceMinpriceList[index] != '') {
                      try {
                        if (double.parse(architectServiceMinpriceList[index]) <
                            amountAccordingSqft) {
                          amount = amountAccordingSqft;
                          // print('try');
                        } else {
                          amount =
                              double.parse(architectServiceMinpriceList[index]);
                        }
                      } catch (e) {
                        amount = 0;
                        // print(e);
                      }
                    }
                    return GestureDetector(
                      child: Container(
                        // padding: EdgeInsets.all(3.w),
                        height: 55.w,
                        // width: 115.w,
                        decoration: BoxDecoration(
                            color: kashcolor,
                            borderRadius: BorderRadius.circular(5.w),
                            border: Border.all(width: 0.3.w)),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4.0.w),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 80.w,
                                    child: Text(
                                      widget.serviceTitle[index],
                                      maxLines: 2,
                                      style: bold15,
                                      // selectedServicesList[index]['isSelected'] ==
                                      //         true
                                      //     ? bold15
                                      //     : TextStyle(
                                      //         fontSize: 13,
                                      //         fontWeight: FontWeight.bold,
                                      //         color: kgreycolor.withOpacity(0.6)),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  width5,
                                  Column(
                                    children: [
                                      // Icon(
                                      //   Icons.check_box,
                                      //   color: kprimarycolor,
                                      //   size: 18.sp,
                                      // ),
                                      heigh5,
                                      GestureDetector(
                                        onTap: () => showDialog(
                                          useSafeArea: true,
                                          barrierDismissible: true,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Center(
                                              child: Container(
                                                  height: 280.w,
                                                  width: 300.w,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.white,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20.0.w,
                                                            vertical: 20.w),
                                                    child: Center(
                                                      child: Column(
                                                        // mainAxisAlignment:
                                                        //     MainAxisAlignment.center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          // Spacer(),
                                                          GestureDetector(
                                                              onTap: () =>
                                                                  Get.back(),
                                                              child: Icon(
                                                                Icons.close,
                                                                size: 20.sp,
                                                              )),
                                                          heigh10,
                                                          SizedBox(
                                                            width: 250.w,
                                                            child: Text(
                                                              widget.aboutService[
                                                                  index],
                                                              textAlign:
                                                                  TextAlign
                                                                      .justify,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                            );
                                          },
                                        ),
                                        child: Icon(
                                          Icons.info,
                                          color: kprimarycolor,
                                          size: 18.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            amount == 0.0
                                ? const Text('')
                                : Text(
                                    'Rs ${amount.toStringAsFixed(2)}',
                                    style: normal14,
                                  ),

                            // selectedServices[index] == true
                            //     ? Text(
                            //         'Completed',
                            //         style: TextStyle(
                            //             color: ksuccesscolor,
                            //             fontSize: 16.sp,
                            //             fontWeight: FontWeight.bold),
                            //       )
                            //     : Text(
                            //         'Not Selected',
                            //         style: TextStyle(
                            //             color: kredcolor.withOpacity(0.3),
                            //             fontSize: 16.sp,
                            //             fontWeight: FontWeight.bold),
                            //       ),
                            // // Spacer(),H
                            // heigh5,
                            const Spacer(),

                            Container(
                              height: 25,
                              decoration: BoxDecoration(
                                color: widget.selectedServicesList[index]
                                            ['isSelected'] ==
                                        true
                                    ? kwhitecolor
                                    : kwhitecolor,
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(5.w)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  // selectedServicesList[index]['isSelected'] == false
                                  //     ? Text(
                                  //         'Not Selected',
                                  //         style: TextStyle(
                                  //             fontSize: 13.sp,
                                  //             fontWeight: FontWeight.bold,
                                  //             color: kgreycolor),
                                  //       )
                                  //     :
                                  widget.selectedServicesList[0]
                                              ['isRejected'] ==
                                          true
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Rejected',
                                              style: TextStyle(
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: kredcolor),
                                            ),
                                            width5,
                                            Icon(
                                              Icons.error,
                                              color: kredcolor,
                                              size: 20.w,
                                            )
                                          ],
                                        )
                                      : widget.selectedServicesList[index]
                                                  ['isCompleted'] ==
                                              true
                                          ? Text('Completed',
                                              style: TextStyle(
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: ksuccesscolor))
                                          : widget.selectedServicesList[index]
                                                      ['isPaid'] ==
                                                  true
                                              ? Text(
                                                  'Pending',
                                                  style: TextStyle(
                                                      fontSize: 13.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.red),
                                                )
                                              : widget.selectedServicesList[0]
                                                          ['isAproved'] ==
                                                      true
                                                  ? amount == 0.0
                                                      ? Text(
                                                          'Not Selected',
                                                          style: normal14,
                                                        )
                                                      : Text(
                                                          'Not paid',
                                                          style: TextStyle(
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  kyellowcolor),
                                                        )
                                                  : widget.selectedServicesList[
                                                              0]['isAproved'] ==
                                                          false
                                                      ? Text(
                                                          'Not Accepted',
                                                          style: TextStyle(
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  kyellowcolor),
                                                        )
                                                      : const SizedBox(),
                                ],
                              ),
                            ),

                            // request started
                          ],
                        ),
                      ),
                    );
                  }),
                );
              }),

          //

          heigh20,
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: screenWidth,
                height: 30.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.w),
                    color: kgreycolor),
                child: Text(
                  'Request',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      color: kwhitecolor),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.w),
                color: kashcolor,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 5.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.w),
                          color: kwhitecolor),
                      width: (screenWidth / 2) - 25.w,
                      height: 70.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Site Supervision',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.info,
                                size: 18.sp,
                              )
                            ],
                          ),
                          SizedBox(
                            // width: (screenWidth / 2) ,
                            child:
                                //  Text(
                                //     requestList['superVisionAmount']
                                //         .toString(),
                                //     style: TextStyle(
                                //         fontSize: 13.sp)),

                                Text(
                              'Rs ${getServiceSelectedController.sitesupervisionamount.toStringAsFixed(2)} ',
                              style: TextStyle(fontSize: 13.sp),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 20,
                            decoration: BoxDecoration(
                              color: widget.selectedServicesList[9]['isPaid'] ==
                                      false
                                  ? kprimarycolor
                                  : ksuccesscolor,
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(5.w)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                widget.selectedServicesList[9]['isPaid'] ==
                                        false
                                    ? Text(
                                        'Payment Pending',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: kwhitecolor,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Text(
                                        'Paid',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: kwhitecolor),
                                      ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    width10,
                    Container(
                      padding: EdgeInsets.only(top: 5.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.w),
                          color: kwhitecolor),
                      width: (screenWidth / 2) - 25.w,
                      height: 70.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Naksha Layout',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.info,
                                size: 18.sp,
                              )
                            ],
                          ),
                          SizedBox(
                            child:
                                //  Text((requestList['nakshaAmount'].toString()),
                                //     style: TextStyle(fontSize: 13.sp)),
                                Text(
                              'Rs ${getServiceSelectedController.nakshshaamount.toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 13.sp),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 20,
                            decoration: BoxDecoration(
                              color: widget.selectedServicesList[10]
                                          ['isPaid'] ==
                                      false
                                  ? kprimarycolor
                                  : ksuccesscolor,
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(5.w)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                widget.selectedServicesList[10]['isPaid'] ==
                                        false
                                    ? Text(
                                        'Payment Pending',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: kwhitecolor,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Text(
                                        'Paid',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: kwhitecolor),
                                      ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
