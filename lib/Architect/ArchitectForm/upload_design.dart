// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dmh_architect/Architect/ArchitectProfile/ArchitectMyDesign.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import '../../Constants/constants.dart';
// import '../../controller/uploadDesignController.dart';
// import '../ArchitectDesignpage/widgets/SubScreen/floorDetails.dart';
// import '../Architectbottomnavigationbar/Architectbottomnavigationbar.dart';
// import 'SubScreen/plotareadetails.dart';
// import 'SubScreen/updoad_design_part2.dart';
// import 'SubScreen/upload_design_part3.dart';

// class UploadDesign extends StatefulWidget {
//   const UploadDesign({Key? key}) : super(key: key);

//   @override
//   State<UploadDesign> createState() => _UploadDesignState();
// }

// class _UploadDesignState extends State<UploadDesign> {
//   final getController = Get.put(uploadDesignTypeController());

//   final formKey1 = GlobalKey<FormState>();

//   int planningGridCount = 1;
//   int structureGridCount = 0;
//   int elevationGridCount = 0;
//   int selectedHouseFloor = 0;
//   int selectedHouseFacing = 0;
//   final TextEditingController estimateCostControler = TextEditingController();
//   final TextEditingController projectDetailsController =
//       TextEditingController();
//   final TextEditingController plotLengthController = TextEditingController();
//   final TextEditingController plotWidthController = TextEditingController();
//   final TextEditingController totalAreaController = TextEditingController();
//   final TextEditingController designpriceController = TextEditingController();
//   final TextEditingController shortDescriptionController =
//       TextEditingController();

//   final TextEditingController planingFileNameController =
//       TextEditingController();

//   final TextEditingController accordingVastuController =
//       TextEditingController();
//   final TextEditingController approximateCostController =
//       TextEditingController();
//   final TextEditingController planingBasementController =
//       TextEditingController();
//   final TextEditingController planningGroundController =
//       TextEditingController();
//   final TextEditingController planningFirstFloorController =
//       TextEditingController();

//   final List planingFileNameControllerList = [TextEditingController()];
//   final List planingFilePriceControllerList = [TextEditingController()];

// <<<<<<< HEAD
// =======
//   final GetUploadController = Get.put(UploadDesignController());
//   final getcontroller = Get.put(uploadDesignTypeController());


// >>>>>>> d8ca925f1b27ba4ec958d4ee007878dd874e92b6
//   @override
//   void initState() {
//     // TODO: implement initState
//     // getController.planingImageCountIncrease();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     String selectedFloor = 'Basement';

