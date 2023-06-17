

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/OrdrHistory/widgets/OrderDetails.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/OrdrHistory/widgets/RequestWidget.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/OrdrHistory/widgets/ServicesSelected.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/OrdrHistory/widgets/UploadRequirements.dart';
import 'package:dmh_architect/Constants/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class OrderHistoryUser extends StatelessWidget {
  String orderId;
  var dateTime;
  String architectName;
  List imageUrlList;
  OrderHistoryUser(
      {super.key,
      required this.dateTime,
      required this.orderId,
      required this.imageUrlList, required this.architectName});

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
  

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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

                    // final data = OrderModel.fromJson(snapshot.data!);

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
                                    Text('Architect - ${architectName}', style: bold15,),
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
                              Spacer(),
                              Container(
                                width: 100.w,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.w),
                                    color: kprimarycolor50.withOpacity(0.5)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Status',
                                      style: TextStyle(
                                          fontSize: 15.w,
                                          color: kblackcolor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Pending',
                                      style: TextStyle(
                                          fontSize: 15.w,
                                          color: kredcolor,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )
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
                              'Design this type :',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: kprimarycolor),
                            ),
                            Text(
                              ' Simplex',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: kblackcolor),
                            ),
                          ],
                        ),
                        heigh10,
                        OrderDetails(
                            screenWidth: screenWidth,
                            imageUrlList: imageUrlList),
                        heigh10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Average Dimension : ',
                              style: TextStyle(
                                  fontSize: 16.sp, color: kprimarycolor),
                            ),
                            Text(
                              'Width : 25ft. , Length : 60ft.',
                              style: TextStyle(
                                  fontSize: 16.sp, color: kblackcolor),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Floor : Ground Floor only,   Total Area : 1500sqft.',
                              style: TextStyle(
                                  fontSize: 14.sp, color: kblackcolor),
                            ),
                          ],
                        ),
                        heigh10,
                        Text(
                          'Services Selected',
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                              color: kprimarycolor),
                        ),
                        heigh5,
                        ServicesSelected(
                            serviceTitle: serviceTitle,
                            aboutService: aboutService),
                        heigh10,
                        RequestWidget(screenWidth: screenWidth),
                        UploadRequirements(screenWidth: screenWidth)
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
