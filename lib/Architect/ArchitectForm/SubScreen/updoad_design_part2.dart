import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../Constants/constants.dart';
import '../../../../controller/uploadDesignController.dart';

class UploadDesignPartTwo extends StatelessWidget {
  UploadDesignPartTwo({Key? key}) : super(key: key);

  final getController = Get.put(uploadDesignTypeController());

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Design Type',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        heigh10,
        GetBuilder<uploadDesignTypeController>(builder: (getdata) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => getdata.changeoption(0),
                child: customTail(
                    screenWidth,
                    'Modern',
                    getController.selectedDesignTypeindex == 0
                        ? kprimarycolor
                        : kwhitecolor,
                    getController.selectedDesignTypeindex == 0
                        ? kwhitecolor
                        : kblackcolor),
              ),
              GestureDetector(
                onTap: () => getdata.changeoption(1),
                child: customTail(
                    screenWidth,
                    'Classic',
                    getController.selectedDesignTypeindex == 1
                        ? kprimarycolor
                        : kwhitecolor,
                    getController.selectedDesignTypeindex == 1
                        ? kwhitecolor
                        : kblackcolor),
              ),
              GestureDetector(
                onTap: () => getdata.changeoption(2),
                child: customTail(
                    screenWidth,
                    'Others',
                    getController.selectedDesignTypeindex == 2
                        ? kprimarycolor
                        : kwhitecolor,
                    getController.selectedDesignTypeindex == 2
                        ? kwhitecolor
                        : kblackcolor),
              ),
            ],
          );
        }),
        heigh10,
        const Text(
          'House Type',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        heigh10,
        GetBuilder<uploadDesignTypeController>(builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => getController.changeHouseType(0),
                    child: customTail(
                        screenWidth,
                        'Simplex',
                        getController.selectedHouseType == 0
                            ? kprimarycolor
                            : kwhitecolor,
                        getController.selectedHouseType == 0
                            ? kwhitecolor
                            : kblackcolor),
                  ),
                  GestureDetector(
                    onTap: () => getController.changeHouseType(1),
                    child: customTail(
                        screenWidth,
                        'Duplex',
                        getController.selectedHouseType == 1
                            ? kprimarycolor
                            : kwhitecolor,
                        getController.selectedHouseType == 1
                            ? kwhitecolor
                            : kblackcolor),
                  ),
                  GestureDetector(
                    onTap: () => getController.changeHouseType(2),
                    child: customTail(
                        screenWidth,
                        'Triplex',
                        getController.selectedHouseType == 2
                            ? kprimarycolor
                            : kwhitecolor,
                        getController.selectedHouseType == 2
                            ? kwhitecolor
                            : kblackcolor),
                  ),
                ],
              ),
              heigh10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => getController.changeHouseType(3),
                    child: customTail(
                        screenWidth,
                        'Bungalow',
                        getController.selectedHouseType == 3
                            ? kprimarycolor
                            : kwhitecolor,
                        getController.selectedHouseType == 3
                            ? kwhitecolor
                            : kblackcolor),
                  ),
                  GestureDetector(
                    onTap: () => getController.changeHouseType(4),
                    child: customTail(
                        screenWidth,
                        'Lodge/Hotel',
                        getController.selectedHouseType == 4
                            ? kprimarycolor
                            : kwhitecolor,
                        getController.selectedHouseType == 4
                            ? kwhitecolor
                            : kblackcolor),
                  ),
                  GestureDetector(
                    onTap: () => getController.changeHouseType(5),
                    child: customTail(
                        screenWidth,
                        'Apartment',
                        getController.selectedHouseType == 5
                            ? kprimarycolor
                            : kwhitecolor,
                        getController.selectedHouseType == 5
                            ? kwhitecolor
                            : kblackcolor),
                  ),
                ],
              ),
              heigh10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => getController.changeHouseType(6),
                    child: customTail(
                        screenWidth,
                        'Shoping/Mall',
                        getController.selectedHouseType == 6
                            ? kprimarycolor
                            : kwhitecolor,
                        getController.selectedHouseType == 6
                            ? kwhitecolor
                            : kblackcolor),
                  ),
                  GestureDetector(
                    onTap: () => getController.changeHouseType(7),
                    child: customTail(
                        screenWidth,
                        'School/College',
                        getController.selectedHouseType == 7
                            ? kprimarycolor
                            : kwhitecolor,
                        getController.selectedHouseType == 7
                            ? kwhitecolor
                            : kblackcolor),
                  ),
                  GestureDetector(
                    onTap: () => getController.changeHouseType(8),
                    child: customTail(
                        screenWidth,
                        'Hospital',
                        getController.selectedHouseType == 8
                            ? kprimarycolor
                            : kwhitecolor,
                        getController.selectedHouseType == 8
                            ? kwhitecolor
                            : kblackcolor),
                  ),
                ],
              ),
              heigh10,
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                GestureDetector(
                  onTap: () => getController.changeHouseType(9),
                  child: customTail(
                      screenWidth,
                      'Hotel',
                      getController.selectedHouseType == 9
                          ? kprimarycolor
                          : kwhitecolor,
                      getController.selectedHouseType == 9
                          ? kwhitecolor
                          : kblackcolor),
                ),
                GestureDetector(
                  onTap: () => getController.changeHouseType(10),
                  child: customTail(
                      screenWidth,
                      'Restarent',
                      getController.selectedHouseType == 10
                          ? kprimarycolor
                          : kwhitecolor,
                      getController.selectedHouseType == 10
                          ? kwhitecolor
                          : kblackcolor),
                ),
                GestureDetector(
                  onTap: () => getController.changeHouseType(11),
                  child: customTail(
                      screenWidth,
                      'Banquet/Hall',
                      getController.selectedHouseType == 11
                          ? kprimarycolor
                          : kwhitecolor,
                      getController.selectedHouseType == 11
                          ? kwhitecolor
                          : kblackcolor),
                ),
              ]),
            ],
          );
        }),
      ],
    );
  }

  customTail(screenWidth, text, color, textcolor) {
    return Container(
      alignment: Alignment.center,
      width: screenWidth / 3 - 10,
      height: 30.w,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(width: 1.sp, color: Colors.red),
        borderRadius: const BorderRadius.all(Radius.circular(50)),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 14.sp, color: textcolor),
        ),
      ),
    );
  }
}