//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ListView(
//             children: [
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: TextButton.icon(
//                     onPressed: () {
//                       Get.to(
//                           () => Architectbottomnavigationbar(selectedindex: 0));
//                     },
//                     icon: const Icon(Icons.arrow_back),
//                     label: const Text('Back')),
//               ),
//               heigh10,
//               Text(
//                 'Upload Property Designs',
//                 style:
//                 TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
//               ),
//               const Divider(),
//               SizedBox(
//                 height: 10.w,
//               ),
//               Row(
//                 children: [
//                   Text(
//                     'Upload Exterior Image',
//                     style: TextStyle(
//                         fontSize: 18.sp, fontWeight: FontWeight.bold),
//                   ),
//                   const Spacer(),
//                   Container(
//                     alignment: Alignment.center,
//                     width: 40.w,
//                     height: 40.w,
//                     decoration: BoxDecoration(
//                         color: kprimarycolor.withOpacity(0.2),
//                         borderRadius: BorderRadius.circular(5.w)),
//                     child: GestureDetector(
//                       onTap: () {
//                         if (getController.exteriorDesignNameControllerList.length <
//                             9) {
//                           getController.changetextControllercount(1);
//                         }
//                       },
//                       child: Row(
//                         children: [
//                           const Spacer(),

//                           Icon(
//                             Icons.add,
//                             color: kprimarycolor,
//                             size: 25.w,
//                           ),
//                           const Spacer(),

//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10.w,
//                   ),
//                   Container(
//                     alignment: Alignment.center,
//                     width: 40.w,
//                     height: 40.w,
//                     decoration: BoxDecoration(
//                         color: kprimarycolor.withOpacity(0.2),
//                         borderRadius: BorderRadius.circular(5.w)),
//                     child: GestureDetector(
//                       onTap: () {
//                         if (getcontroller
//                             .exteriorDesignNameControllerList.length >
//                             3) {
//                           getcontroller.changetextControllercount(0);
//                         }
//                       },
//                       child: Row(
//                         children: [
//                           const Spacer(),

//                           Icon(
//                             Icons.delete,
//                             color: kprimarycolor,
//                             size: 25.w,
//                           ),
//                           const Spacer()
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 10.w,
//               ),
//               GetBuilder<uploadDesignTypeController>(builder: (Getdata) {
//                 print(getController.exteriorDesignNameControllerList.length);
//                 return SizedBox(
//                   child: GridView.builder(
//                       shrinkWrap: true,
//                       gridDelegate:
//                       const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 3, childAspectRatio: 1.6),
//                       physics: const ScrollPhysics(),
//                       itemCount: getcontroller
//                           .exteriorDesignNameControllerList.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return Column(
//                           children: [
//                             GestureDetector(
//                               onTap: () =>
//                                   Getdata.uploadexteriorimagefileOne(index),
//                               child: Getdata.exteriorimgunit8List[index] !=
//                                   null
//                                   ? Container(
//                                 height: 100.w,
//                                 width: 100.w,
//                                 decoration: BoxDecoration(
//                                     border: Border.all(
//                                         width: 1.w,
//                                         color: kprimarycolor),
//                                     borderRadius:
//                                     BorderRadius.circular(5.w),
//                                     image: DecorationImage(
//                                         fit: BoxFit.cover,
//                                         image: MemoryImage(Getdata
//                                             .exteriorimgunit8List[
//                                         index]!))),
//                               )
//                                   : uploadDesign(
//                                 // uploadedImage: Getdata.designDataImgOne!
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10.w,
//                             ),
//                             SizedBox(
//                               height: 40.w,
//                               width: 390.w,
//                               child: TextField(
//                                 textAlignVertical: TextAlignVertical.center,
//                                 controller: getcontroller
//                                     .exteriorDesignNameControllerList[index],
//                                 decoration: InputDecoration(
//                                     contentPadding:
//                                     EdgeInsets.only(left: 10.w),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             width: 1.w,
//                                             color: kprimarycolor))),
//                               ),
//                             ),
//                           ],
//                         );
//                       }),
//                 );
//               }),

//               SizedBox(
//                 height: 20.w,
//               ),
//               heigh10,
//               const Text(
//                 'Select floor file/Photo of your project',
//                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//               ),
//               heigh10,
//               GetBuilder<uploadDesignTypeController>(builder: (context) {
//                 return Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     GestureDetector(
//                       onTap: () => getController.fetchFloorImg(0),
//                       child: customUploadButton(getController.floorImgs[0]),
//                     ),
//                     GestureDetector(
//                       onTap: () => getController.fetchFloorImg(1),
//                       child: customUploadButton(getController.floorImgs[1]),
//                     ),
//                     GestureDetector(
//                       onTap: () => getController.fetchFloorImg(2),
//                       child: customUploadButton(getController.floorImgs[2]),
//                     ),
//                   ],
//                 );
//               }),

//               Form(
//                 key: formKey1,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     heigh10,
//                     const Text(
//                       'Design Price',
//                       style:
//                           TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//                     ),
//                     heigh10,
//                     SizedBox(
//                       child: TextFormField(
//                         keyboardType: TextInputType.number,
//                         controller: designpriceController,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Please enter Design Price';
//                           }
//                           return null;
//                         },
//                         decoration: customInputDecoration('Design Price'),
//                       ),
//                     ),
//                     heigh10,
//                     const Text(
//                       'Short Description',
//                       style:
//                           TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//                     ),
//                     heigh10,
//                     SizedBox(
//                       child: TextFormField(
//                         controller: shortDescriptionController,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Please enter Short Description';
//                           }
//                           return null;
//                         },
//                         decoration:
//                             deatilscustomInputDecoration('Short Description'),
//                       ),
//                     ),
//                     heigh10,
//                     const Text(
//                       'Project Details',
//                       style:
//                           TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
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
//                           fontSize: 14,
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
//                     UploadDesignPartTwo(),
//                     UploadDesignPartThree(
//                         selectedHouseFacing: selectedHouseFacing,
//                         selectedHouseFloor: selectedHouseFloor),

//                     heigh10,
//                     PlotAreaDetails(
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
//                     const Text(
//                       'Estimated construction cost',
//                       style:
//                           TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//                     ),
//                     heigh10,
//                     SizedBox(
//                       child: TextFormField(
//                         controller: approximateCostController,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Please enter Approximate cost';
//                           }
//                           return null;
//                         },
//                         onChanged: (value) {},
//                         keyboardType: TextInputType.number,
//                         decoration: customInputDecoration('₹ 23,88,500'),
//                       ),
//                     ),
//                     heigh10,
//                     const Text(
//                       'Approximate construction time',
//                       style:
//                           TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//                     ),
//                     heigh10,
//                     SizedBox(
//                       child: TextFormField(
//                         controller: estimateCostControler,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Please enter Estimated cost';
//                           }
//                           return null;
//                         },
//                         onChanged: (value) {},
//                         keyboardType: TextInputType.number,
//                         decoration: customInputDecoration('days'),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               heigh10,

//               FloorDetails(),


//               heigh20,
//               const Text(
//                 'Add Working files details',
//                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//               ),
//               heigh10,
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'Planning',
//                     style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//                   ),
//                   SizedBox(
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.redAccent,
//                         shape: const StadiumBorder(),
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           planningGridCount += 1;
//                           planingFileNameControllerList
//                               .add(TextEditingController());
//                           planingFilePriceControllerList
//                               .add(TextEditingController());

//                           //getController.planingImageCountIncrease();
//                         });
//                       },
//                       child: Row(
//                         children: [
//                           Text('Add', style: normal14),
//                           width10,
//                           Icon(
//                             Icons.add,
//                             size: 20.sp,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               GetBuilder<uploadDesignTypeController>(builder: (context) {
//                 return SizedBox(
//                   child: GridView.builder(
//                       shrinkWrap: true,
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 3, childAspectRatio: 0.65.sp),
//                       physics: ScrollPhysics(),
//                       itemCount: planningGridCount,
//                       itemBuilder: (BuildContext context, int index) {
//                         return Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               children: [
//                                 GestureDetector(
//                                   onTap: () =>
//                                       getController.fetchPlanningImg(index),
//                                   child: customUploadButton(
//                                       getController.planningImgs[index]),
//                                 ),
//                                 heigh5,
//                                 SizedBox(
//                                   width: 115.sp,
//                                   height: 35.sp,
//                                   child: Center(
//                                     child: TextFormField(
//                                       controller:
//                                           planingFileNameControllerList[index],
//                                       validator: (value) {
//                                         if (value!.isEmpty) {
//                                           return 'Please enter File name';
//                                         }
//                                         return null;
//                                       },
//                                       decoration:
//                                           customInputDecoration('File name'),
//                                     ),
//                                   ),
//                                 ),
//                                 heigh5,
//                                 SizedBox(
//                                   width: 115.sp,
//                                   height: 35.sp,
//                                   child: Center(
//                                     child: TextFormField(
//                                       validator: (value) {
//                                         if (value!.isEmpty) {
//                                           return 'Please enter Estimated cost';
//                                         }
//                                         return null;
//                                       },
//                                       controller:
//                                           planingFilePriceControllerList[index],
//                                       decoration: customInputDecoration('₹0.0'),
//                                       keyboardType: TextInputType.number,
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ],
//                         );
//                       }),
//                 );
//               }),
//               heigh10,

