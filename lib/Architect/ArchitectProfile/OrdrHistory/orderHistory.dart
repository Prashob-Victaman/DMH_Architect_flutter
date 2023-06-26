import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/OrdrHistory/widgets/OrderDetails.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/OrdrHistory/widgets/RequestWidget.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/OrdrHistory/widgets/ServicesSelected.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/OrdrHistory/widgets/UploadRequirements.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/OrdrHistory/widgets/customerOrders.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/ordersProfile.dart';
import 'package:dmh_architect/Constants/constants.dart';
import 'package:dmh_architect/model/orderDataModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

                  final data = OrderDataModel.fromJson(snapshot.data!);

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
                              // width: screenWidth * 0.5,
                              // height: 100.w,
                              height: 60.w,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Architect - ${architectName}',
                                    style: bold15,
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
                            SizedBox(
                              width: 110.w,
                              height: 30.w,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              kprimarycolor)),
                                  onPressed: () {
                                    Get.to(() => CustomerOrders(
                                          orderUid: orderUid,
                                          // selectedServicesList:
                                          //     data.servicesSelectedModel,
                                        ));
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    // width: 100.w,
                                    // height: 40.w,
                                    width: 110.w,
                                    height: 30.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.w)),
                                    child: Text(
                                      'Order Details',
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        color: kwhitecolor,
                                      ),
                                    ),
                                  )),
                            )
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
}
