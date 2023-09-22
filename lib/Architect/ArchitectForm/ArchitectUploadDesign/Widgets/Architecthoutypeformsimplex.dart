import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmh_architect/Architect/ArchitectForm/SubScreen/plotareadetails.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/ArchitectMyDesign.dart';
import 'package:dmh_architect/controller/upload%20design/AreaController.dart';
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

class Architecthoutypeformsimplex extends StatelessWidget {
  TextEditingController projectDetailsController;
  GlobalKey<FormState> formKey;
  String Floor;
  Architecthoutypeformsimplex(
      {super.key,
      required this.projectDetailsController,
      required this.formKey,
      required this.Floor});

  var totalArea;

  final areagecontroller = Get.put(AreaController());

  TextEditingController houseAreaLengthController = TextEditingController();
  TextEditingController houseAreawidthController = TextEditingController();
  // TextEditingController houseTotalAreaController = TextEditingController();
  TextEditingController DesignCostController = TextEditingController();

  TextEditingController vastuController = TextEditingController();
  TextEditingController discountController = TextEditingController();

  TextEditingController aproximateConstructionCostController =
      TextEditingController();
  TextEditingController estimatedConstructionCostController =
      TextEditingController();
  TextEditingController shortdescriptionController = TextEditingController();
  TextEditingController adddesignTypeController = TextEditingController();

  final getxcontroller = Get.put(ArchitectAddDesignController());

  final GetUploadController = Get.put(ArchitectUploadDesignController());

  final getController = Get.put(ArchitectUploadDesignTypeController());

  final FocusNode textFocusNode = FocusNode();

  // final List planingFileNameControllerList = [TextEditingController()];
  // final List planingFilePriceControllerList = [TextEditingController()];

  // List<int> indices = [0, 1, 3, 4, 5, 6, 7, 8, 9];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.w,
        ),
        ArchitectaddWorkingDeatails(
            // planingFileNameControllerList: planingFileNameControllerList,
            // planingFilePriceControllerList: planingFilePriceControllerList
            ),
        SizedBox(
          height: 10.w,
        ),
        ArchitectDesigntypeAndHouseFacing(
            adddesignTypeController: adddesignTypeController),
        SizedBox(
          height: 10.w,
        ),
        // ArchitecHousefloorsAndHousearea(
        //     houseAreaLengthController: houseAreaLengthController,
        //     houseAreawidthController: houseAreawidthController,
        //     houseTotalAreaController: houseTotalAreaController),

        PlotAreaDetails(
            plotLengthController: houseAreaLengthController,
            plotWidthController: houseAreawidthController,
            totalArea: totalArea),
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
                    child: FocusScope(
                      node: FocusScopeNode(),
                      child: TextFormField(
                        focusNode: textFocusNode,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter According to Vastu';
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
                  ),
                ],
              ),
              // heigh10,
              // Row(
              //   children: [
              //     Text(
              //       'Design Cost:',
              //       style:
              //           TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              //     ),
              //     Spacer(),
              //     SizedBox(
              //       // height: 40.w,
              //       width: 260.w,
              //       child: TextFormField(
              //         validator: (value) {
              //           if (value!.isEmpty) {
              //             return 'Please enter your Comapany Name';
              //           }

              //           return null;
              //         },
              //         textAlignVertical: TextAlignVertical.center,
              //         controller: DesignCostController,
              //         decoration: InputDecoration(
              //             contentPadding: EdgeInsets.only(left: 10.w),
              //             border: OutlineInputBorder(
              //                 borderSide: BorderSide(
              //                     width: 1.w, color: kprimarycolor))),
              //       ),
              //     ),
              //   ],
              // ),
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
                    'Aproximate Construction Cost :',
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  SizedBox(
                    // height: 40.w,
                    width: 120.w,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Construction Cost';
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
                    'Estimated Construction Time:',
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
                          return 'Please enter Construction Time';
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

        submitContainer(
            formKey: formKey,
            getxcontroller: getxcontroller,
            DesignCostController: DesignCostController,
            GetUploadController: GetUploadController,
            aproximateConstructionCostController:
                aproximateConstructionCostController,
            estimatedConstructionCostController:
                estimatedConstructionCostController,
            shortdescriptionController: shortdescriptionController,
            projectDetailsController: projectDetailsController,
            adddesignTypeController: adddesignTypeController,
            Floor: Floor,
            houseAreaLengthController: houseAreaLengthController,
            houseAreawidthController: houseAreawidthController,
            areagecontroller: areagecontroller,
            vastuController: vastuController,
            discountController: discountController),
      ],
    );
  }
}

class submitContainer extends StatelessWidget {
  const submitContainer({
    super.key,
    required this.formKey,
    required this.getxcontroller,
    required this.DesignCostController,
    required this.GetUploadController,
    required this.aproximateConstructionCostController,
    required this.estimatedConstructionCostController,
    required this.shortdescriptionController,
    required this.projectDetailsController,
    required this.adddesignTypeController,
    required this.Floor,
    required this.houseAreaLengthController,
    required this.houseAreawidthController,
    required this.areagecontroller,
    required this.vastuController,
    required this.discountController,
  });

