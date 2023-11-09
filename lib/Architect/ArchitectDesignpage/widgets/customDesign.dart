// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dmh_architect/Architect/Architectbottomnavigationbar/Architectbottomnavigationbar.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// import '../../../Constants/constants.dart';
// import '../../../controller/CustomDesignController.dart';
// import 'SubScreen/plotareadetails.dart';
// import 'SubScreen/updoad_design_part2.dart';
// import 'SubScreen/upload_design_part3.dart';

// class CustomDesigns extends StatelessWidget {
//   CustomDesigns({Key? key}) : super(key: key);

//   final getController = Get.put(CustomDesignController());

//   final formKey1 = GlobalKey<FormState>();

//   int selectedHouseFloor = 0;

//   final TextEditingController projectDetailsController =
//       TextEditingController();
//   final TextEditingController plotLengthController = TextEditingController();
//   final TextEditingController plotWidthController = TextEditingController();
//   final TextEditingController totalAreaController = TextEditingController();

//   final TextEditingController accordingVastuController =
//       TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     String selectedFloor = 'Basement';

//     final List<String> _floorDropdown = [
//       "Basement",
//     ];

//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ListView(
//             children: [
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: TextButton.icon(
//                     onPressed: () {
//                       Get.to(() => Architectbottomnavigationbar(selectedindex: 0));
//                     },
//                     icon: const Icon(Icons.arrow_back),
//                     label: const Text('Back')),
//               ),
//               heigh10,
//               Text(
//                 'Customise Your Design',
//                 style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
//               ),
//               heigh10,
//               UploadDesignFromUserPartTwo(),
//               UploadDesignFromUserPartThree(
//                   selectedHouseFloor: selectedHouseFloor),
//               Form(
//                 key: formKey1,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     heigh10,
//                     Text(
//                       'Project Details',
//                       style: TextStyle(
//                           fontSize: 14.sp, fontWeight: FontWeight.w600),
//                     ),
//                     heigh10,
//                     TextFormField(
//                       controller: projectDetailsController,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Please enter Description';
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                         contentPadding: EdgeInsets.only(left: 10.w, top: 10.w),
//                         fillColor: kredcolor,
//                         hintText: 'Add some description about your project',
//                         hintStyle: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           fontSize: 14.sp,
//                           color: Colors.grey.shade600,
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(5.w),
//                           borderSide: const BorderSide(color: Colors.black12),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(5.w),
//                           borderSide: const BorderSide(color: Colors.black12),
//                         ),
//                       ),
//                       maxLines: 6,
//                     ),
//                     heigh10,
//                     CustomPlotAreaDetails(
//                         plotLengthController: plotLengthController,
//                         plotWidthController: plotWidthController,
//                         totalAreaController: totalAreaController),
//                     heigh10,
//                     const Text(
//                       'According to Vastu (In %)',
//                       style:
//                           TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//                     ),
//                     heigh10,
//                     SizedBox(
//                       child: TextFormField(
//                         keyboardType: TextInputType.number,
//                         controller: accordingVastuController,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Please enter Something';
//                           }
//                           return null;
//                         },
//                         decoration: customInputDecoration('According to Vastu'),
//                       ),
//                     ),
//                     heigh10,
//                   ],
//                 ),
//               ),
//               // heigh10,
//               // Text(
//               //   'Floor Details',
//               //   style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
//               // ),
//               // heigh5,
//               // FloorDetails(),

//               StreamBuilder(
//                   stream: FirebaseFirestore.instance
//                       .collection("UserData")
//                       .doc(FirebaseAuth.instance.currentUser!.uid)
//                       .snapshots(),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasError) {
//                       return Center(child: CircularProgressIndicator());
//                     }
//                     if (!snapshot.hasData) {
//                       return Center(child: CircularProgressIndicator());
//                     }

//                     final userData = snapshot.data!['ProfileDetails'];

//                     return GestureDetector(
//                       child: SizedBox(
//                         width: 60.w,
//                         height: 35.w,
//                         child: ElevatedButton(
//                           style: ButtonStyle(
//                             backgroundColor: MaterialStateProperty.all<Color>(
//                                 const Color.fromARGB(255, 255, 90, 95)),
//                           ),
//                           onPressed: () {
//                             final form1 = formKey1.currentState;

//                             if (form1!.validate()) {
//                               // getController.uploadDesignData();
//                               Get.to(
//                                   () => Architectbottomnavigationbar(selectedindex: 1));
//                               getController.uploadCustomDesignData(
//                                   FirebaseAuth.instance.currentUser!.uid,
//                                   projectDetailsController.text,
//                                   getController.selectedDesignTypeindex == 0
//                                       ? 'Modern'
//                                       : getController.selectedDesignTypeindex ==
//                                               1
//                                           ? 'Classic'
//                                           : 'Others',
//                                   selectedHouseFloor == 0
//                                       ? '1 FLoor'
//                                       : selectedHouseFloor == 1
//                                           ? '2 FLoor'
//                                           : 'Others',
//                                   HouseType[getController.selectedHouseType],
//                                   {
//                                     'length': plotLengthController.text,
//                                     'width': plotWidthController.text,
//                                     'area': totalAreaController.text,
//                                   },
//                                   accordingVastuController.text,
//                                   userData['mobileNumber'],
//                                   '${userData['firstName']}${userData['lastName']}',
//                                   'Not Updated',
//                                   'Custom Design');
//                             }
//                           },
//                           child: Text('Submit', style: normal16),
//                         ),
//                       ),
//                     );
//                   }),
//               heigh20,
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   customTail(screenWidth, text, color) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 8.sp),
//       width: screenWidth / 3 - 10.w,
//       decoration: BoxDecoration(
//         color: color,
//         border: Border.all(width: 1.sp, color: Colors.red),
//         borderRadius: const BorderRadius.all(Radius.circular(50)),
//       ),
//       child: Center(
//         child: Text(
//           text,
//           style: TextStyle(fontSize: 14.sp),
//         ),
//       ),
//     );
//   }
// }
