import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmh_architect/Architect/Architectbottomnavigationbar/Architectbottomnavigationbar.dart';
import 'package:dmh_architect/controller/ArchitectformController.dart';
import 'package:dmh_architect/controller/ServicerateController.dart';
import 'package:dmh_architect/model/architectmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Constants/constants.dart';

class ProfileServiceRate extends StatefulWidget {
  ProfileServiceRate({Key? key}) : super(key: key);

  @override
  State<ProfileServiceRate> createState() => _ProfileServiceRateState();

  final formKeyServiceRate = GlobalKey<FormState>();

  final getXcontroller = Get.put(ServicerateController());
  final getformcontroller = Get.put(ArchitectformController());
}

class _ProfileServiceRateState extends State<ProfileServiceRate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: widget.formKeyServiceRate,
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Back')),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Service Rate',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                heigh10,
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("ArchitectData")
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      return ListView.separated(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemBuilder: (context, primaryindex) {
                            if (snapshot.hasError) {
                              return SizedBox(
                                height: 19.w,
                              );
                            }
                            if (!snapshot.hasData) {
                              return Center(
                                  child: SizedBox(
                                height: 19.w,
                              ));
                            }
                            final data =
                                ArchitectsignupData.fromJson(snapshot.data!);

                            Map serviceRateTypemap = data.serviceRateTypeList;


                            List<MapEntry> mapEntries = serviceRateTypemap.entries.toList();

                            log(mapEntries[0].value.toString());

                            // List<List> serviceRateTypelist = serviceRateTypemap.map((number) => number).toList();


                            // print(serviceRateTypeList);
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0.w),
                                border: Border.all(
                                    color: Colors.black12,
                                    style: BorderStyle.solid,
                                    width: 1.w),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(12.0.w),
                                child: Column(
                                  children: [
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        height: 40,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                25.w,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        decoration: customBoxDecoration(),
                                        child: Text(
                                          serviceType[primaryindex],
                                          style: bold15,
                                        )),
                                    heigh10,
                                    GetBuilder<ServicerateController>(
                                        builder: (getdata) {
                                      return ListView.separated(
                                          shrinkWrap: true,
                                          physics: const ScrollPhysics(),
                                          itemBuilder: (context, index) {


                                            
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  height: 40.w,
                                                  width: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2 -
                                                      55.w,
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10.0),
                                                  decoration:
                                                      customBoxDecoration(),
                                                  child: DropdownButton(
                                                    value:
                                                        selctedserviceRateMainList[
                                                                primaryindex]
                                                            [index],
                                                    underline: const SizedBox(),
                                                    items: widget.getXcontroller
                                                        .desiignType
                                                        .map((value) =>
                                                            DropdownMenuItem(
                                                              value: value,
                                                              child:
                                                                  Text(value),
                                                            ))
                                                        .toList(),
                                                    onChanged: (value) {
                                                      selctedserviceRateMainList[
                                                              primaryindex]
                                                          [index] = value!;
                                                      setState(() {});
                                                    },

                                                    // onChanged: (newValue) {
                                                    //   // Update the list value in the map when the dropdown selection changes
                                                    //   selctedserviceRateMainListmap
                                                    //       .update(serviceType[primaryindex],
                                                    //           (value) => [newValue]);
                                                    //   setState(() {});
                                                    // },
                                                    isExpanded: true,
                                                  ),
                                                ),
                                                Container(
                                                  color: kashcolor
                                                      .withOpacity(0.5),
                                                  width: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2 -
                                                      45.w,
                                                  height: 40.w,
                                                  child: TextFormField(
                                                    textAlignVertical:
                                                        TextAlignVertical
                                                            .center,
                                                    controller: widget
                                                            .getXcontroller
                                                            .servicerateTextController[
                                                        primaryindex][index],
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                        errorBorder:
                                                            const OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  width: 1,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          255,
                                                                          0,
                                                                          0)),
                                                        ),
                                                        errorStyle: TextStyle(
                                                            height: 0,
                                                            color: Colors
                                                                .transparent,
                                                            fontSize: 1.sp),
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                          // vertical: 10.0.w,
                                                          horizontal: 10.0.w,
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color:
                                                                kprimarycolor,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        hintText:
                                                            'Enter Amount',
                                                        hintStyle: TextStyle(
                                                            fontSize: 16.sp,
                                                            color: kgreycolor)),
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return '';
                                                      }

                                                      return null;
                                                    },
                                                  ),
                                                ),
                                                index == 0
                                                    ? SizedBox(
                                                        width: 30.w,
                                                        child: IconButton(
                                                          onPressed: () {
                                                            widget
                                                                .getXcontroller
                                                                .servicerateTextController[
                                                                    primaryindex]
                                                                .add(
                                                                    TextEditingController());
                                                            widget
                                                                .getXcontroller
                                                                .changeserviceTypeCountfunction(
                                                                    primaryindex);
                                                          },
                                                          icon: Icon(Icons.add,
                                                              size: 20.sp),
                                                        ),
                                                      )
                                                    : index ==
                                                            selctedserviceRateMainList[
                                                                        primaryindex]
                                                                    .length -
                                                                1
                                                        ? SizedBox(
                                                            width: 30.w,
                                                            child: IconButton(
                                                              onPressed: () {
                                                                widget
                                                                    .getXcontroller
                                                                    .removeserviceTypeCountfunction(
                                                                        primaryindex);

                                                                widget
                                                                    .getXcontroller
                                                                    .servicerateTextController[
                                                                        primaryindex]
                                                                    .removeLast();
                                                                print(widget
                                                                    .getXcontroller
                                                                    .servicerateTextController[
                                                                        primaryindex]
                                                                    .length);
                                                              },
                                                              icon: Icon(
                                                                Icons.delete,
                                                                size: 20.sp,
                                                              ),
                                                            ),
                                                          )
                                                        : SizedBox(
                                                            width: 30.w,
                                                            child: IconButton(
                                                              onPressed: () {},
                                                              icon: Icon(
                                                                  Icons.delete,
                                                                  size: 20.sp,
                                                                  color:
                                                                      kwhitecolor),
                                                            ),
                                                          )
                                              ],
                                            );
                                          },
                                          separatorBuilder: (context, index) {
                                            return heigh10;
                                          },
                                          itemCount: selctedserviceRateMainList[
                                                  primaryindex]
                                              .length);
                                    }),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return heigh10;
                          },
                          itemCount: 10);
                    }),
                heigh20,
                SizedBox(
                  height: 40.w,
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        width: 143,
        height: 35,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 255, 90, 95)),
          ),
          onPressed: () {
            final form = widget.formKeyServiceRate.currentState;

            if (form!.validate()) {
              List<List<String>> serviceAmountList =
                  List.generate(10, (_) => []);

              for (int i = 0; i < 10; i++) {
                widget.getXcontroller.servicerateTextController[i]
                    .forEach((element) {
                  serviceAmountList[i].add(element.text);
                });
              }

              Map selctedserviceRateAmounrtMainListmap = {
                "Planning": serviceAmountList[0],
                'Structure': serviceAmountList[1],
                '2D Elevation': serviceAmountList[2],
                '3D Elevation': serviceAmountList[3],
                '3D Floor': serviceAmountList[4],
                'Walkthrough Video(Exterior)': serviceAmountList[5],
                'Walkthrough Video(Interior & Exterior)': serviceAmountList[6],
                'Electricals': serviceAmountList[7],
                'Plumbing': serviceAmountList[8],
                'Site Supervision': serviceAmountList[9],
              };

              log(selctedserviceRateAmounrtMainListmap.toString());
              log(selctedserviceRateMainListmap.toString());

              widget.getformcontroller.addServicerateDetails(
                  FirebaseAuth.instance.currentUser!.uid,
                  selctedserviceRateMainListmap,
                  selctedserviceRateAmounrtMainListmap);

              Get.offAll(Architectbottomnavigationbar(
                selectedindex: 0,
              ));
            }
          },
          child: const Text('Update'),
        ),
      ),
    );
  }
}
