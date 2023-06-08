// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// import '../../../../Constants/constants.dart';
// import '../../../../controller/upload design/ArchitectAddDesignController.dart';
// import '../../SubScreen/plotareadetails.dart';

// class ArchitecHousefloorsAndHousearea extends StatelessWidget {
//   TextEditingController houseAreaLengthController;
//   TextEditingController houseAreawidthController;
//   TextEditingController houseTotalAreaController;
//   ArchitecHousefloorsAndHousearea({
//     required this.houseAreaLengthController,
//     required this.houseAreawidthController,
//     required this.houseTotalAreaController,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         GetBuilder<ArchitectAddDesignController>(builder: (getData) {
//           return Container(
//             padding: EdgeInsets.all(10.w),
//             // height: 100.w,
//             width: 600.w,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5.w),
//                 border: Border.all(width: 1.w, color: kgreycolor)),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'House Floors',
//                   style:
//                       TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(
//                   height: 10.w,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Checkbox(
//                           value: getData.selectedHouseFloorsCheckbox == 0
//                               ? true
//                               : false,
//                           onChanged: (value) {
//                             getData.HouseFloorsCheckbox(0);
//                           },
//                         ),
//                         Text('1 Floor', style: TextStyle(fontSize: 16.sp))
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Checkbox(
//                           value: getData.selectedHouseFloorsCheckbox == 1
//                               ? true
//                               : false,
//                           onChanged: (value) {
//                             getData.HouseFloorsCheckbox(1);
//                           },
//                         ),
//                         Text('2 Floor', style: TextStyle(fontSize: 16.sp))
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Checkbox(
//                           value: getData.selectedHouseFloorsCheckbox == 2
//                               ? true
//                               : false,
//                           onChanged: (value) {
//                             getData.HouseFloorsCheckbox(2);
//                           },
//                         ),
//                         Text('Others',
//                             style: TextStyle(fontSize: 16.sp))
//                       ],
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           );
//         }),
//         heigh10,
//         PlotAreaDetails(
//             plotLengthController: houseAreaLengthController,
//             plotWidthController: houseAreawidthController,
//             totalAreaController: houseTotalAreaController
//             ),
//       ],
//     );
//   }

//   InputDecoration addDesigntextfieldDecoration() {
//     return InputDecoration(
//         contentPadding: EdgeInsets.only(left: 10.w),
//         border: OutlineInputBorder(
//             borderSide: BorderSide(width: 1.w, color: kprimarycolor)));
//   }
// }
