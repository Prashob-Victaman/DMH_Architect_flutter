import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../Constants/constants.dart';
import '../../../../controller/upload design/ArchitectAddDesignController.dart';
import '../../../../controller/upload design/ArchitectUploadDesignController.dart';
import '../../../../controller/upload design/ArchitectUploadDesignTypeController.dart';
import '../../../ArchitectDesignpage/widgets/SubScreen/floorDetails.dart';
import 'ArchitectDesigntypeAndHouseFacing.dart';
import 'ArchitectaddWorkingDeatails.dart';
import 'ArchitecthouseFloorandHouseArea.dart';

class Architecthoutypeformsimplex extends StatelessWidget {
  TextEditingController projectDetailsController;
  GlobalKey<FormState> formKey;
  Architecthoutypeformsimplex(
      {super.key,
      required this.projectDetailsController,
      required this.formKey});

  TextEditingController houseAreaLengthController = TextEditingController();
  TextEditingController houseAreawidthController = TextEditingController();
  TextEditingController houseTotalAreaController = TextEditingController();
  TextEditingController DesignCostController = TextEditingController();

  TextEditingController vastuController = TextEditingController();
  TextEditingController discountController = TextEditingController();

  TextEditingController aproximateConstructionCostController =
      TextEditingController();
  TextEditingController estimatedConstructionCostController =
      TextEditingController();
  TextEditingController shortdescriptionController = TextEditingController();

  final getxcontroller = Get.put(ArchitectAddDesignController());

  final GetUploadController = Get.put(ArchitectUploadDesignController());

  final getController = Get.put(ArchitectUploadDesignTypeController());

