import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Constants/constants.dart';
import '../controller/ordercontroller.dart';

class ChooseArchitect extends StatelessWidget {
  ChooseArchitect({super.key});

  final getXcontroller = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: Padding(
                padding:  EdgeInsets.only(left: 10.0.w,top: 10.w),
                child: Container(
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
            ),
            Padding(
              padding: EdgeInsets.all(10.0.w),
              child: Text(
                'Select Your Designer / Architect',
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: kprimarycolor),
              ),
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Radio(
                        fillColor: MaterialStateProperty.all(kprimarycolor),
                        value: true,
                        groupValue: true,
                        onChanged: (value) {},
                      ),
                      Column(
                        children: [
                          Container(
                            width: 310.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.w)),
                              color: kprimarycolor.withOpacity(0.3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          child: Text(
                                        ' Architect - 00${index + 1}',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                            color: kprimarycolor),
                                      )),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            size: 12.sp,
                                            color: kbluecolor.withOpacity(0.8),
                                          ),
                                          Text(
                                            ' Koramangala, Banglore',
                                            style: normal10,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Text(
                                    'Rs. 5000',
                                    style: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.bold,
                                        color: kbluecolor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GetBuilder<OrderController>(builder: (getsdata) {
                            return Column(
                              children: [
                                Container(
                                  width: 310.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft:
                                            getXcontroller.workingdetailsbool[
                                                        index] ==
                                                    false
                                                ? Radius.circular(10.w)
                                                : Radius.circular(0.w),
                                        bottomRight:
                                            getXcontroller.workingdetailsbool[
                                                        index] ==
                                                    false
                                                ? Radius.circular(10.w)
                                                : Radius.circular(0.w)),
                                    color: kprimarycolor.withOpacity(0.1),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.0.w, vertical: 5.w),
                                    child: Column(children: [
                                      Text(
                                        'Visit Your Site @ Rs 50/Km or Min. Rs 500 per Visit',
                                        style: normal10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () => getXcontroller
                                                .seeWorkingDetails(index),
                                            child: Text(
                                              'See Review',
                                              style: TextStyle(
                                                  fontWeight: getXcontroller
                                                                  .seereviewsbool[
                                                              index] ==
                                                          true
                                                      ? FontWeight.bold
                                                      : FontWeight.normal,
                                                  fontSize: 12.sp,
                                                  color: kprimarycolor),
                                            ),
                                          ),
                                          // Text(
                                          //   'See Work Hystory',
                                          //   style: TextStyle(
                                          //       fontSize: 12.sp,
                                          //       color: kprimarycolor),
                                          // ),
                                          GestureDetector(
                                            onTap: () => getXcontroller
                                                .seeWorkingDetails(index),
                                            child: Icon(
                                              getXcontroller.workingdetailsbool[
                                                          index] ==
                                                      false
                                                  ? Icons.arrow_drop_down
                                                  : Icons.arrow_drop_up,
                                              color: kprimarycolor,
                                              size: 25.sp,
                                            ),
                                          )
                                        ],
                                      )
                                    ]),
                                  ),
                                ),
                                getXcontroller.seereviewsbool[index] == true
                                    ? Container(
                                        // height: 50.w,
                                        width: 310.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10.w),
                                              bottomRight:
                                                  Radius.circular(10.w)),
                                          color: kprimarycolor.withOpacity(0.1),
                                        ),
                                        child: ListView.separated(
                                            shrinkWrap: true,
                                            physics: ScrollPhysics(),
                                            padding: EdgeInsets.only(
                                                left: 10.w, bottom: 10.w),
                                            itemBuilder: (context, index) {
                                              return Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 25.w,
                                                    width: 25.w,
                                                    decoration: BoxDecoration(
                                                      color: kgreycolor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.w),
                                                    ),
                                                  ),
                                                  width10,
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        top: 3.w, left: 5.w),
                                                    height: 50.w,
                                                    width: 230.w,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(
                                                                      10.w),
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      10.w)),
                                                      color: kprimarycolor
                                                          .withOpacity(0.3),
                                                    ),
                                                    child: Text(
                                                      'Cameron Willianson',
                                                      style: bold12,
                                                    ),
                                                  )
                                                ],
                                              );
                                            },
                                            separatorBuilder: (context, index) {
                                              return SizedBox(
                                                height: 10.w,
                                              );
                                            },
                                            itemCount: 3),
                                      )
                                    : SizedBox()
                                // : Container(
                                //     // height: 50.w,
                                //     width: 310.w,
                                //     decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.only(
                                //           bottomLeft: Radius.circular(10.w),
                                //           bottomRight: Radius.circular(10.w)),
                                //       color: kprimarycolor.withOpacity(0.1),
                                //     ),
                                //     child: ListView.separated(
                                //         shrinkWrap: true,
                                //         physics: ScrollPhysics(),
                                //         padding: EdgeInsets.only(
                                //             left: 10.w, bottom: 10.w),
                                //         itemBuilder: (context, index) {
                                //           return Column(
                                //             children: [Text('Work History')],
                                //           );
                                //         },
                                //         separatorBuilder: (context, index) {
                                //           return SizedBox(
                                //             height: 10.w,
                                //           );
                                //         },
                                //         itemCount: 3),
                                //   ),
                              ],
                            );
                          }),
                        ],
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 20.w,
                  );
                },
                itemCount: 4),
            SizedBox(
              height: 80.w,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        alignment: Alignment.center,
        width: (MediaQuery.of(context).size.width) / 1.1,
        height: 50.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.w)),
            color: kprimarycolor),
        child: Text(
          'Proceed to buy',
          style: TextStyle(fontSize: 17.sp, color: kwhitecolor),
        ),
      ),
    );
  }
}
