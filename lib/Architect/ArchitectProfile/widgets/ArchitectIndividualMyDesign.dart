import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/widgets/EditMyDesign/editfloordetails.dart';
import 'package:dmh_architect/controller/myDesignsController.dart';
import 'package:dmh_architect/controller/upload%20design/ArchitectUploadDesignController.dart';
import 'package:dmh_architect/model/floorDetailsfromjson.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../Constants/constants.dart';
import '../../../model/uploadDesignDataModel.dart';
import '../../productview/widget/productcorouselslider.dart';
import 'EditMyDesign/EditMyDesign.dart';

class ArchitectIndividualHomeDesign extends StatefulWidget {
  String designUid;

  ArchitectIndividualHomeDesign({super.key, required this.designUid});

  @override
  State<ArchitectIndividualHomeDesign> createState() =>
      _ArchitectIndividualHomeDesignState();
}

class _ArchitectIndividualHomeDesignState
    extends State<ArchitectIndividualHomeDesign> {
  TextEditingController editingTextController = TextEditingController();

  final getmyDesignController = Get.put(myDesignController());

  final GetxController = Get.put(ArchitectUploadDesignController());

  @override
  Widget build(BuildContext context) {
    final screenwwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('DesignDataFromAdmin')
                  .doc(widget.designUid)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                designDataModel designData =
                    designDataModel.fromJson(snapshot.data);

                List designDataList = designData.floordetails;

                return ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0.w),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => Get.back(),
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 20.sp,
                                ),
                              ),
                              SizedBox(
                                width: 120.w,
                              ),
                              Text(
                                'My Designs',
                                style: bold18,
                              ),
                            ],
                          ),
                          heigh10,
                        ],
                      ),
                    ),
                    ProductCarouselslider(DesignData: designData),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          heigh10,
                          Text(
                            '${designData.designType} ${designData.houseType}',
                            style: bold20,
                          ),
                          heigh10,
                          GestureDetector(
                            onTap: () {
                              editPopup(
                                  context,
                                  'Project Details',
                                  'projectDetails',
                                  designData.projectDetails,
                                  TextInputType.name);
                            },
                            child: Text(
                              '${designData.projectDetails}',
                              style: normal14,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          heigh10,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Project Description',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold,
                                  color: kprimarycolor,
                                ),
                              ),
                              heigh5,
                              GestureDetector(
                                onTap: () {
                                  typeEditPopup(
                                      context,
                                      'Design Type',
                                      'designType',
                                      designData.designType,
                                      getmyDesignController.designTypeList);
                                },
                                child: ProjectDescriptiontabs(
                                  editable: true,
                                  screenwidth: screenwwidth,
                                  subtitle: designData.designType,
                                  title: 'Design Type',
                                ),
                              ),
                              heigh5,
                              GestureDetector(
                                onTap: () {
                                  typeEditPopup(
                                      context,
                                      'House Type',
                                      'houseType',
                                      designData.houseType,
                                      getmyDesignController.housedesignname);
                                },
                                child: ProjectDescriptiontabs(
                                  editable: true,
                                  screenwidth: screenwwidth,
                                  subtitle: designData.houseType,
                                  title: 'House Type',
                                ),
                              ),
                              heigh5,
                              ProjectDescriptiontabs(
                                editable: false,
                                screenwidth: screenwwidth,
                                subtitle: designData.houseFloors,
                                title: 'House Floor',
                              ),
                              heigh5,
                              GestureDetector(
                                onTap: () {
                                  // editPopup(context, 'House Length(Depth)', 'accordingtoVastu');

                                  areaEditPopup(
                                      context,
                                      'House Length(Depth)',
                                      'length',
                                      designData.houseArea['length'],
                                      designData.houseArea['width']);
                                },
                                child: ProjectDescriptiontabs(
                                  editable: true,
                                  screenwidth: screenwwidth,
                                  subtitle:
                                      '${designData.houseArea['length']} Ft',
                                  title: 'House Length(Depth)',
                                ),
                              ),
                              heigh5,
                              GestureDetector(
                                onTap: () {
                                  areaEditPopup(
                                      context,
                                      'House Width(Front)',
                                      'width',
                                      designData.houseArea['width'],
                                      designData.houseArea['length']);
                                },
                                child: ProjectDescriptiontabs(
                                  editable: true,
                                  screenwidth: screenwwidth,
                                  subtitle:
                                      '${designData.houseArea['width']} Ft',
                                  title: 'House Width(Front)',
                                ),
                              ),
                              heigh5,
                              ProjectDescriptiontabs(
                                editable: false,
                                screenwidth: screenwwidth,
                                subtitle:
                                    '${designData.houseArea['area']} Sqft',
                                title: 'Total House buildup area ',
                              ),
                              heigh5,
                              GestureDetector(
                                onTap: () {
                                  editPopup(
                                      context,
                                      'Estimated Construction Time',
                                      'estimatedConstructionCost',
                                      designData.estimatedConstructionCost,
                                      TextInputType.name);
                                },
                                child: ProjectDescriptiontabs(
                                  editable: true,
                                  screenwidth: screenwwidth,
                                  subtitle:
                                      '${designData.estimatedConstructionCost}',
                                  title: 'Estimated Construction Time',
                                ),
                              ),
                              heigh5,
                              GestureDetector(
                                onTap: () {
                                  editPopup(
                                      context,
                                      'Aproximate Construction Cost',
                                      'aproximateConstructionCost',
                                      designData.aproximateConstructionCost,
                                      TextInputType.number);
                                },
                                child: ProjectDescriptiontabs(
                                  editable: true,
                                  screenwidth: screenwwidth,
                                  subtitle:
                                      '₹ ${designData.aproximateConstructionCost}.00',
                                  title: 'Aproximate Construction Cost',
                                ),
                              ),
                              heigh5,
                              // ProjectDescriptiontabs(editable: true,
                              //   screenwidth: screenwwidth,
                              //   subtitle: '₹ ${designData.designprice}.00',
                              //   title: 'Design Price',
                              // ),
                              // heigh5,
                              // ProjectDescriptiontabs(editable: true,
                              //   screenwidth: screenwidth,
                              //   subtitle: '2,123 Sqft.',
                              //   title: 'Plot Area',
                              // ),
                              // heigh5,
                              GestureDetector(
                                onTap: () {
                                  editPopup(
                                      context,
                                      'House Length(Depth)',
                                      'accordingtoVastu',
                                      designData.accordingtoVastu,
                                      TextInputType.number);
                                },
                                child: ProjectDescriptiontabs(
                                  editable: true,
                                  screenwidth: screenwwidth,
                                  subtitle: '${designData.accordingtoVastu} %',
                                  title: 'According to Vastu',
                                ),
                              ),
                              heigh5,

                              heigh10,
                              // EditFloorDetails(),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Floor Details',
                                    style: TextStyle(
                                      // decoration: TextDecoration.underline,ca
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.bold,
                                      color: kprimarycolor,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        GetxController.createdlistofitems
                                            .clear();

                                        GetxController.createdlistofitems =
                                            designData.floordetails;

                                        Get.to(() => EditFloorDetails(
                                              designUid: widget.designUid,
                                            ));
                                      },
                                      icon: Icon(
                                        Icons.edit_square,
                                        size: 25.w,
                                      ))
                                ],
                              ),
                              heigh10,
                              ListView.separated(
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    var designDatfrommap =
                                        FloorDeatails.fromJson(
                                            designDataList[index]);

                                    // print(designDatfrommap.floor);
                                    return Container(
                                      decoration: const BoxDecoration(),
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w),
                                            alignment: Alignment.centerLeft,
                                            height: 40.w,
                                            width: screenwwidth - 20,
                                            decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                        255, 253, 173, 176)
                                                    .withOpacity(0.5),
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10.w),
                                                    topRight:
                                                        Radius.circular(10.w))),
                                            child: Text(
                                              '${designDatfrommap.datazero![0]}',
                                              style: TextStyle(
                                                  fontSize: 17.w,
                                                  fontWeight: FontWeight.bold,
                                                  color: kprimarycolor),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(10.w),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        bottom: Radius.circular(
                                                            10.w)),
                                                color: const Color.fromARGB(
                                                        255, 253, 173, 176)
                                                    .withOpacity(0.2)),
                                            child: ListView.separated(
                                                shrinkWrap: true,
                                                physics: const ScrollPhysics(),
                                                itemBuilder: (context, index) {
                                                  return Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            height: 15.w,
                                                            width: 15.w,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(15
                                                                            .w),
                                                                border: Border.all(
                                                                    color:
                                                                        kprimarycolor)),
                                                          ),
                                                          width10,
                                                          Text(
                                                              '${designDatfrommap.dataone![index]} - ${designDatfrommap.datatwo![index]}',
                                                              style: normal16)
                                                        ],
                                                      ),
                                                      heigh10,
                                                    ],
                                                  );
                                                },
                                                separatorBuilder:
                                                    (context, index) {
                                                  return SizedBox(
                                                    height: 10.w,
                                                  );
                                                },
                                                itemCount: designDatfrommap
                                                    .dataone!.length),
                                          ),
                                          heigh10
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox();
                                  },
                                  itemCount: designDataList.length),
                              heigh20,

                              SizedBox(
                                width: screenwwidth,
                                child: EditMyDesign(
                                  designData: designData,
                                ),
                              )
                            ],
                          ),
                          // Container(
                          //   alignment: Alignment.center,
                          //   decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(10.w),
                          //       color: kprimarycolor),
                          //   height: 40.w,
                          //   width: screenwwidth - 30.w,
                          //   child: Text(
                          //     'Edit Design',
                          //     style: TextStyle(fontSize: 18.w, color: kwhitecolor),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                );
              })),
    );
  }

  editPopup(context, title, field, currentValue, TextInputType keyboardType) {
    final screenwwidth = MediaQuery.of(context).size.width;

    editingTextController.text = currentValue;
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(0.w),
          title: SizedBox(
            // height: 300.w,
            width: 350.w,
            child: Column(
              children: [
                Container(
                    alignment: Alignment.center,
                    height: 84.w,
                    child: Text(
                      'Enter $title',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: kblackcolor,
                          fontWeight: FontWeight.bold),
                    )),
                // const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 35.w,
                        child: TextFormField(
                          keyboardType: keyboardType,
                          style: normal16,
                          controller: editingTextController,
                          decoration: textdecoration(),
                        ),
                      ),
                      heigh20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 35.h,
                            width: screenwwidth * .33,
                            child: ElevatedButton(
                                onPressed: () async {
                                  // Get.to(() => SignupScreen(mobilenumber: ,));
                                  Get.back();
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.w),
                                  ),
                                  backgroundColor: kprimarycolor,
                                  foregroundColor: kwhitecolor,
                                ),
                                child: Text(
                                  'Cancel',
                                  style: bold15,
                                )),
                          ),
                          SizedBox(
                            height: 35.h,
                            width: screenwwidth * .33,
                            child: ElevatedButton(
                              onPressed: () async {
                                // Get.to(() => SignupScreen(mobilenumber: ,));

                                // print(designUid);

                                if (editingTextController.text.isNotEmpty) {
                                  DocumentReference userDocRef =
                                      FirebaseFirestore.instance
                                          .collection('DesignDataFromAdmin')
                                          .doc(widget.designUid);

                                  userDocRef.update({
                                    field: editingTextController.text,
                                  });

                                  Get.back();
                                } else {
                                  Fluttertoast.showToast(
                                      msg: 'Please fill the field');
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.w),
                                ),
                                backgroundColor: kprimarycolor,
                                foregroundColor: kwhitecolor,
                              ),
                              child: Text(
                                'Submit',
                                style: bold15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                heigh20
              ],
            ),
          ),
        );
      },
    );
  }

  areaEditPopup(context, title, field, currentValue, otherValue) {
    final screenwwidth = MediaQuery.of(context).size.width;

    editingTextController.text = currentValue;

    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(0.w),
          title: SizedBox(
            // height: 300.w,
            width: 350.w,
            child: Column(
              children: [
                Container(
                    alignment: Alignment.center,
                    height: 84.w,
                    child: Text(
                      'Enter $title',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: kblackcolor,
                          fontWeight: FontWeight.bold),
                    )),
                // const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 35.w,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          style: normal16,
                          controller: editingTextController,
                          decoration: textdecoration(),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      heigh20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 35.h,
                            width: screenwwidth * .33,
                            child: ElevatedButton(
                                onPressed: () async {
                                  // Get.to(() => SignupScreen(mobilenumber: ,));
                                  Get.back();
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.w),
                                  ),
                                  backgroundColor: kprimarycolor,
                                  foregroundColor: kwhitecolor,
                                ),
                                child: Text(
                                  'Cancel',
                                  style: bold15,
                                )),
                          ),
                          SizedBox(
                            height: 35.h,
                            width: screenwwidth * .33,
                            child: ElevatedButton(
                              onPressed: () async {
                                // Get.to(() => SignupScreen(mobilenumber: ,));

                                // print(designUid);

                                var houseArea =
                                    int.parse(editingTextController.text) *
                                        int.parse(otherValue);

                                if (editingTextController.text.isNotEmpty) {
                                  DocumentReference userDocRef =
                                      FirebaseFirestore.instance
                                          .collection('DesignDataFromAdmin')
                                          .doc(widget.designUid);

                                  userDocRef.update({
                                    'houseArea.area': houseArea.toString(),
                                    'houseArea.$field':
                                        editingTextController.text
                                  });

                                  Get.back();
                                } else {
                                  Fluttertoast.showToast(
                                      msg: 'Please fill the field');
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.w),
                                ),
                                backgroundColor: kprimarycolor,
                                foregroundColor: kwhitecolor,
                              ),
                              child: Text(
                                'Submit',
                                style: bold15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                heigh20
              ],
            ),
          ),
        );
      },
    );
  }

  //
  typeEditPopup(context, title, field, currentValue, var itemList) {
    final screenwwidth = MediaQuery.of(context).size.width;

    getmyDesignController.selectedDesignType = currentValue;

    print(itemList);
    print(getmyDesignController.selectedDesignType);

    // String selectedDesignType = 'Simplex';

    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(0.w),
          title: SizedBox(
            // height: 300.w,
            width: 350.w,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 84.w,
                  child: Text(
                    'Select $title',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: kblackcolor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                // const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      GetBuilder<myDesignController>(builder: (getData) {
                        return Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.w),
                              color: kashcolor),
                          height: 35.w,
                          width: screenwwidth * 0.68,
                          child: DropdownButton(
                            underline: const SizedBox(),
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: kblackcolor,
                                fontWeight: FontWeight.bold),
                            value: getmyDesignController.selectedDesignType,
                            icon: Icon(Icons.keyboard_arrow_down, size: 20.sp),
                            items: itemList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              getmyDesignController.changeDropdownValue(value);
                            },
                          ),
                        );
                      }),
                      heigh20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 35.h,
                            width: screenwwidth * .33,
                            child: ElevatedButton(
                                onPressed: () async {
                                  // Get.to(() => SignupScreen(mobilenumber: ,));
                                  Get.back();
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.w),
                                  ),
                                  backgroundColor: kprimarycolor,
                                  foregroundColor: kwhitecolor,
                                ),
                                child: Text(
                                  'Cancel',
                                  style: bold15,
                                )),
                          ),
                          SizedBox(
                            height: 35.h,
                            width: screenwwidth * .33,
                            child: ElevatedButton(
                              onPressed: () async {
                                DocumentReference userDocRef = FirebaseFirestore
                                    .instance
                                    .collection('DesignDataFromAdmin')
                                    .doc(widget.designUid);

                                userDocRef.update({
                                  field:
                                      getmyDesignController.selectedDesignType
                                });
                                Get.back();

                                setState(() {});
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.w),
                                ),
                                backgroundColor: kprimarycolor,
                                foregroundColor: kwhitecolor,
                              ),
                              child: Text(
                                'Submit',
                                style: bold15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                heigh20,
              ],
            ),
          ),
        );
      },
    );
  }

  //
  InputDecoration textdecoration() {
    return InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          // vertical: 13.0,
          horizontal: 10.0,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            width: 1.w,
            color: kblackcolor,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            width: 1.w,
            color: kblackcolor,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        labelStyle: TextStyle(fontSize: 12.sp, color: kyellowcolor),
        errorStyle: TextStyle(fontSize: 12.sp, color: kyellowcolor),
        hintText: 'Enter Text',
        hintStyle:
            TextStyle(fontSize: 15.sp, color: kblackcolor.withOpacity(0.8)));
  }
}

class ProjectDescriptiontabs extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool editable;

  const ProjectDescriptiontabs(
      {super.key,
      required this.screenwidth,
      required this.title,
      required this.subtitle,
      required this.editable});

  final double screenwidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.w),
        color: kashcolor,
      ),
      width: screenwidth - 10.w,
      height: 30.w,
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Text(
            subtitle,
            style: TextStyle(fontSize: 12.sp),
          ),
          width5,
          editable == true
              ? Icon(
                  Icons.edit_square,
                  size: 15.sp,
                )
              : const SizedBox()
        ],
      ),
    );
  }
}

class lisstobjects extends StatelessWidget {
  final String title;
  final String subtitle;

  const lisstobjects(
      {super.key,
      required this.screenwwidth,
      required this.title,
      required this.subtitle});

  final double screenwwidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.w), color: kashcolor),
      width: screenwwidth - 30.w,
      child: Row(
        children: [
          Text(
            title,
            style: bold13,
          ),
          const Spacer(),
          Text(
            subtitle,
            style: normal14,
          )
        ],
      ),
    );
  }
}