  final GlobalKey<FormState> formKey;
  final ArchitectAddDesignController getxcontroller;
  final TextEditingController DesignCostController;
  final ArchitectUploadDesignController GetUploadController;
  final TextEditingController aproximateConstructionCostController;
  final TextEditingController estimatedConstructionCostController;
  final TextEditingController shortdescriptionController;
  final TextEditingController projectDetailsController;
  final TextEditingController adddesignTypeController;
  final String Floor;
  final TextEditingController houseAreaLengthController;
  final TextEditingController houseAreawidthController;
  final AreaController areagecontroller;
  final TextEditingController vastuController;
  final TextEditingController discountController;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 392.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.w),
                color: kwhitecolor,
                border: Border.all(width: 1.w, color: kprimarycolor)),
            height: 40.w,
            width: 170.w,
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
                                      for (var element
                                          in getxcontroller.planingImageUrl) {
                                        if (element != null) {
                                          planingImageUrl.add(element);
                                        }
                                      }

                                      List planingFileNameList = [];
                                      getxcontroller
                                          .planingFileNameControllerList
                                          .forEach((element) {
                                        if (element.text.isNotEmpty) {
                                          planingFileNameList.add(element.text);
                                        }
                                      });

                                      List planingFilePriceList = [];
                                      getxcontroller
                                          .planingFilePriceControllerList
                                          .forEach((element) {
                                        if (element.text.isNotEmpty) {
                                          planingFilePriceList
                                              .add(element.text);
                                        }
                                      });

                                      List exteriorImageList = [];
                                      for (var element in getxcontroller
                                          .exteriorimgurlList) {
                                        if (element != null) {
                                          exteriorImageList.add(element);
                                        }
                                      }
                                      print(exteriorImageList);

                                      List exteriorFileNameList = [];
                                      getxcontroller
                                          .exteriorDesignNameControllerList
                                          .forEach((element) {
                                        if (element.text.isNotEmpty) {
                                          exteriorFileNameList
                                              .add(element.text);
                                        }
                                      });

                                      List floorimgurlnList = [];
                                      for (var element
                                          in getxcontroller.floorimgurlList) {
                                        if (element != null) {
                                          floorimgurlnList.add(element);
                                        }
                                      }

                                      List floorFileNameList = [];
                                      getxcontroller
                                          .floorDesignNameControllerList
                                          .forEach((element) {
                                        if (element.text.isNotEmpty) {
                                          floorFileNameList.add(element.text);
                                        }
                                      });
                                      var data;
                                      await FirebaseFirestore.instance
                                          .collection('ArchitectData')
                                          .doc(FirebaseAuth
                                              .instance.currentUser!.uid)
                                          .get()
                                          .then((snapshot) => data = snapshot);
                                      print(data['name']);

                                      await getxcontroller
                                          .uploadDesignDataFromAdmin(
                                              architectName: data['name'],
                                              projectCost:
                                                  DesignCostController.text,
                                              exteriorImageList:
                                                  exteriorImageList,
                                              exteriorImagetitleList:
                                                  exteriorFileNameList,
                                              floorImageList: floorimgurlnList,
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
                                                  planingFilePriceList[0],
                                              shortdescription:
                                                  shortdescriptionController
                                                      .text,
                                              uploadedUserUid: FirebaseAuth
                                                  .instance.currentUser!.uid,
                                              adminUid: FirebaseAuth
                                                  .instance.currentUser!.uid,
                                              projectDetails:
                                                  projectDetailsController.text,
                                              designType: getxcontroller
                                                          .selectedDesignTypeCheckBox ==
                                                      0
                                                  ? 'Modern'
                                                  : getxcontroller
                                                              .selectedDesignTypeCheckBox ==
                                                          1
                                                      ? 'Classical'
                                                      : adddesignTypeController
                                                          .text,
                                              houseFacing: getxcontroller
                                                          .selectedHouseFacingCheckbox ==
                                                      0
                                                  ? 'East'
                                                  : getxcontroller.selectedHouseFacingCheckbox == 1
                                                      ? 'West'
                                                      : getxcontroller.selectedHouseFacingCheckbox == 2
                                                          ? 'South'
                                                          : 'North',
                                              houseFloors: Floor,
                                              houseType: housedesignname[getxcontroller.selectedHouseType],
                                              houseArea: {
                                                'length':
                                                    houseAreaLengthController
                                                        .text,
                                                'width':
                                                    houseAreawidthController
                                                        .text,
                                                'area': areagecontroller.area,
                                              },
                                              accordingtoVastu: vastuController.text,
                                              discount: discountController.text,
                                              planingFileNameList: planingFileNameList,
                                              planingFilePriceList: planingFilePriceList,
                                              planingFileUrlList: planingImageUrl);

                                      // getNavigatecontroller.changeoption(1);
                                      getxcontroller.clearingfields();

                                      // getxcontroller
                                      //     .exteriorisLoading[index] = false;

                                      print(
                                          getxcontroller.exteriorimgurlList[1]);

                                      GetUploadController.createdlistofitems
                                          .clear();
                                      planingFileNameList.clear();
                                      planingFilePriceList.clear();
                                      planingImageUrl.clear();
                                      areagecontroller.area = '';
                                      Get.back();

                                      // Get.off(() => ArchitectMyDesign);
                                      Navigator.of(context)
                                          .pushReplacement(MaterialPageRoute(
                                        builder: (context) =>
                                            ArchitectMyDesign(),
                                      ));
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
                                          border:
                                              Border.all(color: kprimarycolor)),
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
                height: 40.w,
                width: 170.w,
                child: Text('Upload',
                    style: TextStyle(fontSize: 16.sp, color: kwhitecolor)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
