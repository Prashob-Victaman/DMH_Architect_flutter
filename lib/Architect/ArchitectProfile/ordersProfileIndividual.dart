// import 'package:dmh_architect/Architect/ArchitectProfile/widgets/orderProjectDescription.dart';
// import 'package:dmh_architect/Architect/productview/widget/productcorouselslider.dart';
// import 'package:dmh_architect/Constants/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class ordersProfileIndividual extends StatelessWidget {
//   const ordersProfileIndividual({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             ListView(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 10.0.w),
//                   child: Column(
//                     children: [
//                       heigh10,
//                       GestureDetector(
//                         onTap: () => Get.back(),
//                         child: SizedBox(
//                           child: Row(children: [
//                             Icon(
//                               Icons.arrow_back,
//                               size: 20.sp,
//                             ),
//                             Text(
//                               'Back',
//                               style: normal16,
//                             )
//                           ]),
//                         ),
//                       ),
//                       heigh10,
//                       Row(
//                         children: [
//                           Text(
//                             DesignData.houseType,
//                             style: TextStyle(
//                                 fontSize: 14.sp, color: kprimarycolor),
//                           ),
//                           Text(
//                             '/ ${DesignData.designType}',
//                             style:
//                                 TextStyle(fontSize: 14.sp, color: kblackcolor),
//                           ),
//                         ],
//                       ),
//                       heigh10,
//                       Text(
//                         '${DesignData.projectDetails}',
//                         style: TextStyle(
//                           fontSize: 14.sp,
//                         ),
//                         textAlign: TextAlign.justify,
//                       ),
//                     ],
//                   ),
//                 ),
//                 heigh10,
//                 ProductCarouselslider(DesignData: DesignData),
//                 heigh10,
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 10.0.w),
//                   child: Column(
//                     children: [
                   
//                       orderProjectDescription(DesignData: DesignData),
                     
//                       SizedBox(
//                         height: 80.w,
                        
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
            
//           ],
//         ),
//       ),
//     );
//   }
// }


