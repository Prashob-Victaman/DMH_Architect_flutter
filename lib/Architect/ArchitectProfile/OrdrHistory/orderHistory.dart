import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/OrdrHistory/widgets/OrderDetails.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/OrdrHistory/widgets/RequestWidget.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/OrdrHistory/widgets/ServicesSelected.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/OrdrHistory/widgets/UploadRequirements.dart';
import 'package:dmh_architect/Architect/productview/productview.dart';
import 'package:dmh_architect/Constants/constants.dart';
import 'package:dmh_architect/model/orderDataModel.dart';
import 'package:dmh_architect/model/uploadDesignDataModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class OrderHistoryUser extends StatelessWidget {
  String orderId;
  var dateTime;
  String architectName;
  String orderUid;
  List imageUrlList;
  int index;
  List orderList;
  String userUid;

  OrderHistoryUser({
    super.key,
    required this.dateTime,
    required this.orderId,
    required this.imageUrlList,
    required this.architectName,
    required this.orderUid,
    required this.index,
    required this.orderList,
    required this.userUid,
  });

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

                  var selectedServicesList = data.servicesSelectedModel;

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
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Text(
                              'Order History',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: kprimarycolor),
                            ),
                            const Spacer(),
                            (data.servicesSelectedModel.every(
                                        (item) => item['isPaid'] == false) &&
                                    orderList.isNotEmpty)
                                ? CircleAvatar(
                                    backgroundColor: kprimarycolor,
                                    radius: 20.w,
                                    child: IconButton(
                                      onPressed: () {
                                        cofirmationPopup(context, 'Delete',
                                            index, orderList, userUid);
                                      },
                                      icon: Icon(
                                        Icons.delete, // delete button
                                        color: kwhitecolor,
                                        size: 23.sp,
                                      ),
                                    ),
                                  )
                                : const SizedBox()
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: screenWidth - 30.w,
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: screenWidth / 2,
                                        child: Text(
                                          'Customer - ${data.customerName}',
                                          style: bold15,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      heigh5,
                                      Text(
                                        orderId,
                                        style: bold15,
                                      ),
                                      heigh5,
                                      FutureBuilder(
                                          future: getAddress(
                                              data.constomerLocation.latitude,
                                              data.constomerLocation.longitude),
                                          builder: (context, snap) {
                                            return SizedBox(
                                              width: screenWidth - 125.w,
                                              child: Text(
                                                'Site address - ${snap.data}',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                style: normal14,
                                              ),
                                            );
                                          }),
                                      heigh5,
                                      Text(
                                        formatedDate,
                                        style: normal14,
                                      ),
                                      heigh10,
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.w),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                GestureDetector(
                                                  onTap: () async {
                                                    var architectdata =
                                                        await FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                'UserData')
                                                            .doc(data
                                                                .customerUid)
                                                            .get();

                                                    if (!await launchUrl(Uri.parse(
                                                        'tel:${architectdata['ProfileDetails']['mobileNumber']}'))) {
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
                                                width20,
                                                GestureDetector(
                                                  onTap: () async {
                                                    var architectdata =
                                                        await FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                'UserData')
                                                            .doc(data
                                                                .customerUid)
                                                            .get();

                                                    if (!await launchUrl(Uri.parse(
                                                        'whatsapp://send?phone=+91${architectdata['ProfileDetails']['mobileNumber']}'))) {
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
                                                width20,
                                                GestureDetector(
                                                  onTap: () async {
                                                    openGoogleMapsApp(
                                                        data.constomerLocation
                                                            .latitude,
                                                        data.constomerLocation
                                                            .longitude);
                                                  },
                                                  child: FaIcon(
                                                    FontAwesomeIcons
                                                        .mapLocationDot,
                                                    size: 24.sp,
                                                    color: kprimarycolor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
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
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   width: 65.w,
                            //   height: 35.w,
                            //   decoration: BoxDecoration(
                            //       color: kredcolor,
                            //       borderRadius: BorderRadius.circular(5.w)),
                            //   child: Text(
                            //     'Delete',
                            //     style: TextStyle(
                            //         color: kwhitecolor, fontSize: 14.sp),
                            //   ),
                            // )

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
                      imageUrlList.length == 0
                          ? FutureBuilder(
                              future: FirebaseFirestore.instance
                                  .collection('DesignDataFromAdmin')
                                  .doc(data.designUid)
                                  .get(),
                              builder: (builder, snap) {
                                if (snap.hasError) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                                if (!snap.hasData) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                                List imageUrlList =
                                    snap.data?['exteriorImageList'];
                                return OrderDetailsClass(
                                    orderUid: data.designUid,
                                    data: data,
                                    screenWidth: screenWidth,
                                    imageUrlList: imageUrlList);
                              })
                          : OrderDetailsClass(
                              orderUid: data.designUid,
                              data: data,
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
                          aboutService: aboutService,
                          orderData: data),
                      heigh10,
                      // RequestWidget(
                      //     screenWidth: screenWidth,
                      //     requestList: data.requestList),
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

  Future<String> getAddress(double latitude, double longitude) async {
    String address;
    try {
      final url =
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$mapApiKey';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        if (result['status'] == 'OK') {
          address = result['results'][0]['formatted_address'];
        } else {
          address = 'Loading..';
        }
      } else {
        address = '';
      }
      return address;
    } catch (e) {}
    return '';
  }

  //

  // getArchitectData(architectUid) async {
  Future<void> cofirmationPopup(BuildContext context, String title, int index,
      List orderList, String userUid) {
    return showDialog<void>(
      context: context,
      builder: (
        BuildContext context,
      ) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(0.w),
          title: SizedBox(
            height: 114.w,
            width: 282.w,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  alignment: Alignment.center,
                  height: 84.w,
                  child: Text(
                    'Are you sure you want to $title?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: kblackcolor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        // DocumentSnapshot documentSnapshot =
                        //     await FirebaseFirestore.instance
                        //         .collection('UserData')
                        //         .doc(FirebaseAuth.instance.currentUser!.uid)
                        //         .get();

                        final DocumentReference documentRef = FirebaseFirestore
                            .instance
                            .collection('ArchitectData')
                            .doc(FirebaseAuth.instance.currentUser!.uid);

                        final DocumentReference userDocumentReference =
                            FirebaseFirestore.instance
                                .collection('UserData')
                                .doc(userUid);

                        // if (documentSnapshot.exists) {
                        //   Map<String, dynamic> data =
                        //       documentSnapshot.data() as Map<String, dynamic>;
                        //   List<dynamic> myOrders =
                        //       data['myOrders'] as List<dynamic>;

                        //   myOrders.removeWhere((item) => item[index] == index);

                        //   await documentRef.update({'myOrders': myOrders});
                        // }

                        await userDocumentReference.update({
                          'myOrders': FieldValue.arrayRemove([orderList[index]])
                        });

                        await documentRef.update({
                          'orders': FieldValue.arrayRemove([orderList[index]])
                        });
                        Get.back();
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

  //

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
                                        print('Value updated successfully.2'))
                                    .catchError((error) =>
                                        print('Error updating value: $error'));
                          } else {}
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

class OrderDetailsClass extends StatelessWidget {
  const OrderDetailsClass(
      {super.key,
      required this.data,
      required this.screenWidth,
      required this.imageUrlList,
      required this.orderUid});

  final OrderDataModel data;
  final double screenWidth;
  final List imageUrlList;
  final String orderUid;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("DesignDataFromAdmin")
            .doc(orderUid)
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
          final designData = designDataModel.fromJson(snapshot.data);
          return GestureDetector(
            onTap: () => Get.to(
              () => ProductView(DesignData: designData),
            ),
            child: OrderDetails(
                orderData: data,
                screenWidth: screenWidth,
                imageUrlList: imageUrlList),
          );
        });
  }
}