//               GestureDetector(
//                 child: SizedBox(
//                   width: 60,
//                   height: 35,
//                   child: ElevatedButton(
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all<Color>(
//                           const Color.fromARGB(255, 255, 90, 95)),
//                     ),
//                     onPressed: () async {
//                       final form1 = formKey1.currentState;
//                       if (form1!.validate()) {
//                         List planingImageUrl = [];
//                         for (var element in getController.planingImageUrl) {
//                           if (element != null) {
//                             planingImageUrl.add(element);
//                           }
//                         }

//                         List planingFileNameList = [];
//                         planingFileNameControllerList.forEach((element) {
//                           planingFileNameList.add(element.text);
//                         });

//                         List planingFilePriceList = [];
//                         planingFilePriceControllerList.forEach((element) {
//                           planingFilePriceList.add(element.text);
//                         });

//                         var userdata = await FirebaseFirestore.instance
//                             .collection('ArchitectData')
//                             .doc(FirebaseAuth.instance.currentUser!.uid)
//                             .get();
//                         await getController.uploadDesignData(
//                             FirebaseAuth.instance.currentUser!.uid,
//                             projectDetailsController.text,
//                             getController.ExteriorImageUrl[0]!,
//                             getController.ExteriorImageUrl[1]!,
//                             getController.ExteriorImageUrl[2]!,
//                             getController.selectedDesignTypeindex == 0
//                                 ? 'Modern'
//                                 : getController.selectedDesignTypeindex == 1
//                                     ? 'Classic'
//                                     : 'Others',
//                             selectedHouseFacing == 0
//                                 ? 'East'
//                                 : selectedHouseFacing == 1
//                                     ? 'West'
//                                     : selectedHouseFacing == 2
//                                         ? 'South'
//                                         : 'North',
//                             selectedHouseFloor == 0
//                                 ? '1 FLoor'
//                                 : selectedHouseFloor == 1
//                                     ? '2 FLoor'
//                                     : 'Others',
//                             HouseType[getController.selectedHouseType],
//                             {
//                               'length': plotLengthController.text,
//                               'width': plotWidthController.text,
//                               'area': totalAreaController.text,
//                             },
//                             accordingVastuController.text,
//                             estimateCostControler.text,
//                             approximateCostController.text,
//                             getController.FloorImageUrl[0]!,
//                             getController.FloorImageUrl[1]!,
//                             getController.FloorImageUrl[2]!,
//                             designpriceController.text,
//                             shortDescriptionController.text,
//                             userdata['name'],
//                             planingImageUrl,
//                             planingFileNameList,
//                             planingFilePriceList,
//                             GetUploadController.createdlistofitems
//                         );
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => ArchitectMyDesign()),
//                         );
//                       }
//                     },
//                     child: const Text('Upload'),
//                   ),
//                 ),
//               ),
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
//       width: screenWidth / 3 - 10,
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

