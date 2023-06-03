import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../Constants/constants.dart';
import '../../../../controller/upload design/ArchitectAddDesignController.dart';

class ArchitectHouseType extends StatelessWidget {
  ArchitectHouseType({
    super.key,
  });
  final getcontroller = Get.put(ArchitectAddDesignController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      // height: 100.w,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.w),
          border: Border.all(width: 1.w, color: kgreycolor)),
      child: GetBuilder<ArchitectAddDesignController>(builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'House Type',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            heigh10,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => getcontroller.addDesignHouseTYpe(0),
                  child: housetypebutton(
                    backroundcolor: context.selectedHouseType == 0
                        ? kprimarycolor
                        : kwhitecolor,
                    textcolor: context.selectedHouseType == 0
                        ? kwhitecolor
                        : kblackcolor,
                    title: 'Simplex',
                  ),
                ),
                SizedBox(width: 10.w,),
                GestureDetector(
                  onTap: () => getcontroller.addDesignHouseTYpe(1),
                  child: housetypebutton(
                    backroundcolor: context.selectedHouseType == 1
                        ? kprimarycolor
                        : kwhitecolor,
                    textcolor: context.selectedHouseType == 1
                        ? kwhitecolor
                        : kblackcolor,
                    title: 'Duplex',
                  ),
                ),
                SizedBox(width: 10.w,),
                GestureDetector(
                  onTap: () => getcontroller.addDesignHouseTYpe(2),
                  child: housetypebutton(
                    backroundcolor: context.selectedHouseType == 2
                        ? kprimarycolor
                        : kwhitecolor,
                    textcolor: context.selectedHouseType == 2
                        ? kwhitecolor
                        : kblackcolor,
                    title: 'Triplex',
                  ),
                ),

              ],
            ),
            heigh20,
            Row(
              mainAxisAlignment:  MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => getcontroller.addDesignHouseTYpe(4),
                  child: housetypebutton(
                    backroundcolor: context.selectedHouseType == 4
                        ? kprimarycolor
                        : kwhitecolor,
                    textcolor: context.selectedHouseType == 4
                        ? kwhitecolor
                        : kblackcolor,
                    title: 'Hotel',
                  ),
                ),
                SizedBox(width: 10.w,),
                GestureDetector(
                  onTap: () => getcontroller.addDesignHouseTYpe(5),
                  child: housetypebutton(
                    backroundcolor: context.selectedHouseType == 5
                        ? kprimarycolor
                        : kwhitecolor,
                    textcolor: context.selectedHouseType == 5
                        ? kwhitecolor
                        : kblackcolor,
                    title: 'Restaurant',
                  ),
                ),
                SizedBox(width: 10.w,),
                GestureDetector(
                  onTap: () => getcontroller.addDesignHouseTYpe(6),
                  child: housetypebutton(
                    backroundcolor: context.selectedHouseType == 6
                        ? kprimarycolor
                        : kwhitecolor,
                    textcolor: context.selectedHouseType == 6
                        ? kwhitecolor
                        : kblackcolor,
                    title: 'Botique',
                  ),
                ),

              ],
            ),
            heigh20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 20.w,),
                GestureDetector(
                  onTap: () => getcontroller.addDesignHouseTYpe(3),
                  child: housetypebutton(
                    backroundcolor: context.selectedHouseType == 3
                        ? kprimarycolor
                        : kwhitecolor,
                    textcolor: context.selectedHouseType == 3
                        ? kwhitecolor
                        : kblackcolor,
                    title: 'Appartment',
                  ),
                ),
                SizedBox(width: 20.w,),
                GestureDetector(
                  onTap: () => getcontroller.addDesignHouseTYpe(7),
                  child: housetypebutton(
                    backroundcolor: context.selectedHouseType == 7
                        ? kprimarycolor
                        : kwhitecolor,
                    textcolor: context.selectedHouseType == 7
                        ? kwhitecolor
                        : kblackcolor,
                    title: 'Shoping Mall',
                  ),
                )
              ],
            )
          ],
        );
      }),
    );
  }
}



class housetypebutton extends StatelessWidget {
  String title;
  Color textcolor;
  Color backroundcolor;

  housetypebutton({
    required this.title,
    required this.textcolor,
    required this.backroundcolor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.w,
      width: 100.w,
      decoration: BoxDecoration(
          color: backroundcolor,
          borderRadius: BorderRadius.circular(5.w),
          border: Border.all(color: kprimarycolor, width: 1.w)),
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 14.sp, color: textcolor),
        ),
      ),
    );
  }
}
