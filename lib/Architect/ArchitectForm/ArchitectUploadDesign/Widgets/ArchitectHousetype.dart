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
      child: GetBuilder<ArchitectAddDesignController>(builder: (getadata) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'House Type',
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
            ),
            heigh10,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => getcontroller.addDesignHouseTYpe(0),
                  child: housetypebutton(
                    backroundcolor: getadata.selectedHouseType == 0
                        ? kprimarycolor
                        : kwhitecolor,
                    textcolor: getadata.selectedHouseType == 0
                        ? kwhitecolor
                        : kblackcolor,
                    title: housedesignname[0],
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                GestureDetector(
                  onTap: () => getcontroller.addDesignHouseTYpe(1),
                  child: housetypebutton(
                    backroundcolor: getadata.selectedHouseType == 1
                        ? kprimarycolor
                        : kwhitecolor,
                    textcolor: getadata.selectedHouseType == 1
                        ? kwhitecolor
                        : kblackcolor,
                    title: housedesignname[1],
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                GestureDetector(
                  onTap: () => getcontroller.addDesignHouseTYpe(2),
                  child: housetypebutton(
                    backroundcolor: getadata.selectedHouseType == 2
                        ? kprimarycolor
                        : kwhitecolor,
                    textcolor: getadata.selectedHouseType == 2
                        ? kwhitecolor
                        : kblackcolor,
                    title: housedesignname[2],
                  ),
                ),
              ],
            ),
            heigh10,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => getcontroller.addDesignHouseTYpe(3),
                  child: housetypebutton(
                    backroundcolor: getadata.selectedHouseType == 3
                        ? kprimarycolor
                        : kwhitecolor,
                    textcolor: getadata.selectedHouseType == 3
                        ? kwhitecolor
                        : kblackcolor,
                    title: housedesignname[3],
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                GestureDetector(
                  onTap: () => getcontroller.addDesignHouseTYpe(4),
                  child: housetypebutton(
                    backroundcolor: getadata.selectedHouseType == 4
                        ? kprimarycolor
                        : kwhitecolor,
                    textcolor: getadata.selectedHouseType == 4
                        ? kwhitecolor
                        : kblackcolor,
                    title: housedesignname[4],
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                GestureDetector(
                  onTap: () => getcontroller.addDesignHouseTYpe(5),
                  child: housetypebutton(
                    backroundcolor: getadata.selectedHouseType == 5
                        ? kprimarycolor
                        : kwhitecolor,
                    textcolor: getadata.selectedHouseType == 5
                        ? kwhitecolor
                        : kblackcolor,
                    title: housedesignname[5],
                  ),
                ),
              ],
            ),
                        heigh10,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => getcontroller.addDesignHouseTYpe(6),
                  child: housetypebutton(
                    backroundcolor: getadata.selectedHouseType == 6
                        ? kprimarycolor
                        : kwhitecolor,
                    textcolor: getadata.selectedHouseType == 6
                        ? kwhitecolor
                        : kblackcolor,
                    title: housedesignname[6],
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                GestureDetector(
                  onTap: () => getcontroller.addDesignHouseTYpe(7),
                  child: housetypebutton(
                    backroundcolor: getadata.selectedHouseType == 7
                        ? kprimarycolor
                        : kwhitecolor,
                    textcolor: getadata.selectedHouseType == 7
                        ? kwhitecolor
                        : kblackcolor,
                    title: housedesignname[7],
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                GestureDetector(
                  onTap: () => getcontroller.addDesignHouseTYpe(8),
                  child: housetypebutton(
                    backroundcolor: getadata.selectedHouseType == 8
                        ? kprimarycolor
                        : kwhitecolor,
                    textcolor: getadata.selectedHouseType == 8
                        ? kwhitecolor
                        : kblackcolor,
                    title: housedesignname[8],
                  ),
                )
              ],
            ),
            heigh10,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => getcontroller.addDesignHouseTYpe(9),
                  child: housetypebutton(
                    backroundcolor: getadata.selectedHouseType == 9
                        ? kprimarycolor
                        : kwhitecolor,
                    textcolor: getadata.selectedHouseType == 9
                        ? kwhitecolor
                        : kblackcolor,
                    title: housedesignname[9],
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                GestureDetector(
                  onTap: () => getcontroller.addDesignHouseTYpe(10),
                  child: housetypebutton(
                    backroundcolor: getadata.selectedHouseType == 10
                        ? kprimarycolor
                        : kwhitecolor,
                    textcolor: getadata.selectedHouseType == 10
                        ? kwhitecolor
                        : kblackcolor,
                    title: housedesignname[10],
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                GestureDetector(
                  onTap: () => getcontroller.addDesignHouseTYpe(11),
                  child: housetypebutton(
                    backroundcolor: getadata.selectedHouseType == 11
                        ? kprimarycolor
                        : kwhitecolor,
                    textcolor: getadata.selectedHouseType == 11
                        ? kwhitecolor
                        : kblackcolor,
                    title: housedesignname[11],
                  ),
                )
              ],
            ),
            heigh10,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20.w,
                ),
                GestureDetector(
                  onTap: () => getcontroller.addDesignHouseTYpe(12),
                  child: housetypebutton(
                    backroundcolor: getadata.selectedHouseType == 12
                        ? kprimarycolor
                        : kwhitecolor,
                    textcolor: getadata.selectedHouseType == 12
                        ? kwhitecolor
                        : kblackcolor,
                    title: housedesignname[12],
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                GestureDetector(
                  onTap: () => getcontroller.addDesignHouseTYpe(13),
                  child: housetypebutton(
                    backroundcolor: getadata.selectedHouseType == 13
                        ? kprimarycolor
                        : kwhitecolor,
                    textcolor: getadata.selectedHouseType == 13
                        ? kwhitecolor
                        : kblackcolor,
                    title: housedesignname[13],
                  ),
                ),
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
          style: TextStyle(fontSize: 12.sp, color: textcolor),
        ),
      ),
    );
  }
}
