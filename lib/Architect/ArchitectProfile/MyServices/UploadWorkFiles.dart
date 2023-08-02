import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmh_architect/controller/OrderServiceHistory/uploadWorkFiles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:photo_view/photo_view.dart';
import '../../../Constants/constants.dart';
import '../../../model/OrderServiceModel.dart';

class UploadWorkFiles extends StatelessWidget {
  String orderUid;
  List requirementList;
  OrderServiceModel orderData;

  UploadWorkFiles(
      {super.key,
      required this.screenWidth,
      required this.orderUid,
      required this.requirementList,
      required this.orderData,
      required this.serviceIndex});

  final double screenWidth;
  int serviceIndex;
  final uploadWorkFilesController = Get.put(UploadWorkFilesController());

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: screenWidth,
      // height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.w), color: kashcolor),
      child: Column(
        children: [
          heigh10,
          Text(
            'Upload Files',
            style: bold18,
          ),
          Padding(
            padding: EdgeInsets.only(left: 7.0.w, right: 10.0.w, top: 10.0.w),
            child: Row(
              children: [
                Container(
                  height: 70.w,
                  width: 60.w,
                  color: kwhitecolor,
                  child: IconButton(
                    onPressed: () {
                      uploadWorkFilesController.uploadImagefile();
                    },
                    icon: Icon(
                      Icons.add,
                      size: 20.sp,
                    ),
                  ),
                ),
                width5,
                Container(
                  height: 90.w,
                  width: 220.w,
                  child:
                      GetBuilder<UploadWorkFilesController>(builder: (context) {
                    return ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(left: 10.w),
                            color: kashcolor,
                            height: 100.w,
                            // width: screenWidth,w
                            width: 80.w,
                            child: Stack(
                              children: [
                                uploadWorkFilesController.imgurlList[index] ==
                                        null
                                    ? Container(
                                        alignment: Alignment.centerLeft,
                                        height: 90.w,
                                        width: 70.w,
                                        color: kashcolor,
                                        child: Container(
                                          height: 70.w,
                                          width: 60.w,
                                          color: kwhitecolor,
                                        ),
                                      )
                                    : Container(
                                        alignment: Alignment.centerLeft,
                                        height: 90.w,
                                        width: 70.w,
                                        child: Container(
                                          height: 70.w,
                                          width: 60.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(4)),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                // requirementList[index]

                                                uploadWorkFilesController
                                                    .imgurlList[index]!,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                Positioned(
                                  left: 35.w,
                                  bottom: 50.w,
                                  child: IconButton(
                                      onPressed: () {
                                        uploadWorkFilesController
                                            .removeIm(index);
                                      },
                                      icon: Icon(Icons.remove_circle)),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 0.w,
                          );
                        },
                        itemCount:
                            // requirementList.length

                            uploadWorkFilesController.imgurlList.length);
                  }),
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.all(10.0.w),
          //   child: SizedBox(
          //     height: 30.w,
          //     width: screenWidth - 20,
          //     child: ElevatedButton(
          //         style: ButtonStyle(
          //             backgroundColor:
          //                 MaterialStateProperty.all(kprimarycolor)),
          //         onPressed: () async {
          //           if (uploadWorkFilesController.imgurlList.isEmpty ||
          //               uploadWorkFilesController.imgurlList.contains(null)) {
          //             Fluttertoast.showToast(msg: 'Loading... Please Wait');
          //           } else {
          //
          //
          //             int serviceIndex= serviceListItems.indexOf(orderData.servicesname);
          //             await cofirmationPopup(
          //                 context,
          //                 'servicesSelectedModel.planurl',
          //                 uploadWorkFilesController.imgurlList,
          //                 uploadWorkFilesController.imgurlList.length);
          //           }
          //
          //           // await FirebaseFirestore.instance
          //           //     .collection("orderData")
          //           //     .doc(orderUid)
          //           //     .update(
          //           //         {'requirementData': });
          //         },
          //         child: Text(
          //           'Upload',
          //           style: TextStyle(
          //               fontSize: 13.sp,
          //               fontWeight: FontWeight.bold,
          //               color: kwhitecolor),
          //         )),
          //   ),
          // ),
          // Padding(
          //   padding: EdgeInsets.all(10.0.w),
          //   child: Container(
          //     width: screenWidth,
          //     // height: 100,
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(5.w), color: kashcolor),
          //     child: Column(
          //       children: [
          //
          //
          //       ],
          //     ),
          //   ),
          // )

          // GestureDetector(
          //   onTap: ()async{
          //
          //   },
          //   child: Container(
          //       alignment: Alignment.center,
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.vertical(
          //             bottom: Radius.circular(5.w),
          //           ),
          //           color: kprimarycolor),
          //       width: 140.w,
          //       height: 20.w,
          //       child: Text(
          //         'Upload File',
          //         style: TextStyle(
          //             color: kwhitecolor,
          //             fontSize: 12.sp,
          //             fontWeight: FontWeight.bold),
          //       )),
          // ),

          heigh20,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  if (uploadWorkFilesController.imgurlList.isNotEmpty) {
                    final documentReference = await FirebaseFirestore.instance
                        .collection('ArchitectData')
                        .doc(FirebaseAuth.instance.currentUser!.uid);
                    await documentReference.update({
                      'dashboardData.deliveredServices': FieldValue.increment(1)
                    });
                    await FirebaseFirestore.instance
                        .collection('orderData')
                        .doc(orderData.orderUid)
                        .get()
                        .then((documentSnapshot) {
                      if (documentSnapshot.exists) {
                        Map<String, dynamic>? documentData =
                            documentSnapshot.data();
                        documentData!['servicesSelectedModel'][serviceIndex]
                                ['planurl']['0'] =
                            uploadWorkFilesController.imgurlList;
                        documentData['servicesSelectedModel'][serviceIndex]
                            ['isCompleted'] = true;

                        // Update the document with the modified array
                        FirebaseFirestore.instance
                            .collection('orderData')
                            .doc(orderData.orderUid)
                            .set(documentData)
                            .then(
                                (value) => print('Value updated successfully.'))
                            .catchError((error) =>
                                print('Error updating value: $error'));
                        print(orderData.orderUid);
                        // print(widget.architectUid);
                      } else {
                        print('Document does not exist.');
                      }
                    });

                    Get.back();
                  } else {
                    Fluttertoast.showToast(msg: 'Loading... Please Wait');
                  }
                },
                child: Container(
                  height: 30.w,
                  width: 141.w,
                  decoration: BoxDecoration(color: kprimarycolor),
                  child: Center(
                      child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 13.sp, color: kwhitecolor),
                  )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  uploadWorkFilesController.cleatIm();
                  Get.back();
                },
                child: Container(
                  height: 30.w,
                  width: 141.w,
                  decoration: BoxDecoration(
                      color: kwhitecolor,
                      border: Border.all(color: kprimarycolor)),
                  child: Center(
                      child: Text(
                    'Cancel',
                    style: TextStyle(fontSize: 13.sp, color: kprimarycolor),
                  )),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Future<void> cofirmationPopup(
      BuildContext context, String field, value, int arrayLength) {
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
                          fontSize: 14.sp,
                          color: kblackcolor,
                          fontWeight: FontWeight.bold),
                    )),
                Spacer(),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        for (var i = 0; i < arrayLength; i++) {
                          await FirebaseFirestore.instance
                              .collection("orderData")
                              .doc(orderUid)
                              .update({
                            field: FieldValue.arrayUnion([value[i]])
                          });
                        }

                        Get.back();
                        uploadWorkFilesController.cleatIm();
                      },
                      child: Container(
                        height: 30.w,
                        width: 141.w,
                        decoration: BoxDecoration(color: kprimarycolor),
                        child: Center(
                            child: Text(
                          'Yes',
                          style: TextStyle(fontSize: 13.sp, color: kwhitecolor),
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
                              TextStyle(fontSize: 13.sp, color: kprimarycolor),
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
