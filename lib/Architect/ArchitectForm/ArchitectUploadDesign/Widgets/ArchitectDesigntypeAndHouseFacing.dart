// import 'package:design_my_house_admin/Controller/NavigationController/addDesignController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../Constants/constants.dart';
import '../../../../controller/upload design/ArchitectAddDesignController.dart';

class ArchitectDesigntypeAndHouseFacing extends StatelessWidget {
  const ArchitectDesigntypeAndHouseFacing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final Screenwidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        GetBuilder<ArchitectAddDesignController>(builder: (getdata) {
          return Container(
            padding: EdgeInsets.all(10.w),
            // height: 100.w,
            width: 392.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.w),
                border: Border.all(width: 1.w, color: kgreycolor)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Design Type',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: getdata.selectedDesignTypeCheckBox == 0
                              ? true
                              : false,
                          onChanged: (value) {
                            getdata.DesignTypeCheckbox(0);
                          },
                        ),
                        Text('Simple', style: TextStyle(fontSize: 16.sp))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: getdata.selectedDesignTypeCheckBox == 1
                              ? true
                              : false,
                          onChanged: (value) {
                            getdata.DesignTypeCheckbox(1);
                          },
                        ),
                        Text('Modern', style: TextStyle(fontSize: 16.sp))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: getdata.selectedDesignTypeCheckBox == 2
                              ? true
                              : false,
                          onChanged: (value) {
                            getdata.DesignTypeCheckbox(2);
                          },
                        ),
                        Text('Others', style: TextStyle(fontSize: 16.sp)),
                      ],
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
        heigh10,
        GetBuilder<ArchitectAddDesignController>(builder: (getData) {
          return Container(
            padding: EdgeInsets.all(10.w),
            // height: 100.w,
            width: 620.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.w),
                border: Border.all(width: 1.w, color: kgreycolor)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'House Facing',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 30.w,
                          child: Checkbox(
                            value: getData.selectedHouseFacingCheckbox == 0
                                ? true
                                : false,
                            onChanged: (value) {
                              getData.HouseFacingCheckbox(0);
                            },
                          ),
                        ),
                        Text('East', style: TextStyle(fontSize: 16.sp))
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30.w,
                          child: Checkbox(
                            value: getData.selectedHouseFacingCheckbox == 1
                                ? true
                                : false,
                            onChanged: (value) {
                              getData.HouseFacingCheckbox(1);
                            },
                          ),
                        ),
                        Text('West', style: TextStyle(fontSize: 16.sp))
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30.w,
                          child: Checkbox(
                            value: getData.selectedHouseFacingCheckbox == 2
                                ? true
                                : false,
                            onChanged: (value) {
                              getData.HouseFacingCheckbox(2);
                            },
                          ),
                        ),
                        Text('South', style: TextStyle(fontSize: 16.sp))
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30.w,
                          child: Checkbox(
                            value: getData.selectedHouseFacingCheckbox == 3
                                ? true
                                : false,
                            onChanged: (value) {
                              getData.HouseFacingCheckbox(3);
                            },
                          ),
                        ),
                        Text('North', style: TextStyle(fontSize: 16.sp))
                      ],
                    ),
                  ],
                ),
                // Row(
                //   children: [

                //   ],
                // )
              ],
            ),
          );
        }),
      ],
    );
  }
}
