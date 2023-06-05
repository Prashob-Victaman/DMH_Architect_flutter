import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Constants/constants.dart';
import '../../../controller/upload design/ArchitectAddDesignController.dart';
import 'Widgets/ArchitectHousetype.dart';
import 'Widgets/Architecthoutypeformsimplex.dart';

class ArchitectUploadDesign extends StatelessWidget {
  ArchitectUploadDesign({super.key});

  TextEditingController projectDetailsController = TextEditingController();

  final getcontroller = Get.put(ArchitectAddDesignController());

  final formKey = GlobalKey<FormState>();

  // bool isLoading = false;

  // final List exteriorFileNameControllerList = [TextEditingController()];

  @override
  Widget build(BuildContext context) {
    // final Screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0.w),
          child: SizedBox(
            width: (384.7.w),
            child: ListView(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Upload Property Designs',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                      const Divider(),
                      SizedBox(
                        height: 10.w,
                      ),
                      Row(
                        children: [
                          Text(
                            'Upload Exterior Image',
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Container(
                            alignment: Alignment.center,
                            width: 50.w,
                            height: 40.w,
                            decoration: BoxDecoration(
                                color: kprimarycolor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(5.w)),
                            child: IconButton(
                              onPressed: () {
                                if (getcontroller
                                        .exteriorDesignNameControllerList
                                        .length <
                                    9) {
                                  getcontroller.changetextControllercount(1);
                                }
                              },
                              icon: Icon(
                                Icons.add,
                                color: kprimarycolor,
                                size: 25.w,
                              ),
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
                                if (getcontroller
                                        .exteriorDesignNameControllerList
                                        .length >
                                    3) {
                                  getcontroller.changetextControllercount(0);
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
                      GetBuilder<ArchitectAddDesignController>(
                          builder: (Getdata) {
                        print(getcontroller
                            .exteriorDesignNameControllerList.length);
                        return SizedBox(
                          child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      childAspectRatio: 0.7.sp),
                              physics: const ScrollPhysics(),
                              itemCount: getcontroller
                                  .exteriorDesignNameControllerList.length,
                              itemBuilder: (BuildContext context, int index) {

                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Getdata.uploadexteriorimagefileOne(
                                            index);
                                        getcontroller.changeexteriorisLoading(
                                            true, index);
                                      },
                                      child:
                                          Getdata.exteriorimgXfileList[index] !=
                                                  null
                                              ? Container(
                                                  height: 90.w,
                                                  width: 115.w,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 1.w,
                                                          color: kprimarycolor),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.w),
                                                      image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: FileImage(File(
                                                              Getdata
                                                                  .exteriorimgXfileList[
                                                                      index]!
                                                                  .path)))),
                                                )
                                              : uploadDesign(
                                                  isLoading: getcontroller
                                                      .exteriorisLoading[index],
                                                  // uploadedImage: Getdata.designDataImgOne!
                                                ),
                                    ),
                                    SizedBox(
                                      height: 10.w,
                                    ),
                                    SizedBox(
                                      // height: 40.w,
                                      width: 115.w,
                                      child: TextFormField(
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        controller: getcontroller
                                                .exteriorDesignNameControllerList[
                                            index],
                                        decoration: InputDecoration(
                                            hintText: 'File name',
                                            contentPadding:
                                                EdgeInsets.only(left: 10.w),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1.w,
                                                    color: kprimarycolor))),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Enter File Name';
                                          }

                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        );
                      }),
                      Row(
                        children: [
                          Text(
                            'Upload Floor Images',
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Container(
                            alignment: Alignment.center,
                            width: 50.w,
                            height: 40.w,
                            decoration: BoxDecoration(
                                color: kprimarycolor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(5.w)),
                            child: IconButton(
                              onPressed: () {
                                if (getcontroller
                                        .floorDesignNameControllerList.length <
                                    9) {
                                  getcontroller
                                      .changefloortextControllercount(1);
                                }
                              },
                              icon: Icon(
                                Icons.add,
                                color: kprimarycolor,
                                size: 25.w,
                              ),
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
                                if (getcontroller
                                        .floorDesignNameControllerList.length >
                                    3) {
                                  getcontroller
                                      .changefloortextControllercount(0);
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
                      GetBuilder<ArchitectAddDesignController>(
                          builder: (Getdata) {
                        return SizedBox(
                          child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      childAspectRatio: 0.7.sp),
                              physics: const ScrollPhysics(),
                              itemCount: getcontroller
                                  .floorDesignNameControllerList.length,
                              itemBuilder: (BuildContext context, int index) {

                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Getdata.uploadfloorfileimage(index);
                                        getcontroller.changefloorisLoading(
                                            true, index);
                                      },
                                      child: Getdata.floorimgXFileList[index] !=
                                              null
                                          ? Container(
                                              height: 90.w,
                                              width: 115.w,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1.w,
                                                      color: kprimarycolor),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.w),
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: FileImage(File(
                                                          Getdata
                                                              .floorimgXFileList[
                                                                  index]!
                                                              .path)))),
                                            )
                                          : uploadDesign(
                                              isLoading: getcontroller
                                                  .floorisLoading[index],
                                              // uploadedImage: Getdata.designDataImgOne!
                                            ),
                                    ),
                                    SizedBox(
                                      height: 10.w,
                                    ),
                                    SizedBox(
                                      // height: 40.w,
                                      width: 115.w,
                                      child: TextFormField(
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        controller: getcontroller
                                                .floorDesignNameControllerList[
                                            index],
                                        decoration: InputDecoration(
                                          hintText: 'File name',
                                          contentPadding:
                                              EdgeInsets.only(left: 10.w),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 1.w,
                                              color: kprimarycolor,
                                            ),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Enter File Name';
                                          }

                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        );
                      }),
                      SizedBox(
                        height: 10.w,
                      ),
                      Text(
                        'Add Project Details',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      SizedBox(
                        height: 100.w,
                        child: TextFormField(
                          controller: projectDetailsController,
                          maxLines: 20,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.w, color: kgreycolor))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Project Details ';
                            }

                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.w,
                      ),
                      ArchitectHouseType(),
                      GetBuilder<ArchitectAddDesignController>(
                          builder: (getdata) {
                        return Container(
                          child: getdata.selectedHouseType == 0
                              ? Architecthoutypeformsimplex(
                                  formKey: formKey,
                                  projectDetailsController:
                                      projectDetailsController)
                              : SizedBox(
                                  height: 1000.w,
                                ),
                        );
                      }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class uploadDesign extends StatelessWidget {
  // Uint8List uploadedImage;
  bool isLoading;

  uploadDesign({
    required this.isLoading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.w,
      width: 115.w,
      decoration: BoxDecoration(
          border: Border.all(width: 1.w, color: kprimarycolor),
          borderRadius: BorderRadius.circular(5.w)),
      child: isLoading == true
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
          :
          // uploadedImage!= null
          //     ? Container(
          //         decoration: BoxDecoration(
          //           image: DecorationImage(
          //             image: MemoryImage(uploadedImage),
          //           ),
          //         ),
          //       )
          //     :
          Icon(
              Icons.upload_file_rounded,
              color: kprimarycolor,
              size: 40.sp,
            ),
    );
  }
}
