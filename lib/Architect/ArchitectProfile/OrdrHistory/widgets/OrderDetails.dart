import 'package:cached_network_image/cached_network_image.dart';
import 'package:dmh_architect/Constants/constants.dart';
import 'package:dmh_architect/model/orderDataModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetails extends StatelessWidget {
  List imageUrlList;
  OrderDataModel orderData;

  OrderDetails(
      {super.key,
      required this.screenWidth,
      required this.imageUrlList,
      required this.orderData});

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.w), color: kgreycolor),
        // height: 290.w,
        child: Column(
          children: [
            Container(
              // height: 250.w,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: imageUrlList[0],
                    imageBuilder: (context, imageProvider) => Container(
                      width: screenWidth - 10.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.w),
                            topRight: Radius.circular(10.w)),
                        // image: DecorationImage(
                        //     fit: BoxFit.cover, image: imageProvider),
                      ),
                      child: Image(
                        image: imageProvider,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),

                  // Container(
                  //   width: screenWidth - 10.w,
                  //   decoration: BoxDecoration(
                  //       color: kwhitecolor,
                  //       borderRadius: BorderRadius.only(
                  //           topLeft: Radius.circular(10.w),
                  //           topRight: Radius.circular(10.w)),
                  //       image: DecorationImage(
                  //           fit: BoxFit.cover,
                  //           image: NetworkImage(imageUrlList[0]))),
                  // ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0.w),
                                bottomRight: Radius.circular(10.w)),
                            color: const Color.fromARGB(255, 255, 214, 69)),
                        height: 22.w,
                        width: (screenWidth - 30) / 2.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${orderData.designType} ',
                              style:
                                  TextStyle(fontSize: 12.sp, color: kredcolor),
                            ),
                            // Text(
                            //   'Residential House',
                            //   overflow: TextOverflow.ellipsis,
                            //   style:
                            //       TextStyle(fontSize: 12.sp, color: kbluecolor),
                            // )
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              height: 40.w,
              decoration: BoxDecoration(
                color: kwhitecolor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(2.w),
                    bottomRight: Radius.circular(2.w)),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                      spreadRadius: .1,
                      blurStyle: BlurStyle.normal,
                      color: Color.fromARGB(137, 82, 82, 82),
                      blurRadius: 10.0,
                      offset: Offset(0.0, 0.0))
                ],
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                            '${orderData.houseArea['length']} ft. x ${orderData.houseArea['width']} ft. = ${orderData.houseArea['area']} Sqft.',
                            style: TextStyle(fontSize: 13.sp)),
                        Spacer(),
                        Text(' ${orderData.houseFacing} Facing House',
                            style: TextStyle(fontSize: 13.sp))
                      ],
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
