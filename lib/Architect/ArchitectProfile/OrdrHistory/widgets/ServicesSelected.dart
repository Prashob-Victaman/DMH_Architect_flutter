import 'package:dmh_architect/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ServicesSelected extends StatelessWidget {
  List serviceTitle;
  List aboutService;
  List selectedServices;

  ServicesSelected({
    required this.serviceTitle,
    required this.aboutService,
    required this.selectedServices,
    super.key,
  });
  // final List selectedServices = [
  //   true,
  //   true,
  //   true,
  //   false,
  //   true,
  //   false,
  //   false,
  //   true,
  //   true
  // ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
      child: GridView.count(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        childAspectRatio: 1.25,
        crossAxisCount: 3,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.w,
        children: List.generate(9, (index) {
          return GestureDetector(
            child: Container(
              // padding: EdgeInsets.all(3.w),
              height: 75.w,
              // width: 115.w,
              decoration: BoxDecoration(
                color: kashcolor,
                borderRadius: BorderRadius.circular(5.w),
              ),
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
                            style: selectedServices[index] == true
                                ? bold15
                                : TextStyle(
                                    fontSize: 15,
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

                  selectedServices[index] == true
                      ? Text(
                          'Completed',
                          style: TextStyle(
                              color: ksuccesscolor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold),
                        )
                      : Text(
                          'Not Selected',
                          style: TextStyle(
                              color: kredcolor.withOpacity(0.3),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold),
                        ),
                  // Spacer(),H
                  heigh5,
                  Container(
                    height: 20,
                    decoration: BoxDecoration(
                      color: selectedServices[index] == true
                          ? kprimarycolor
                          : kprimarycolor50,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(5.w)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Download',
                          style: TextStyle(fontSize: 14.sp, color: kwhitecolor),
                        ),
                        Icon(
                          Icons.download,
                          size: 18.w,
                          color: kwhitecolor,
                        ),
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
