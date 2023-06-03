// import 'package:design_my_house_admin/Controller/NavigationController/ArchitectAddDesignController.dart';
// import 'package:design_my_house_admin/Controller/UploaddesignController/uploadDesignTypeController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../Constants/constants.dart';
import '../../../../controller/upload design/ArchitectAddDesignController.dart';
import '../../../../controller/upload design/ArchitectUploadDesignTypeController.dart';

class ArchitectaddWorkingDeatails extends StatefulWidget {
  List planingFileNameControllerList;

  List planingFilePriceControllerList;
  ArchitectaddWorkingDeatails(
      {super.key,
      required this.planingFileNameControllerList,
      required this.planingFilePriceControllerList});

  @override
  State<ArchitectaddWorkingDeatails> createState() =>
      _ArchitectaddWorkingDeatailsState();
}

class _ArchitectaddWorkingDeatailsState
    extends State<ArchitectaddWorkingDeatails> {
  final getController = Get.put(ArchitectUploadDesignTypeController());

  int planningGridCount = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<ArchitectAddDesignController>(builder: (Getdata) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Add Working Details',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.w,
            ),
            Row(
              children: [
                Text(
                  'Planning',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Container(
                  alignment: Alignment.center,
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                      color: kprimarycolor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5.w)),
                  child: GestureDetector(
                    onTap: () {
                      if (planningGridCount < 6) {
                        planningGridCount += 1;
                        widget.planingFileNameControllerList
                            .add(TextEditingController());
                        widget.planingFilePriceControllerList
                            .add(TextEditingController());
                      }

                      setState(() {});
                    },
                    child: Row(
                      children: [
                        const Spacer(),
                        Icon(
                          Icons.add,
                          color: kprimarycolor,
                          size: 25.w,
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                      color: kprimarycolor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5.w)),
                  child: GestureDetector(
                    onTap: () {
                      if (planningGridCount > 1) {
                        planningGridCount -= 1;
                      }

                      setState(() {});
                    },
                    child: Row(
                      children: [
                        const Spacer(),
                        Icon(
                          Icons.delete,
                          color: kprimarycolor,
                          size: 25.w,
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.w,
            ),
            GetBuilder<ArchitectUploadDesignTypeController>(builder: (context) {
              return SizedBox(
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, childAspectRatio: 0.6.sp),
                    physics: const ScrollPhysics(),
                    itemCount: planningGridCount,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () =>
                                    getController.fetchPlanningImg(index),
                                child: customUploadButton(
                                    getController.planningImgs[index], context),
                              ),
                              heigh5,
                              SizedBox(
                                width: 100.w,
                                height: 35.sp,
                                child: Center(
                                  child: TextFormField(
                                    controller: widget
                                        .planingFileNameControllerList[index],
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter File name';
                                      }
                                      return null;
                                    },
                                    decoration:
                                        customInputDecoration('File name'),
                                  ),
                                ),
                              ),
                              heigh5,
                              SizedBox(
                                width: 100.sp,
                                height: 35.sp,
                                child: Center(
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter Estimated cost';
                                      }
                                      return null;
                                    },
                                    controller: widget
                                        .planingFilePriceControllerList[index],
                                    decoration: customInputDecoration('₹0.0'),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      );
                    }),
              );
            }),
            SizedBox(
              height: 10.w,
            ),
          ],
        );
      }),
    );
  }
}

customUploadButton(image, context) {
  return Container(
    // padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
    width: 100.w,
    height: 100.w,
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: Colors.red),
      borderRadius: const BorderRadius.all(Radius.circular(5)),
    ),
    child: image != null
        ? Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: MemoryImage(image),
                )),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.cloud_upload_outlined,
                color: kprimarycolor,
                size: 40.sp,
              ),

              Text(
                'Upload design',
                style: TextStyle(fontSize: 12.0.sp, color: kprimarycolor),
              ),
            ],
          ),
  );
}
class uploadDesign extends StatelessWidget {
  // Uint8List uploadedImage;

  uploadDesign({
    // required this.uploadedImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.w,
      width: 390.w,
      decoration: BoxDecoration(
          border: Border.all(width: 1.w, color: kprimarycolor),
          borderRadius: BorderRadius.circular(5.w)),
      child:
          // uploadedImage!= null
          //     ? Container(
          //         decoration: BoxDecoration(
          //           image: DecorationImage(
          //             image: MemoryImage(uploadedImage),
          //           ),
          //         ),
          //       )
          //     :
          Padding(
        padding: EdgeInsets.only(top: 50.0.w),
        child: Column(
          children: [
            Icon(
              Icons.upload_file_rounded,
              color: kprimarycolor,
              size: 40.sp,
            ),
            SizedBox(
              height: 10.w,
            ),
            Text(
              'Upload your design',
              style: TextStyle(fontSize: 14.sp, color: kprimarycolor),
            )
          ],
        ),
      ),
    );
  }
}
