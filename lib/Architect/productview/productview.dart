import 'package:dmh_architect/Architect/productview/widget/productcorouselslider.dart';
import 'package:dmh_architect/Architect/productview/widget/projectdescription.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Constants/constants.dart';
import '../../model/uploadDesignDataModel.dart';

class ProductView extends StatefulWidget {
  final designDataModel DesignData;
  ProductView({super.key, required this.DesignData});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    // final screenwidth = MediaQuery.of(context).size.width;
    // final screenheight = MediaQuery.of(context).size.height;
    // final getcontroller = Get.put(CartController());
    // final getpaymentcontroller = Get.put(PaymentController());

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Column(
                    children: [
                      heigh10,
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: SizedBox(
                          child: Row(children: [
                            Icon(
                              Icons.arrow_back,
                              size: 20.sp,
                            ),
                            Text(
                              'Back',
                              style: normal16,
                            )
                          ]),
                        ),
                      ),
                      heigh10,
                      Row(
                        children: [
                          Text(
                            widget.DesignData.houseType,
                            style: TextStyle(
                                fontSize: 14.sp, color: kprimarycolor),
                          ),
                          Text(
                            '/ ${widget.DesignData.designType}',
                            style:
                                TextStyle(fontSize: 14.sp, color: kblackcolor),
                          ),
                        ],
                      ),
                      heigh10,
                      Text(
                        '${widget.DesignData.projectDetails}',
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                heigh10,
                ProductCarouselslider(DesignData: widget.DesignData),
                heigh10,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Column(
                    children: [
                      // Row(
                      //   children: [
                      //     GestureDetector(
                      //       onTap: () => Get.to(() => GetDesign(
                      //             DesignData: widget.DesignData,
                      //           )),
                      //       child: Container(
                      //         alignment: Alignment.center,
                      //         width: (screenwidth - 40.w) / 2,
                      //         height: 30.w,
                      //         decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(5.w),
                      //             color: kprimarycolor),
                      //         child: Text(
                      //           'Get working Drawings',
                      //           style: TextStyle(
                      //               fontSize: 14.sp, color: kwhitecolor),
                      //         ),
                      //       ),
                      //     ),
                      //     width10,
                      //     GestureDetector(
                      //       onTap: () => Get.to(() => DesignThisTypeOfHouse()),
                      //       child: Container(
                      //         alignment: Alignment.center,
                      //         width: (screenwidth - 30) / 2,
                      //         height: 30.w,
                      //         decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(5.w),
                      //             color: kprimarycolor),
                      //         child: Text(
                      //           'Design this type house',
                      //           style: TextStyle(
                      //               fontSize: 14.sp, color: kwhitecolor),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // heigh10,
                      ProjectDescription(DesignData: widget.DesignData),
                      // Row(
                      //   children: [
                      //     Container(
                      //       alignment: Alignment.center,
                      //       width: (screenwidth - 30) / 2,
                      //       height: 30.w,
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(5.w),
                      //           color: kprimarycolor),
                      //       child: Text(
                      //         'Get working Drawings',
                      //         style: TextStyle(
                      //             fontSize: 14.sp, color: kwhitecolor),
                      //       ),
                      //     ),
                      //     width10,
                      //     Container(
                      //       alignment: Alignment.center,
                      //       width: (screenwidth - 30) / 2,
                      //       height: 30.w,
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(5.w),
                      //           color: kprimarycolor),
                      //       child: Text(
                      //         'Design this type house',
                      //         style: TextStyle(
                      //             fontSize: 14.sp, color: kwhitecolor),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: 80.w,
                      )
                    ],
                  ),
                )
              ],
            ),
            // Positioned(
            //   top: screenheight - 100.w,
            //   child: Container(
            //     decoration: const BoxDecoration(
            //       boxShadow: <BoxShadow>[
            //         BoxShadow(
            //             spreadRadius: .5,
            //             blurStyle: BlurStyle.normal,
            //             color: Color.fromARGB(137, 184, 184, 184),
            //             blurRadius: 10.0,
            //             offset: Offset(0.0, 0.0))
            //       ],
            //     ),
            //     child: Row(
            //       children: [
                   
            //         GestureDetector(
            //           onTap: () async {},
            //           child: Container(
            //             alignment: Alignment.center,
            //             width: (screenwidth - 20.w),
            //             height: 60.w,
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.horizontal(
            //                     right: Radius.circular(10.w)),
            //                 color: kprimarycolor),
            //             child: Text(
            //               'Next',
            //               style: TextStyle(fontSize: 17.sp, color: kwhitecolor),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
