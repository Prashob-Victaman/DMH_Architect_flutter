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

  // final List exteriorFileNameControllerList = [TextEditingController()];

  @override
  Widget build(BuildContext context) {
    final Screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0.w),
        child: SizedBox(
          width: (Screenwidth),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Upload Property Designs',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
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
                        width: 40.w,
                        height: 40.w,
                        decoration: BoxDecoration(
                            color: kprimarycolor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(5.w)),
                        child: GestureDetector(
                          onTap: () {
                            if (getcontroller
                                    .exteriorDesignNameControllerList.length <
                                9) {
                              getcontroller.changetextControllercount(1);
                            }
                          },
                          child: Row(
                            children: [
                              const Spacer(),
                              Icon(
                                Icons.add,
                                color: kprimarycolor,
                                size: 25.w,
                              ),
                              const Spacer()
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
                            if (getcontroller
                                    .exteriorDesignNameControllerList.length >
                                3) {
                              getcontroller.changetextControllercount(0);
                            }
                          },
                          child: Row(
                            children: [
                              const Spacer(),
                              Icon(
                                Icons.delete,
                                color: kprimarycolor,
                                size: 25.w,
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.w,
                  ),

                  GetBuilder<ArchitectAddDesignController>(builder: (Getdata) {
                    print(getcontroller.exteriorDesignNameControllerList.length);
                    return SizedBox(
                      child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, childAspectRatio: 0.75.sp),
                          physics: const ScrollPhysics(),
                          itemCount: getcontroller
                              .exteriorDesignNameControllerList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () =>
                                      Getdata.uploadexteriorimagefileOne(index),
                                  child: Getdata.exteriorimgunit8List[index] !=
                                          null
                                      ? Container(
                                          height: 180.w,
                                          width: 100.w,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1.w,
                                                  color: kprimarycolor),
                                              borderRadius:
                                                  BorderRadius.circular(5.w),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: MemoryImage(Getdata
                                                          .exteriorimgunit8List[
                                                      index]!))),
                                        )
                                      : uploadDesign(
                                          // uploadedImage: Getdata.designDataImgOne!
                                          ),
                                ),
                                SizedBox(
                                  height: 10.w,
                                ),
                                SizedBox(
                                  height: 40.w,
                                  width: 100.w,
                                  child: TextField(
                                    textAlignVertical: TextAlignVertical.center,
                                    controller: getcontroller
                                        .exteriorDesignNameControllerList[index],
                                    decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.only(left: 10.w),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1.w,
                                                color: kprimarycolor))),
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
                        width: 40.w,
                        height: 40.w,
                        decoration: BoxDecoration(
                            color: kprimarycolor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(5.w)),
                        child: GestureDetector(
                          onTap: () {
                            if (getcontroller
                                    .floorDesignNameControllerList.length <
                                9) {
                              getcontroller.changefloortextControllercount(1);
                            }
                          },
                          child: Row(
                            children: [
                              const Spacer(),

                              Icon(
                                Icons.add,
                                color: kprimarycolor,
                                size: 25.w,
                              ),
                              const Spacer()
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
                            if (getcontroller
                                    .floorDesignNameControllerList.length >
                                3) {
                              getcontroller.changefloortextControllercount(0);
                            }
                          },
                          child: Row(
                            children: [
                              const Spacer(),
                              Icon(
                                Icons.delete,
                                color: kprimarycolor,
                                size: 25.w,
                              ),
                              const Spacer()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  GetBuilder<ArchitectAddDesignController>(builder: (Getdata) {
                    return SizedBox(
                      child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                               SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, childAspectRatio:  0.75.sp),
                          physics: const ScrollPhysics(),
                          itemCount:
                              getcontroller.floorDesignNameControllerList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () =>
                                      Getdata.uploadfloorfileimage(index),
                                  child: Getdata.floorimgunit8List[index] != null
                                      ? Container(
                                    height: 180.w,
                                    width: 100.w,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1.w,
                                                  color: kprimarycolor),
                                              borderRadius:
                                                  BorderRadius.circular(5.w),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: MemoryImage(
                                                      Getdata.floorimgunit8List[
                                                          index]!))),
                                        )
                                      : uploadDesign(
                                          // uploadedImage: Getdata.designDataImgOne!
                                          ),
                                ),
                                SizedBox(
                                  height: 10.w,
                                ),
                                SizedBox(
                                  height: 40.w,
                                  width: 100.w,
                                  child: TextField(
                                    textAlignVertical: TextAlignVertical.center,
                                    controller: getcontroller
                                        .floorDesignNameControllerList[index],
                                    decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.only(left: 10.w),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1.w,
                                                color: kprimarycolor))),
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
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  SizedBox(
                    height: 100.w,
                    child: TextField(
                      controller: projectDetailsController,
                      maxLines: 20,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1.w, color: kgreycolor))),
                    ),
                  ),
                  SizedBox(
                    height: 20.w,
                  ),
                  ArchitectHouseType(),
                  GetBuilder<ArchitectAddDesignController>(builder: (getdata) {
                    return Container(
                      child: getdata.selectedHouseType == 0
                          ? Architecthoutypeformsimplex(
                              projectDetailsController: projectDetailsController)
                          : SizedBox(
                              height: 1000.w,
                            ),
                    );
                  }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
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
      height: 100.w,
      width: 100.w,
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
          Icon(
            Icons.upload_file_rounded,
            color: kprimarycolor,
            size: 40.sp,
          ),
    );
  }
}
