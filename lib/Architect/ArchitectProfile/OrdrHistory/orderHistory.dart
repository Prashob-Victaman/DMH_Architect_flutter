import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/OrdrHistory/widgets/OrderDetails.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/OrdrHistory/widgets/RequestWidget.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/OrdrHistory/widgets/ServicesSelected.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/OrdrHistory/widgets/UploadRequirements.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/OrdrHistory/widgets/customerOrders.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/ordersProfile.dart';
import 'package:dmh_architect/Constants/constants.dart';
import 'package:dmh_architect/model/orderDataModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderHistoryUser extends StatelessWidget {
  String orderId;
  var dateTime;
  String architectName;
  String orderUid;
  List imageUrlList;
  OrderHistoryUser(
      {super.key,
      required this.dateTime,
      required this.orderId,
      required this.imageUrlList,
      required this.architectName,
      required this.orderUid});

  List serviceTitle = [
    'Floor Plan',
    'Structural Drawing',
    '3D Front Elevation',
    '2D Front Elevation',
    '3D Floor Plan',
    'Working Drawing',
    'Electrical Plan',
    'Plumbing Plan',
    'Walkthough Video'
  ];

  final aboutService = [
    "Customized Floor plan will be design as per client’s plot, requirements, preference and up to satisfaction in 2D. In this we cover dimensions, Vastu compliant, basicfurniture layout, and door & window locations etc",
    "Column Marking Drawings, Foundation details, Footing details, Column Details,Plinth & Slab level Beam details, Roof details etc.",
    "Customized front elevation (Exterior)will be design as per client preference and up to satisfaction in 3D. This will give imaginative look of Constructed building from two sides (Front and one side). It gives you an idea that how's your house exterior will look like after complete finish with colour combination, balcony and door & window design, Boundary wall etc.",
    "Technical working details of 3D front elevation for construction in 2D with dimensions and levels.",
    "3D Floor Plan is now in the trend. As it is the best possible method to depict a 2d layout effectively in 3d imitation. It is one kind of a bird view that shows the external & internal walls, door & window location, furniture layout, etc.",
    "Working drawing with Wall details, Door & Window details, Section Drawings, Stair Case details etc.",
    "Wiring, Switch Calculation, Electrical Component Location etc.",
    "Water Flow, Out Flow, Drainage,Sewerage Pipe Lines, Septic etc.",
    "Video Walkthrough is a short 1-2 minutes featured video clip, which enables us to get a tour of whole designed architecture in an effective way. Walkthrough covers all intricate detailing of the designs and present it in 3D.",
  ];
  String? updatedOrderUid;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    //  updatedOrderUid = orderUid;

    String formatedDate = DateFormat("dd-MMM-yyyy   hh:mm a").format(dateTime);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            heigh10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Order History',
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: kprimarycolor),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.w),
              ),
              // height: 500.w,
              width: screenWidth,
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

                  OrderDataModel data = OrderDataModel.fromJson(snapshot.data!);

                  List selectedServicesList = data.servicesSelectedModel;

                  final numberOfFloors =
                      data.averageAreaDimension['noOfFloors'];

                  final numberOffloorsText = numberOfFloors == 1
                      ? 'Ground'
                      : numberOfFloors == 2
                          ? 'Two'
                          : numberOfFloors == 3
                              ? 'Three'
                              : 'Four';

                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: screenWidth - 25.w,
                              // height: 100.w,
                              // height: 60.w,
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: screenWidth - 120,
                                        child: Text(
                                          'Customer - ${data.customerName}',
                                          style: bold15,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        orderId,
                                        style: bold15,
                                      ),
                                      Text(
                                        '${formatedDate}',
                                        style: normal14,
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  (selectedServicesList[0]['isAproved'] ==
                                              false &&
                                          selectedServicesList[0]
                                                  ['isRejected'] ==
                                              false) // accept and reject only storing in floor plan (0 th index)

                                      ? Column(
                                          children: [
                                            SizedBox(
                                              width: 90.w,
                                              height: 25.w,
                                              child: ElevatedButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(
                                                                  ksuccesscolor)),
                                                  onPressed: () {
                                                    // Get.to(() => CustomerOrders(
                                                    //       customerUid: data.customerUid,
                                                    //       orderUid: orderUid,
                                                    //       // selectedServicesList:
                                                    //       //     data.servicesSelectedModel,
                                                    //     ));
                                                    orderConfirmationAcceptPopup(
                                                        context,
                                                        'Accept',
                                                        0,
                                                        'isAproved',
                                                        true);
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    // width: 100.w,
                                                    // height: 40.w,
                                                    width: 90.w,
                                                    height: 25.w,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.w)),
                                                    child: Text(
                                                      'Accept',
                                                      style: TextStyle(
                                                        fontSize: 12.sp,
                                                        color: kwhitecolor,
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                            heigh5,
                                            SizedBox(
                                              width: 90.w,
                                              height: 25.w,
                                              child: ElevatedButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(kredcolor)),
                                                  onPressed: () {
                                                    // Get.to(() => CustomerOrders(
                                                    //       customerUid: data.customerUid,
                                                    //       orderUid: orderUid,
                                                    //       // selectedServicesList:
                                                    //       //     data.servicesSelectedModel,
                                                    //     ));

                                                    orderConfirmationAcceptPopup(
                                                        context,
                                                        'Reject',
                                                        0,
                                                        'isRejected',
                                                        true);
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    // width: 100.w,
                                                    // height: 40.w,
                                                    width: 90.w,
                                                    height: 25.w,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.w)),
                                                    child: Text(
                                                      'Reject',
                                                      style: TextStyle(
                                                        fontSize: 12.sp,
                                                        color: kwhitecolor,
                                                      ),
                                                    ),
                                                  )),
                                            )
                                          ],
                                        )
                                      : SizedBox()
                                ],
                              ),
                            ),
                            const Spacer(),
                            // Container(
                            //   width: 100.w,
                            //   height: 45,
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(5.w),
                            //       color: kprimarycolor50.withOpacity(0.5)),
                            //   child: Column(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       Text(
                            //         'Status',
                            //         style: TextStyle(
                            //             fontSize: 15.w,
                            //             color: kblackcolor,
                            //             fontWeight: FontWeight.bold),
                            //       ),
                            //       Text(
                            //         'Pending',
                            //         style: TextStyle(
                            //             fontSize: 15.w,
                            //             color: kredcolor,
                            //             fontWeight: FontWeight.bold),
                            //       )
                            //     ],
                            //   ),
                            // )
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        height: 2.w,
                      ),
                      heigh10,
                      Text(
                        'Order Details',
                        style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                            color: kprimarycolor),
                      ),
                      Row(
                        children: [
                          width10,
                          Text(
                            'Design this type : ',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: kprimarycolor),
                          ),
                          Text(
                            data.houseType,
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: kblackcolor),
                          ),
                        ],
                      ),
                      heigh10,
                      OrderDetails(
                          orderData: data,
                          screenWidth: screenWidth,
                          imageUrlList: imageUrlList),
                      heigh10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Average Dimension : ',
                            style: TextStyle(
                                fontSize: 13.sp, color: kprimarycolor),
                          ),
                          Text(
                            ' Length :  ${data.averageAreaDimension['averageLength']} ft. ,Width : ${data.averageAreaDimension['averageWidth']} ft. ',
                            style:
                                TextStyle(fontSize: 13.sp, color: kblackcolor),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Floor :   ${numberOffloorsText} Floor only,  Total Area : ${data.averageAreaDimension['averageArea']} sqft.',
                            style:
                                TextStyle(fontSize: 13.sp, color: kblackcolor),
                          ),
                        ],
                      ),
                      heigh10,
                      Padding(
                        padding: EdgeInsets.all(10.0.w),
                        child: Row(
                          children: [
                            Text(
                              'Services Selected',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: kprimarycolor),
                            ),
                            const Spacer(),
                            // SizedBox(
                            //   width: 110.w,
                            //   height: 30.w,
                            //   child: ElevatedButton(
                            //       style: ButtonStyle(
                            //           backgroundColor:
                            //               MaterialStateProperty.all(
                            //                   kprimarycolor)),
                            //       onPressed: () {
                            //         Get.to(() => CustomerOrders(
                            //               customerUid: data.customerUid,
                            //               orderUid: orderUid,
                            //               // selectedServicesList:
                            //               //     data.servicesSelectedModel,
                            //             ));
                            //       },
                            //       child: Container(
                            //         alignment: Alignment.center,
                            //         // width: 100.w,
                            //         // height: 40.w,
                            //         width: 110.w,
                            //         height: 30.w,
                            //         decoration: BoxDecoration(
                            //             borderRadius:
                            //                 BorderRadius.circular(5.w)),
                            //         child: Text(
                            //           'Order Details',
                            //           style: TextStyle(
                            //             fontSize: 11.sp,
                            //             color: kwhitecolor,
                            //           ),
                            //         ),
                            //       )),
                            // )
                          ],
                        ),
                      ),
                      heigh5,
                      ServicesSelected(
                          selectedServicesList: data.servicesSelectedModel,
                          serviceTitle: serviceTitle,
                          aboutService: aboutService),
                      heigh10,
                      RequestWidget(
                          screenWidth: screenWidth,
                          requestList: data.requestList),
                      UploadRequirements(
                        screenWidth: screenWidth,
                        requiredData: data.requirementData,
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> orderConfirmationAcceptPopup(
    BuildContext context,
    String title,
    int index,
    String field,
    bool value,
  ) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.only(top: 10.w),
          title: Container(
            // height: 114.w,
            width: 320.w,
            child: Column(
              children: [
                heigh10,
                Container(
                  alignment: Alignment.center,
                  // height: 84.w,
                  child: Text(
                    'Are you sure you want to $title?',
                    style: normal15,
                  ),
                ),
                heigh20,
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final documentReference = await FirebaseFirestore
                            .instance
                            .collection('ArchitectData')
                            .doc(FirebaseAuth.instance.currentUser!.uid);

                        await documentReference.update({
                          'dashboardData.acceptedServicesCount':
                              FieldValue.increment(1),
                        });

                        await FirebaseFirestore.instance
                            .collection('orderData')
                            .doc(orderUid!)
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

                                // Update the document with the modified array
                                FirebaseFirestore.instance
                                    .collection('orderData')
                                    .doc(orderUid!)
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
                        //     .doc(orderUid!)
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
}
