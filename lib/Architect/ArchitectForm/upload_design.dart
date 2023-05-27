import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Constants/constants.dart';
import '../../controller/uploadDesignController.dart';
import '../ArchitectDesignpage/widgets/SubScreen/floorDetails.dart';
import '../Architectbottomnavigationbar/Architectbottomnavigationbar.dart';
import 'SubScreen/plotareadetails.dart';
import 'SubScreen/updoad_design_part2.dart';
import 'SubScreen/upload_design_part3.dart';

class UploadDesign extends StatefulWidget {
  const UploadDesign({Key? key}) : super(key: key);

  @override
  State<UploadDesign> createState() => _UploadDesignState();
}

class _UploadDesignState extends State<UploadDesign> {
  final getController = Get.put(uploadDesignTypeController());

  final formKey1 = GlobalKey<FormState>();

  int planningGridCount = 0;
  int structureGridCount = 0;
  int elevationGridCount = 0;
  int selectedHouseFloor = 0;
  int selectedHouseFacing = 0;
  final TextEditingController estimateCostControler = TextEditingController();
  final TextEditingController projectDetailsController =
      TextEditingController();
  final TextEditingController plotLengthController = TextEditingController();
  final TextEditingController plotWidthController = TextEditingController();
  final TextEditingController totalAreaController = TextEditingController();
  final TextEditingController designpriceController = TextEditingController();
  final TextEditingController shortDescriptionController =
      TextEditingController();

