// import 'package:design_my_house_admin/Controller/NavigationController/ArchitectAddDesignController.dart';
// import 'package:design_my_house_admin/Controller/UploaddesignController/uploadDesignTypeController.dart';
import 'dart:io';

import 'package:dmh_architect/controller/ordercontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../Constants/constants.dart';
import '../../../../controller/upload design/ArchitectAddDesignController.dart';
import '../../../../controller/upload design/ArchitectUploadDesignTypeController.dart';

class ArchitectaddWorkingDeatails extends StatelessWidget {
  // List planingFileNameControllerList;

  // List planingFilePriceControllerList;


  ArchitectaddWorkingDeatails({
    super.key,
  });

  final getController = Get.put(ArchitectUploadDesignTypeController());

  final getXCOntroller = Get.put(ArchitectAddDesignController());

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
                  'Working Drawings',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Container(
                  alignment: Alignment.center,
                  width: 50.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                      color: kprimarycolor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5.w)),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (getXCOntroller.planningGridCount < 6) {
                            getXCOntroller.addworkingDrawings(1);
                            // planingFileNameControllerList
                            //     .add(TextEditingController());
                            // planingFilePriceControllerList
                            //     .add(TextEditingController());
                          }
                        },
                        icon: Icon(
                          Icons.add,
                          color: kprimarycolor,
                          size: 25.w,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 50.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                      color: kprimarycolor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5.w)),
                  child: IconButton(
                    onPressed: () {
                      if (getXCOntroller.planningGridCount > 1) {
                        getXCOntroller.addworkingDrawings(0);

                        getXCOntroller.planingFileNameControllerList[
                                getXCOntroller.planningGridCount]
                            .clear();

                        getXCOntroller.planingFilePriceControllerList[
                                getXCOntroller.planningGridCount]
                            .clear();
                        getXCOntroller.planningImgs[
                            getXCOntroller.planningGridCount] = null;

                        getXCOntroller.planingImageUrl[
                            getXCOntroller.planningGridCount] = null;

                        getXCOntroller.workingDrawingsisLoading[
                            getXCOntroller.planningGridCount] = false;
                      }
                    },
                    icon: Icon(
                      Icons.delete,
                      color: kprimarycolor,
                      size: 25.w,
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
                        crossAxisCount: 3, childAspectRatio: 0.56.sp),
                    physics: const ScrollPhysics(),
                    itemCount: getXCOntroller.planningGridCount,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  getXCOntroller.fetchPlanningImg(index);

                                  getXCOntroller.changeworkingDetailsisLoading(
                                      true, index);
                                },
                                child: customUploadButton(
                                    getXCOntroller.planningImgs[index],
                                    context,
                                    getXCOntroller
                                        .workingDrawingsisLoading[index]),
                              ),
                              heigh5,
                              SizedBox(
                                width: 115.w,
                                // height: 35.sp,
                                child: Center(
                                  child: TextFormField(
                                    controller: getXCOntroller
                                        .planingFileNameControllerList[index],
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter File name';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        hintText: 'File name',
                                        contentPadding:
                                            EdgeInsets.only(left: 10.w),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1.w,
                                                color: kprimarycolor))),
                                  ),
                                ),
                              ),
                              heigh5,
                              SizedBox(
                                width: 115.sp,
                                // height: 35.sp,
                                child: Center(
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter Estimated cost';
                                      }
                                      return null;
                                    },
                                    controller: getXCOntroller
                                        .planingFilePriceControllerList[index],
                                    decoration: InputDecoration(
                                        hintText: 'File Amount',
                                        contentPadding:
                                            EdgeInsets.only(left: 10.w),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1.w,
                                                color: kprimarycolor))),
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
          ],
        );
      }),
    );
  }
}

customUploadButton(image, context, isloading) {
  return Container(
    // padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
    width: 115.w,
    height: 90.w,
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: Colors.red),
      borderRadius: const BorderRadius.all(Radius.circular(5)),
    ),
    child: image != null
        ? Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.sp)),
                color: Colors.green),
            // image: DecorationImage(
            //   fit: BoxFit.cover,
            //   image: FileImage(File(image!.path)),
            // )),
            child: Icon(
              Icons.check_circle,
              size: 60.sp,
              color: Colors.white,
            ),
          )
        : isloading == true
            ? Center(
                child: SizedBox(
                  height: 20.w,
                  width: 20.w,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.w,
                    color: kprimarycolor,
                  ),
                ),
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
                    'Upload design PDF',
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
