import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmh_architect/Constants/constants.dart';
import 'package:dmh_architect/controller/servicesSelectedController.dart';
import 'package:dmh_architect/model/orderDataModel.dart';
import 'package:dmh_architect/model/servicelistmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'myimageviewer.dart';
import 'mypdfviewer.dart';
import 'myvideoplayer.dart';

class ServicesSelected extends StatelessWidget {
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

  final getServiceSelectedController = Get.put(ServiceSelectedController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
      child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('ArchitectData').doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),
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
              childAspectRatio: 1.0.w,
              crossAxisCount: 3,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.w,
              children: List.generate(9, (index) {
                String designType;
                if (orderData.designType == 'Classical') {
                  designType = 'classic';
                } else {
                  designType = 'modern';
                }

                final serviceRateData = ServiceListModel.fromJson(snapshot.data!['serviceRateamountList']);

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
                  areaForAmoutCalculation = double.parse(orderData.averageAreaDimension['averageArea']);
                } catch (e) {
                  areaForAmoutCalculation = 0;
                }

                double amount = 0;

                double amountAccordingSqft;

                try {
                  if (architectServicepriceList[index] != '') {
                    amountAccordingSqft = double.parse(architectServicepriceList[index]) * areaForAmoutCalculation;
                    if (architectServicepriceList[10] != '') {
                      getServiceSelectedController.nakshshaamount = double.parse(architectServicepriceList[10]) * areaForAmoutCalculation;
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
                      (double.parse(architectServicepriceList[9]) * orderData.distanceBetweenSiteandArchitectKm)) {
                    getServiceSelectedController.sitesupervisionamount =
                        (double.parse(architectServicepriceList[9]) * orderData.distanceBetweenSiteandArchitectKm);

                    // print('try');
                  } else {
                    getServiceSelectedController.sitesupervisionamount = double.parse(architectServiceMinpriceList[9]);
                  }
                }

                if (architectServiceMinpriceList[10] != '') {
                  if (double.parse(architectServiceMinpriceList[10]) <
                      (double.parse(architectServicepriceList[10]) * orderData.distanceBetweenSiteandArchitectKm)) {
                    getServiceSelectedController.nakshshaamount =
                        (double.parse(architectServicepriceList[10]) * orderData.distanceBetweenSiteandArchitectKm);
                    // print('try');
                  } else {
                    getServiceSelectedController.nakshshaamount = double.parse(architectServiceMinpriceList[10]);
                  }
                }

                if (architectServiceMinpriceList[index] != '') {
                  try {
                    if (double.parse(architectServiceMinpriceList[index]) < amountAccordingSqft) {
                      amount = amountAccordingSqft;
                      // print('try');
                    } else {
                      amount = double.parse(architectServiceMinpriceList[index]);
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
                    decoration: BoxDecoration(color: kashcolor, borderRadius: BorderRadius.circular(5.w), border: Border.all(width: 0.3.w)),
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
                                  serviceTitle[index],
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
                                                borderRadius: BorderRadius.circular(10),
                                                color: Colors.white,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.w),
                                                child: Center(
                                                  child: Column(
                                                    // mainAxisAlignment:
                                                    //     MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      // Spacer(),
                                                      GestureDetector(
                                                          onTap: () => Get.back(),
                                                          child: Icon(
                                                            Icons.close,
                                                            size: 20.sp,
                                                          )),
                                                      heigh10,
                                                      SizedBox(
                                                        width: 250.w,
                                                        child: Text(
                                                          aboutService[index],
                                                          textAlign: TextAlign.justify,
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
                        const Spacer(),

                        selectedServicesList[index]['isPaid']?Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(index == 0 ? 5 : 2, (changeIndex) {
                            return Padding(
                              padding: EdgeInsets.only(right: 2.w),
                              child: GestureDetector(
                                onTap: () {
                                  _openBottomSheet(context, index, changeIndex);
                                },
                                child: Container(
                                  height: 18.w,
                                  width: 18.w,
                                  decoration: BoxDecoration(
                                    color: orderData.servicesSelectedModel[index]['numberOfchangesDone'] == changeIndex
                                        ? orderData.servicesSelectedModel[index]['isCompleted'] == false
                                        ? Colors.red
                                        : Colors.green
                                        : changeIndex < orderData.servicesSelectedModel[index]['numberOfchangesDone']
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
                        ):const SizedBox(),

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
                            color: selectedServicesList[index]['isSelected'] == true ? kwhitecolor : kwhitecolor,
                            borderRadius: BorderRadius.vertical(bottom: Radius.circular(5.w)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              selectedServicesList[0]['isRejected'] == true
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Rejected',
                                          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: kredcolor),
                                        ),
                                        width5,
                                        Icon(
                                          Icons.error,
                                          color: kredcolor,
                                          size: 20.w,
                                        )
                                      ],
                                    )
                                  : selectedServicesList[index]['isCompleted'] == true
                                      ? Text('Completed', style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: ksuccesscolor))
                                      : selectedServicesList[index]['isPaid'] == true
                                          ? Text(
                                              'Pending',
                                              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: Colors.red),
                                            )
                                          : selectedServicesList[0]['isAproved'] == true
                                              ? amount == 0.0
                                                  ? Text(
                                                      'Not Selected',
                                                      style: normal14,
                                                    )
                                                  : Text(
                                                      'Not paid',
                                                      style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: kyellowcolor),
                                                    )
                                              : selectedServicesList[0]['isAproved'] == false
                                                  ? Text(
                                                      'Not Accepted',
                                                      style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: kyellowcolor),
                                                    )
                                                  : const SizedBox(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            );
          }),
    );
  }


  String getFileName(String url) {
    RegExp regExp = RegExp(r'.+(\/|%2F)(.+)\?.+');
    //This Regex won't work if you remove ?alt...token
    var matches = regExp.allMatches(url);

    var match = matches.elementAt(0);
    // print("${Uri.decodeFull(match.group(2)!)}");
    return Uri.decodeFull(match.group(2)!);
  }

  Future<String?> getFileTypeFromUrl(String url) async {
    try {
      final response = await http.head(Uri.parse(url));
      if (response.statusCode == 200) {
        String? contentType = response.headers['content-type'];
        if (contentType != null) {
          return contentType.split('/').last;
        }
      }
    } catch (e) {
      // print("Error getting file type: $e");
    }
    return null;
  }

  void _openBottomSheet(BuildContext context, int index, int changeIndex) async {
    // for (int i = 0; i < widget.selectedServicesList[index]['planurl']['${changeIndex}'].length; i++) {
    //   // print(getFileName(widget.selectedServicesList[index]
    //   //     ['planurl']['0'][i]));
    //
    //   String? filetype = await getFileTypeFromUrl(widget.selectedServicesList[index]['planurl']['0'][i]);
    //   // print(filetype);
    //   downloadFile(DateTime.now().millisecondsSinceEpoch, widget.selectedServicesList[index]['planurl']['0'][i],
    //       widget.selectedServicesList[index]['serviceName'] + DateTime.now().millisecondsSinceEpoch.toString() + '.$filetype');
    //
    // }
    if (selectedServicesList[index]['planurl']['${changeIndex}'].length == 0) {
      return;
    }

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          // Customize the bottom sheet content here
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0.w),
              topRight: Radius.circular(10.0.w),
            ),
          ),
          height: 140.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              heigh10,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      serviceListItems[index],
                      // style: normalfont17,
                      style: bold17,
                    ),
                    Text(
                      'Change Number: ${changeIndex + 1}',
                      // style: normalfont17,
                      style: normal14,
                    ),
                  ],
                ),
              ),
              heigh10,
              SizedBox(
                height: 90,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    selectedServicesList[index]['planurl']['${changeIndex}'].length,
                        (fileIndex) => Padding(
                      padding: const EdgeInsets.all(12),
                      child: GestureDetector(
                        onTap: () async {
                          print(selectedServicesList[index]['planurl']['${changeIndex}'][fileIndex]);
                          String? filetype = await getFileTypeFromUrl(selectedServicesList[index]['planurl']['${changeIndex}'][fileIndex]);
                          if (filetype == 'pdf') {
                            Get.to(MyPdfViewer(fileUrl: selectedServicesList[index]['planurl']['${changeIndex}'][fileIndex]));
                          } else if (filetype == 'mp4') {
                            Get.to(ChewieVideoPlayer(videoUrl: selectedServicesList[index]['planurl']['${changeIndex}'][fileIndex]));
                          } else {
                            Get.to(MyImageViewer(fileUrl: selectedServicesList[index]['planurl']['${changeIndex}'][fileIndex]));
                          }
                        },
                        child: Center(
                          child: Column(
                            children: [
                              const Icon(
                                Icons.file_open,
                                size: 40,
                              ),
                              Text(
                                'File ${fileIndex + 1}',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }


}