  final TextEditingController accordingVastuController =
      TextEditingController();
  final TextEditingController approximateCostController =
      TextEditingController();
  final TextEditingController planingBasementController =
      TextEditingController();
  final TextEditingController planningGroundController =
      TextEditingController();
  final TextEditingController planningFirstFloorController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    String selectedFloor = 'Basement';

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TextButton.icon(
                    onPressed: () {
                      Get.to(
                          () => Architectbottomnavigationbar(selectedindex: 0));
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Back')),
              ),
              heigh10,
              const Text(
                'Add Your Design/Project',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              heigh10,
              const Text(
                'Select exterior file/Photos of your project',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              heigh10,
              GetBuilder<uploadDesignTypeController>(builder: (getdata) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        getController.fetchExteriorImg(0, context);
                      },
                      child: customUploadButton(getController.exteriorImgs[0]),
                    ),
                    GestureDetector(
                      onTap: () => getController.fetchExteriorImg(1, context),
                      child: customUploadButton(getController.exteriorImgs[1]),
                    ),
                    GestureDetector(
                      onTap: () => getController.fetchExteriorImg(2, context),
                      child: customUploadButton(getController.exteriorImgs[2]),
                    ),
                  ],
                );
              }),
              heigh10,
              const Text(
                'Select floor file/Photo of your project',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              heigh10,
              GetBuilder<uploadDesignTypeController>(builder: (context) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => getController.fetchFloorImg(0),
                      child: customUploadButton(getController.floorImgs[0]),
                    ),
                    GestureDetector(
                      onTap: () => getController.fetchFloorImg(1),
                      child: customUploadButton(getController.floorImgs[1]),
                    ),
                    GestureDetector(
                      onTap: () => getController.fetchFloorImg(2),
                      child: customUploadButton(getController.floorImgs[2]),
                    ),
                  ],
                );
              }),

              Form(
                key: formKey1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heigh10,
                    const Text(
                      'Design Price',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    heigh10,
                    SizedBox(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: designpriceController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Design Price';
                          }
                          return null;
                        },
                        decoration: customInputDecoration('Design Price'),
                      ),
                    ),
                    heigh10,
                    const Text(
                      'Short Description',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    heigh10,
                    SizedBox(
                      child: TextFormField(
                        controller: shortDescriptionController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Short Description';
                          }
                          return null;
                        },
                        decoration:
                            deatilscustomInputDecoration('Short Description'),
                      ),
                    ),
                    heigh10,
                    const Text(
                      'Project Details',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    heigh10,
                    TextFormField(
                      controller: projectDetailsController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Description';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10.w, top: 10.w),
                        fillColor: kredcolor,
                        hintText: 'Add some description about your project',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.w),
                          borderSide: const BorderSide(color: Colors.black12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.w),
                          borderSide: const BorderSide(color: Colors.black12),
                        ),
                      ),
                      maxLines: 6,
                    ),
                    heigh10,
                    UploadDesignPartTwo(),
                    UploadDesignPartThree(
                        selectedHouseFacing: selectedHouseFacing,
                        selectedHouseFloor: selectedHouseFloor),
                    heigh10,
                    PlotAreaDetails(
                        plotLengthController: plotLengthController,
                        plotWidthController: plotWidthController,
                        totalAreaController: totalAreaController),
                    heigh10,
                    const Text(
                      'According to Vastu (In %)',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    heigh10,
                    SizedBox(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: accordingVastuController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Something';
                          }
                          return null;
                        },
                        decoration: customInputDecoration('According to Vastu'),
                      ),
                    ),
                    heigh10,
                    const Text(
                      'Estimated construction cost',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    heigh10,
                    SizedBox(
                      child: TextFormField(
                        controller: approximateCostController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Approximate cost';
                          }
                          return null;
                        },
                        onChanged: (value) {},
                        keyboardType: TextInputType.number,
                        decoration: customInputDecoration('₹ 23,88,500'),
                      ),
                    ),
                    heigh10,
                    const Text(
                      'Approximate construction cost',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    heigh10,
                    SizedBox(
                      child: TextFormField(
                        controller: estimateCostControler,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Estimated cost';
                          }
                          return null;
                        },
                        onChanged: (value) {},
                        keyboardType: TextInputType.number,
                        decoration: customInputDecoration('₹ 23,88,500'),
                      ),
                    ),
                  ],
                ),
              ),



              FloorDetails(),


              heigh20,
              const Text(
                'Add Working details',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              heigh10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // const Text(
                  //   'Planning',
                  //   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  // ),
                  // SizedBox(
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: Colors.redAccent,
                  //       shape: const StadiumBorder(),
                  //     ),
                  //     onPressed: () {
                  //       setState(() {
                  //         planningGridCount += 1;
                  //       });
                  //     },
                  //     child: Row(
                  //       children: [
                  //         Text('Add', style: normal14),
                  //         width10,
                  //         Icon(
                  //           Icons.add,
                  //           size: 20.sp,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              heigh10,
              GetBuilder<uploadDesignTypeController>(builder: (context) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () => getController.fetchPlanningImg(0),
                          child:
                              customUploadButton(getController.planningImgs[0]),
                        ),
                        heigh5,
                        const Text('Basement'),
                        heigh5,
                        SizedBox(
                          width: 115.sp,
                          height: 35.sp,
                          child: Center(
                            child: TextField(
                              controller: planingBasementController,
                              decoration: customInputDecoration('₹0.0'),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () => getController.fetchPlanningImg(1),
                          child:
                              customUploadButton(getController.planningImgs[1]),
                        ),
                        heigh5,
                        const Text('Ground Floor'),
                        heigh5,
                        SizedBox(
                          width: 115.sp,
                          height: 35.sp,
                          child: TextField(
                            controller: planningGroundController,
                            decoration: customInputDecoration('₹0.0'),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () => getController.fetchPlanningImg(2),
                          child:
                              customUploadButton(getController.planningImgs[2]),
                        ),
                        heigh5,
                        const Text('First Floor'),
                        heigh5,
                        SizedBox(
                          width: 115.sp,
                          height: 35.sp,
                          child: TextField(
                            controller: planningFirstFloorController,
                            decoration: customInputDecoration('₹0.0'),
                          ),
                        )
                      ],
                    ),
                  ],
                );
              }),
              heigh10,
              // planningGridCount == 0
              //     ? const SizedBox(
              //         width: 0,
              //         height: 0,
              //       )
              //     : GridView.builder(
              //         shrinkWrap: true,
              //         physics: const ScrollPhysics(),
              //         itemCount: planningGridCount,
              //         gridDelegate:
              //             const SliverGridDelegateWithFixedCrossAxisCount(
              //                 crossAxisCount: 3,
              //                 crossAxisSpacing: 8.0,
              //                 childAspectRatio: 0.6),
              //         itemBuilder: (context, index) {
              //           return Column(
              //             children: [
              //               customUploadButton(null),
              //               heigh10,
              //               SizedBox(
              //                 width: 115.sp,
              //                 height: 35.sp,
              //                 child: Center(
              //                   child: TextField(
              //                     decoration:
              //                         customInputDecoration('floor name'),
              //                   ),
              //                 ),
              //               ),
              //               heigh10,
              //               SizedBox(
              //                 width: 115.sp,
              //                 height: 35.sp,
              //                 child: Center(
              //                   child: TextField(
              //                     decoration: customInputDecoration('₹0.0'),
              //                   ),
              //                 ),
              //               )
              //             ],
              //           );
              //         }),
              // heigh10,
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     const Text(
              //       'Structure',
              //       style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              //     ),
              // SizedBox(
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.redAccent,
              //       shape: const StadiumBorder(),
              //     ),
              //     onPressed: () {
              //       setState(() {
              //         structureGridCount += 1;
              //       });
              //     },
              //     child: Row(
              //       children: [
              //         Text('Add', style: normal14),
              //         width10,
              //         Icon(
              //           Icons.add,
              //           size: 20.sp,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              //   ],
              // ),
              // heigh10,
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Column(
              //       children: [
              //         customUploadButton(null),
              //         heigh5,
              //         const Text('Foundation Plan'),
              //         heigh5,
              //         SizedBox(
              //           width: 115.sp,
              //           height: 35.sp,
              //           child: Center(
              //             child: TextField(
              //               controller: planingBasementController,
              //               decoration: customInputDecoration('₹0.0'),
              //             ),
              //           ),
              //         )
              //       ],
              //     ),
              //     Column(
              //       children: [
              //         customUploadButton(null),
              //         heigh5,
              //         const Text('Footing/File/Cap'),
              //         heigh5,
              //         SizedBox(
              //           width: 115.sp,
              //           height: 35.sp,
              //           child: Center(
              //             child: TextField(
              //               controller: planingBasementController,
              //               decoration: customInputDecoration('₹0.0'),
              //             ),
              //           ),
              //         )
              //       ],
              //     ),
              //     Column(
              //       children: [
              //         customUploadButton(null),
              //         heigh5,
              //         const Text('Tie Beam Plan'),
              //         heigh5,
              //         SizedBox(
              //           width: 115.sp,
              //           height: 35.sp,
              //           child: Center(
              //             child: TextField(
              //               controller: planingBasementController,
              //               decoration: customInputDecoration('₹0.0'),
              //             ),
              //           ),
              //         )
              //       ],
              //     ),
              //   ],
              // ),
              // planningGridCount == 0
              //     ? const SizedBox(
              //         width: 0,
              //         height: 0,
              //       )
              //     : GridView.builder(
              //         shrinkWrap: true,
              //         physics: const ScrollPhysics(),
              //         itemCount: structureGridCount,
              //         gridDelegate:
              //             const SliverGridDelegateWithFixedCrossAxisCount(
              //                 crossAxisCount: 3,
              //                 crossAxisSpacing: 8.0,
              //                 childAspectRatio: 0.6),
              //         itemBuilder: (context, index) {
              //           return Column(
              //             children: [
              //               customUploadButton(null),
              //               heigh10,
              //               SizedBox(
              //                 width: 115.sp,
              //                 height: 35.sp,
              //                 child: Center(
              //                   child: TextField(
              //                     decoration:
              //                         customInputDecoration('floor name'),
              //                   ),
              //                 ),
              //               ),
              //               heigh10,
              //               SizedBox(
              //                 width: 115.sp,
              //                 height: 35.sp,
              //                 child: Center(
              //                   child: TextField(
              //                     decoration: customInputDecoration('₹0.0'),
              //                   ),
              //                 ),
              //               )
              //             ],
              //           );
              //         }),
              // heigh10,
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     const Text(
              //       '2D Elevation',
              //       style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              //     ),
              // SizedBox(
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.redAccent,
              //       shape: const StadiumBorder(),
              //     ),
              //     onPressed: () {
              //       setState(() {
              //         elevationGridCount += 1;
              //       });
              //     },
              //     child: Row(
              //       children: [
              //         Text('Add', style: normal14),
              //         width10,
              //         Icon(
              //           Icons.add,
              //           size: 20.sp,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // ],
              // ),
              // heigh10,
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Column(
              //       children: [
              //         customUploadButton(null),
              //         heigh5,
              //         const Text('Front Side'),
              //         heigh5,
              //         const Text(
              //           '65,000',
              //           style: TextStyle(
              //               fontSize: 14, fontWeight: FontWeight.w600),
              //         ),
              //       ],
              //     ),
              //     Column(
              //       children: [
              //         customUploadButton(null),
              //         heigh5,
              //         const Text('Left Side'),
              //         heigh5,
              //         const Text(
              //           '56,888',
              //           style: TextStyle(
              //               fontSize: 14, fontWeight: FontWeight.w600),
              //         ),
              //       ],
              //     ),
              //     Column(
              //       children: [
              //         customUploadButton(null),
              //         heigh5,
              //         const Text('Left Side'),
              //         heigh5,
              //         const Text(
              //           '67,999',
              //           style: TextStyle(
              //               fontSize: 14, fontWeight: FontWeight.w600),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              // heigh10,
              // elevationGridCount == 0
              //     ? const SizedBox(
              //         width: 0,
              //         height: 0,
              //       )
              //     : GridView.builder(
              //         shrinkWrap: true,
              //         physics: const ScrollPhysics(),
              //         itemCount: elevationGridCount,
              //         gridDelegate:
              //             const SliverGridDelegateWithFixedCrossAxisCount(
              //                 crossAxisCount: 3,
              //                 crossAxisSpacing: 8.0,
              //                 childAspectRatio: 0.6),
              //         itemBuilder: (context, index) {
              //           return Column(
              //             children: [
              //               customUploadButton(null),
              //               heigh10,
              //               SizedBox(
              //                 width: 115.sp,
              //                 height: 35.sp,
              //                 child: Center(
              //                   child: TextField(
              //                     decoration: customInputDecoration('Side'),
              //                   ),
              //                 ),
              //               ),
              //               heigh10,
              //               SizedBox(
              //                 width: 115.sp,
              //                 height: 35.sp,
              //                 child: Center(
              //                   child: TextField(
              //                     decoration: customInputDecoration('₹0.0'),
              //                   ),
              //                 ),
              //               )
              //             ],
              //           );
              //         }),
              // heigh20,
              

              GestureDetector(
                child: SizedBox(
                  width: 60,
                  height: 35,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 255, 90, 95)),
                    ),
                    onPressed: () async {
                      final form1 = formKey1.currentState;
                      if (form1!.validate()) {
                        var userdata = await FirebaseFirestore.instance
                            .collection('ArchitectData')
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .get();
                        await getController.uploadDesignData(
                            FirebaseAuth.instance.currentUser!.uid,
                            projectDetailsController.text,
                            getController.ExteriorImageUrl[0]!,
                            getController.ExteriorImageUrl[1]!,
                            getController.ExteriorImageUrl[2]!,
                            getController.selectedDesignTypeindex == 0
                                ? 'Modern'
                                : getController.selectedDesignTypeindex == 1
                                    ? 'Classic'
                                    : 'Others',
                            selectedHouseFacing == 0
                                ? 'East'
                                : selectedHouseFacing == 1
                                    ? 'West'
                                    : selectedHouseFacing == 2
                                        ? 'South'
                                        : 'North',
                            selectedHouseFloor == 0
                                ? '1 FLoor'
                                : selectedHouseFloor == 1
                                    ? '2 FLoor'
                                    : 'Others',
                            HouseType[getController.selectedHouseType],
                            {
                              'length': plotLengthController.text,
                              'width': plotWidthController.text,
                              'area': totalAreaController.text,
                            },
                            accordingVastuController.text,
                            estimateCostControler.text,
                            approximateCostController.text,
                            getController.FloorImageUrl[0]!,
                            getController.FloorImageUrl[1]!,
                            getController.FloorImageUrl[2]!,
                            getController.planingImageUrl[0]!,
                            getController.planingImageUrl[1]!,
                            getController.planingImageUrl[2]!,
                            designpriceController.text,
                            shortDescriptionController.text,
                            userdata['name']);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Architectbottomnavigationbar(
                                      selectedindex: 0)),
                        );
                      }
                    },

                    child: const Text('Upload'),
                  ),
                ),
              ),
              heigh20,
            ],
          ),
        ),
      ),
    );
  }

  customTail(screenWidth, text, color) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.sp),
      width: screenWidth / 3 - 10,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(width: 1.sp, color: Colors.red),
        borderRadius: const BorderRadius.all(Radius.circular(50)),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 14.sp),
        ),
      ),
    );
  }

  customUploadButton(image) {
    return Container(
      // padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
      width: MediaQuery.of(context).size.width / 3.3,
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
                    image: FileImage(
                      File(image.path),
                    ),
                  )),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.cloud_upload_outlined,
                  color: Colors.grey,
                  size: 40.sp,
                ),
                Text(
                  'Upload your design',
                  style: TextStyle(fontSize: 6.0.sp, color: Colors.grey),
                ),
              ],
            ),
    );
  }
}