//   customUploadButton(image) {
//     return Container(
//       // padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
//       width: MediaQuery.of(context).size.width / 3.3,
//       height: 100.w,
//       decoration: BoxDecoration(
//         border: Border.all(width: 1, color: Colors.red),
//         borderRadius: const BorderRadius.all(Radius.circular(5)),
//       ),
//       child: image != null
//           ? Container(
//               decoration: BoxDecoration(
//                   borderRadius: const BorderRadius.all(Radius.circular(4)),
//                   image: DecorationImage(
//                     fit: BoxFit.cover,
//                     image: FileImage(
//                       File(image.path),
//                     ),
//                   )),
//             )
//           : Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.cloud_upload_outlined,
//                   color: Colors.grey,
//                   size: 40.sp,
//                 ),
//                 Text(
//                   'Upload your design',
//                   style: TextStyle(fontSize: 6.0.sp, color: Colors.grey),
//                 ),
//               ],
//             ),
//     );
//   }
// }






// class uploadDesign extends StatelessWidget {
//   // Uint8List uploadedImage;

//   uploadDesign({
//     // required this.uploadedImage,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100.w,
//       width: 100.w,
//       decoration: BoxDecoration(
//           border: Border.all(width: 1.w, color: kprimarycolor),
//           borderRadius: BorderRadius.circular(5.w)),
//       child:
//       // uploadedImage!= null
//       //     ? Container(
//       //         decoration: BoxDecoration(
//       //           image: DecorationImage(
//       //             image: MemoryImage(uploadedImage),
//       //           ),
//       //         ),
//       //       )
//       //     :
//       Padding(
//         padding: EdgeInsets.only(top: 50.0.w),
//         child: Column(
//           children: [
//             Icon(
//               Icons.upload_file_rounded,
//               color: kprimarycolor,
//               size: 40.sp,
//             ),
//             SizedBox(
//               height: 10.w,
//             ),
//             Text(
//               'Upload your design',
//               style: TextStyle(fontSize: 14.sp, color: kprimarycolor),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
