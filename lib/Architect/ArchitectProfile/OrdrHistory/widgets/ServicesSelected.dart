import 'package:dmh_architect/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ServicesSelected extends StatelessWidget {
  List serviceTitle;
  List aboutService;
  List selectedServicesList;

  ServicesSelected({
    required this.serviceTitle,
    required this.aboutService,
    required this.selectedServicesList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
      child: GridView.count(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        childAspectRatio: 1.45.w,
        crossAxisCount: 3,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.w,
        children: List.generate(9, (index) {
          return GestureDetector(
            child: Container(
              // padding: EdgeInsets.all(3.w),
              height: 55.w,
              // width: 115.w,
              decoration: BoxDecoration(
                  color: kashcolor,
                  borderRadius: BorderRadius.circular(5.w),
                  border: Border.all(width: 0.3.w)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(4.0.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 80.w,
                          child: Text(
                            serviceTitle[index],
                            maxLines: 2,
                            style: selectedServicesList[index]['isSelected'] ==
                                    true
                                ? bold15
                                : TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: kgreycolor.withOpacity(0.6)),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        width5,
                        Column(
                          children: [
                            // Icon(
                            //   Icons.check_box,
                            //   color: kprimarycolor,
                            //   size: 18.sp,
                            // ),
                            heigh5,
                            GestureDetector(
                              onTap: () => showDialog(
                                useSafeArea: true,
                                barrierDismissible: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return Center(
                                    child: Container(
                                        height: 280.w,
                                        width: 300.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.0.w,
                                              vertical: 20.w),
                                          child: Center(
                                            child: Column(
                                              // mainAxisAlignment:
                                              //     MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                // Spacer(),
                                                GestureDetector(
                                                    onTap: () => Get.back(),
                                                    child: Icon(
                                                      Icons.close,
                                                      size: 20.sp,
                                                    )),
                                                heigh10,
                                                SizedBox(
                                                  width: 250.w,
                                                  child: Text(
                                                    aboutService[index],
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                  );
                                },
                              ),
                              child: Icon(
                                Icons.info,
                                color: kprimarycolor,
                                size: 18.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(),

                  // selectedServices[index] == true
                  //     ? Text(
                  //         'Completed',
                  //         style: TextStyle(
                  //             color: ksuccesscolor,
                  //             fontSize: 16.sp,
                  //             fontWeight: FontWeight.bold),
                  //       )
                  //     : Text(
                  //         'Not Selected',
                  //         style: TextStyle(
                  //             color: kredcolor.withOpacity(0.3),
                  //             fontSize: 16.sp,
                  //             fontWeight: FontWeight.bold),
                  //       ),
                  // // Spacer(),H
                  heigh5,
                  Container(
                    height: 25,
                    decoration: BoxDecoration(
                      color: selectedServicesList[index]['isSelected'] == true
                          ? kwhitecolor
                          : kwhitecolor,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(5.w)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        selectedServicesList[index]['isSelected'] == false
                            ? Text(
                                'Not Selected',
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                    color: kgreycolor),
                              )
                            : selectedServicesList[index]['isRejected'] == true
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Rejected',
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.bold,
                                            color: kredcolor),
                                      ),
                                      width5,
                                      Icon(
                                        Icons.error,
                                        color: kredcolor,
                                        size: 20.w,
                                      )
                                    ],
                                  )
                                : selectedServicesList[index]['isCompleted'] ==
                                        true
                                    ? Text('Completed',
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.bold,
                                            color: ksuccesscolor))
                                    : selectedServicesList[index]['isPaid'] ==
                                            true
                                        ? Text(
                                            'Processing',
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.orange),
                                          )
                                        : selectedServicesList[index]
                                                    ['isAproved'] ==
                                                true
                                            ? Text(
                                                'Not paid',
                                                style: TextStyle(
                                                    fontSize: 13.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: kyellowcolor),
                                              )
                                            : selectedServicesList[index]
                                                        ['isAproved'] ==
                                                    false
                                                ? Text(
                                                    'Not Accepted',
                                                    style: TextStyle(
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: kyellowcolor),
                                                  )
                                                : SizedBox(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  
}