  final List planingFileNameControllerList = [TextEditingController()];
  final List planingFilePriceControllerList = [TextEditingController()];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.w,
        ),
        const ArchitectDesigntypeAndHouseFacing(),
        SizedBox(
          height: 10.w,
        ),
        ArchitecHousefloorsAndHousearea(
            houseAreaLengthController: houseAreaLengthController,
            houseAreawidthController: houseAreawidthController,
            houseTotalAreaController: houseTotalAreaController),
        SizedBox(
          height: 20.w,
        ),
        SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'According to Vastu (In %):',
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  SizedBox(
                    // height: 40.w,
                    width: 170.w,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Comapany Name';
                        }

                        return null;
                      },
                      textAlignVertical: TextAlignVertical.center,
                      controller: vastuController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10.w),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.w, color: kprimarycolor))),
                    ),
                  ),
                ],
              ),
              heigh10,
              Row(
                children: [
                  Text(
                    'Design Cost:',
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  SizedBox(
                    // height: 40.w,
                    width: 260.w,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Comapany Name';
                        }

                        return null;
                      },
                      textAlignVertical: TextAlignVertical.center,
                      controller: DesignCostController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10.w),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.w, color: kprimarycolor))),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.w,
        ),
        SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'AproximateConstructionCost :',
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  SizedBox(
                    // height: 40.w,
                    width: 140.w,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Comapany Name';
                        }

                        return null;
                      },
                      textAlignVertical: TextAlignVertical.center,
                      controller: aproximateConstructionCostController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10.w),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.w, color: kprimarycolor))),
                    ),
                  ),
                ],
              ),
              heigh10,
              Row(
                children: [
                  Text(
                    'EstimatedConstructionCost:',
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  SizedBox(
                    // height: 40.w,
                    width: 155.w,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Comapany Name';
                        }

                        return null;
                      },
                      textAlignVertical: TextAlignVertical.center,
                      controller: estimatedConstructionCostController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10.w),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.w, color: kprimarycolor))),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.w,
        ),
        //ArchitectFloorDetails(),
        FloorDetails(),

        SizedBox(
          height: 20.w,
        ),
        // Container(
        //   child: Row(
        //     children: [
        //       Text(
        //         'Upload Design PDF',
        //         style: bold18,
        //       ),
        //       IconButton(
        //           onPressed: () {
        //             // getcontroller.uploadpdf();
        //           },
        //           icon: Icon(
        //             Icons.attach_file,
        //             size: 30.w,
        //           ))
        //     ],
        //   ),
        // ),
        SizedBox(
          height: 10.w,
        ),
        ArchitectaddWorkingDeatails(
            planingFileNameControllerList: planingFileNameControllerList,
            planingFilePriceControllerList: planingFilePriceControllerList),
        SizedBox(
          height: 10.w,
        ),

        Container(
          width: 392.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.w),
                    color: kwhitecolor,
                    border: Border.all(width: 1.w, color: kprimarycolor)),
                height: 50.w,
                width: 161.w,
                child: Text('Cancel',
                    style: TextStyle(fontSize: 16.sp, color: kprimarycolor)),
              ),
              width10,
              GestureDetector(
                onTap: () async {},
                child: GestureDetector(
                  onTap: () {
                    final form = formKey.currentState;

                    if (form!.validate()) {
                      form.save();

                      showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            titlePadding: EdgeInsets.all(0.w),
                            title: Container(
                              height: 114.w,
                              width: 282.w,
                              child: Column(
                                children: [
                                  Container(
                                      alignment: Alignment.center,
                                      height: 84.w,
                                      child: Text(
                                        'Are you sure you want to Submit',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: kblackcolor,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          List planingImageUrl = [];
                                          for (var element in getController
                                              .planingImageUrl) {
                                            if (element != null) {
                                              planingImageUrl.add(element);
                                            }
                                          }

                                          List planingFileNameList = [];
                                          planingFileNameControllerList
                                              .forEach((element) {
                                            planingFileNameList
                                                .add(element.text);
                                          });

                                          List planingFilePriceList = [];
                                          planingFilePriceControllerList
                                              .forEach((element) {
                                            planingFilePriceList
                                                .add(element.text);
                                          });

                                          List exteriorImageList = [];
                                          for (var element in getxcontroller
                                              .exteriorimgurlList) {
                                            if (element != null) {
                                              exteriorImageList.add(element);
                                            }
                                          }

                                          List exteriorFileNameList = [];
                                          getxcontroller
                                              .exteriorDesignNameControllerList
                                              .forEach((element) {
                                            exteriorFileNameList
                                                .add(element.text);
                                          });

                                          List floorimgurlnList = [];
                                          for (var element in getxcontroller
                                              .floorimgurlList) {
                                            if (element != null) {
                                              floorimgurlnList.add(element);
                                            }
                                          }

                                          List floorFileNameList = [];
                                          getxcontroller
                                              .floorDesignNameControllerList
                                              .forEach((element) {
                                            floorFileNameList.add(element.text);
                                          });

                                          await getxcontroller
                                              .uploadDesignDataFromAdmin(
                                                  projectCost:
                                                      DesignCostController.text,
                                                  exteriorImageList:
                                                      exteriorImageList,
                                                  exteriorImagetitleList:
                                                      exteriorFileNameList,
                                                  floorImageList:
                                                      floorimgurlnList,
                                                  floorImagetitleList:
                                                      floorFileNameList,
                                                  floordetails: GetUploadController
                                                      .createdlistofitems,
                                                  aproximateConstructionCost:
                                                      aproximateConstructionCostController
                                                          .text,
                                                  estimatedConstructionCost:
                                                      estimatedConstructionCostController
                                                          .text,
                                                  designprice:
                                                      DesignCostController.text,
                                                  shortdescription:
                                                      shortdescriptionController
                                                          .text,
                                                  uploadedUserUid: FirebaseAuth
                                                      .instance
                                                      .currentUser!
                                                      .uid,
                                                  adminUid: FirebaseAuth
                                                      .instance
                                                      .currentUser!
                                                      .uid,
                                                  projectDetails:
                                                      'projectDetailsController.text',
                                                  designType: getxcontroller
                                                              .selectedDesignTypeCheckBox ==
                                                          0
                                                      ? 'Simple'
                                                      : getxcontroller
                                                                  .selectedDesignTypeCheckBox ==
                                                              1
                                                          ? 'Modern'
                                                          : 'Others',
                                                  houseFacing: getxcontroller
                                                              .selectedHouseFacingCheckbox ==
                                                          0
                                                      ? 'East'
                                                      : getxcontroller
                                                                  .selectedHouseFacingCheckbox ==
                                                              1
                                                          ? 'West'
                                                          : getxcontroller.selectedHouseFacingCheckbox == 2
                                                              ? 'South'
                                                              : 'North',
                                                  houseFloors: getxcontroller.selectedHouseFloorsCheckbox == 0
                                                      ? '1 Floor'
                                                      : getxcontroller.selectedHouseFloorsCheckbox == 1
                                                          ? '2 Floor'
                                                          : 'Others',
                                                  houseType: getxcontroller.selectedHouseType == 0
                                                      ? 'Simplex'
                                                      : getxcontroller.selectedHouseType == 1
                                                          ? 'Duplex'
                                                          : getxcontroller.selectedHouseType == 2
                                                              ? 'Triplex'
                                                              : getxcontroller.selectedHouseType == 3
                                                                  ? 'Appartment'
                                                                  : getxcontroller.selectedHouseType == 4
                                                                      ? 'Hotel'
                                                                      : getxcontroller.selectedHouseType == 5
                                                                          ? 'Restaurant'
                                                                          : getxcontroller.selectedHouseType == 6
                                                                              ? 'Botique'
                                                                              : 'Shopping Mall',
                                                  houseArea: {
                                                    'length':
                                                        houseAreaLengthController
                                                            .text,
                                                    'width':
                                                        houseAreawidthController
                                                            .text,
                                                    'area':
                                                        houseTotalAreaController
                                                            .text,
                                                  },
                                                  accordingtoVastu: vastuController.text,
                                                  discount: discountController.text,
                                                  planingFileNameList: planingFileNameList,
                                                  planingFilePriceList: planingFilePriceList,
                                                  planingFileUrlList: planingImageUrl);

                                          // getNavigatecontroller.changeoption(1);

                                          getxcontroller.exteriorimgurlList[1] =
                                              null;
                                          getxcontroller.exteriorimgurlList[3] =
                                              null;
                                          getxcontroller.exteriorimgurlList[0] =
                                              null;

                                          getxcontroller
                                              .exteriorimgXfileList[0] = null;
                                          getxcontroller
                                              .exteriorimgXfileList[1] = null;
                                          getxcontroller
                                              .exteriorimgXfileList[2] = null;

                                          getxcontroller.floorimgXFileList[0] =
                                              null;
                                          getxcontroller.floorimgurlList[0] =
                                              null;

                                          getxcontroller.floorimgXFileList[1] =
                                              null;
                                          getxcontroller.floorimgurlList[1] =
                                              null;

                                          getxcontroller.floorimgXFileList[2] =
                                              null;
                                          getxcontroller.floorimgurlList[2] =
                                              null;

                                          GetUploadController.createdlistofitems
                                              .clear();
                                          planingFileNameList.clear();
                                          planingFilePriceList.clear();
                                          planingImageUrl.clear();

                                          Get.back();

                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(builder: (context) => Architectbottomnavigationbar(selectedindex: 0)),
                                          // );
                                        },
                                        child: Container(
                                          height: 30.w,
                                          width: 141.w,
                                          decoration: const BoxDecoration(
                                              color: kprimarycolor),
                                          child: Center(
                                            child: Text(
                                              'Yes',
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: kwhitecolor),
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => Get.back(),
                                        child: Container(
                                          height: 30.w,
                                          width: 141.w,
                                          decoration: BoxDecoration(
                                              color: kwhitecolor,
                                              border: Border.all(
                                                  color: kprimarycolor)),
                                          child: Center(
                                              child: Text(
                                            'Cancel',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: kprimarycolor),
                                          )),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.w),
                        color: kprimarycolor),
                    height: 50.w,
                    width: 161.w,
                    child: Text('Upload',
                        style: TextStyle(fontSize: 16.sp, color: kwhitecolor)),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
