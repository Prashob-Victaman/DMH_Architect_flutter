import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Constants/constants.dart';
import '../../../model/uploadDesignDataModel.dart';
import '../../productview/widget/productcorouselslider.dart';
import 'EditMyDesign/EditMyDesign.dart';

class ArchitectIndividualHomeDesign extends StatelessWidget {
  String designUid;

  ArchitectIndividualHomeDesign({super.key, required this.designUid});

  @override
  Widget build(BuildContext context) {
    final Screenwwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('DesignDataFromAdmin')
                  .doc(designUid)
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
                          Text(
                            '${designData.projectDetails}',
                            style: normal14,
                            textAlign: TextAlign.justify,
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
                              ProjectDescriptiontabs(
                                screenwidth: Screenwwidth,
                                subtitle: designData.designType,
                                title: 'Design Type',
                              ),
                              heigh5,
                              ProjectDescriptiontabs(
                                screenwidth: Screenwwidth,
                                subtitle: designData.houseType,
                                title: 'House Type',
                              ),
                              heigh5,
                              ProjectDescriptiontabs(
                                screenwidth: Screenwwidth,
                                subtitle: designData.houseFloors,
                                title: 'House Floor',
                              ),
                              heigh5,
                              GestureDetector(
                                onTap: () {
                                  editPopup(context);
                                },
                                child: ProjectDescriptiontabs(
                                  screenwidth: Screenwwidth,
                                  subtitle:
                                      '${designData.houseArea['length']} Ft',
                                  title: 'House Length(Depth)',
                                ),
                              ),
                              heigh5,
                              ProjectDescriptiontabs(
                                screenwidth: Screenwwidth,
                                subtitle: '${designData.houseArea['width']} Ft',
                                title: 'House Width(Front)',
                              ),
                              heigh5,
                              ProjectDescriptiontabs(
                                screenwidth: Screenwwidth,
                                subtitle:
                                    '${designData.houseArea['area']} Sqft',
                                title: 'Total House buildup area ',
                              ),
                              heigh5,
                              ProjectDescriptiontabs(
                                screenwidth: Screenwwidth,
                                subtitle:
                                    '${designData.estimatedConstructionCost}',
                                title: 'Estimated Construction Time',
                              ),
                              heigh5,
                              ProjectDescriptiontabs(
                                screenwidth: Screenwwidth,
                                subtitle:
                                    '₹ ${designData.aproximateConstructionCost}.00',
                                title: 'Aproximate Construction Cost',
                              ),
                              heigh5,
                              // ProjectDescriptiontabs(
                              //   screenwidth: Screenwwidth,
                              //   subtitle: '₹ ${designData.designprice}.00',
                              //   title: 'Design Price',
                              // ),
                              // heigh5,
                              // ProjectDescriptiontabs(
                              //   screenwidth: screenwidth,
                              //   subtitle: '2,123 Sqft.',
                              //   title: 'Plot Area',
                              // ),
                              // heigh5,
                              ProjectDescriptiontabs(
                                screenwidth: Screenwwidth,
                                subtitle: '${designData.accordingtoVastu} %',
                                title: 'According to Vastu',
                              ),
                              heigh5,
                              heigh20,
                              SizedBox(
                                width: Screenwwidth,
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
                          //   width: Screenwwidth - 30.w,
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

  editPopup(context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(0.w),
          title: SizedBox(
            height: 300.w,
            width: 350.w,
            child: Column(
              children: [
                Container(
                    alignment: Alignment.center,
                    height: 84.w,
                    child: Text(
                      'Are you sure you want to Submit?',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: kblackcolor,
                          fontWeight: FontWeight.bold),
                    )),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 35.w,
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          style: normal16,
                          // controller: codecontroller,
                          decoration: textdecoration(),
                        ),
                      ),
                      heigh20,
                      SizedBox(
                        height: 35.h,
                        width: double.maxFinite,
                        child: ElevatedButton(
                            onPressed: () async {
                              // Get.to(() => SignupScreen(mobilenumber: ,));
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
                            )),
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

  const ProjectDescriptiontabs(
      {super.key,
      required this.screenwidth,
      required this.title,
      required this.subtitle});

  final double screenwidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
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
            style: bold15,
          ),
          const Spacer(),
          Text(
            subtitle,
            style: normal15,
          )
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
      required this.Screenwwidth,
      required this.title,
      required this.subtitle});

  final double Screenwwidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.w), color: kashcolor),
      width: Screenwwidth - 30.w,
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
