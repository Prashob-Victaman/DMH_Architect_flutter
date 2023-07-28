import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmh_architect/Architect/Architectbottomnavigationbar/Architectbottomnavigationbar.dart';
import 'package:dmh_architect/Constants/constants.dart';
import 'package:dmh_architect/controller/ArchitectformController.dart';
import 'package:dmh_architect/controller/ServicerateController.dart';
import 'package:dmh_architect/model/servicelistmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileServicesUpdated extends StatelessWidget {
  ProfileServicesUpdated({super.key});

  final formKeyServiceRate = GlobalKey<FormState>();

  List modernMinimumAmount = [2, 2, 1.5, 2, 2, 1.5, 3, 3, 3, 50];

  List classicalMinimumAmount = [3, 2, 2, 2, 2, 2, 3, 3, 5, 50];

  final getXcontroller = Get.put(ServicerateController());
  final getformcontroller = Get.put(ArchitectformController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("ArchitectData")
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, snapshot) {
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

              final serviceRateData = ServiceListModel.fromJson(
                  snapshot.data!['serviceRateamountList']);

              List serviceRateDataList = [
                serviceRateData.FloorPlan,
                serviceRateData.StructuralDrawing,
                serviceRateData.ThreeDFrontElevation,
                serviceRateData.TwoDFrontElevation,
                serviceRateData.ThreeDFloorPlan,
                serviceRateData.WorkingDrawing,
                serviceRateData.ElectricalPlan,
                serviceRateData.PlumbingPlan,
                serviceRateData.WalkthoughVideo,
                serviceRateData.SiteSupervision
              ];

              getXcontroller.serviceRateDataListEditing = serviceRateDataList;

              // print(serviceRateDataList);

              //                 List weightData =
              // serviceRateData.entries.map( (entry) => Weight(entry.key, entry.value)).toList();

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKeyServiceRate,
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
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      heigh10,
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemBuilder: (context, primaryindex) {
                            // print(
                            //     '${serviceRateDataList[primaryindex]['classic']['isSelected']} $primaryindex classic');

                            // print(
                            //     '${serviceRateDataList[primaryindex]['modern']['isSelected']} $primaryindex modern');

                            getXcontroller.modernControllerList[primaryindex]
                                .text = getXcontroller
                                    .serviceRateDataListEditing[primaryindex]
                                ['modern']['price'];

                            getXcontroller.classicalControllerList[primaryindex]
                                .text = getXcontroller
                                    .serviceRateDataListEditing[primaryindex]
                                ['classic']['price'];
                            // final indexwiseData =
                            //     getXcontroller.serviceRateMainlist[primaryindex].values;
                            // print(getXcontroller.serviceRateMainlist[primaryindex]);

                            // print(indexwiseData);

                            // var datalisttomap = indexwiseData.entries.toList();

                            // List dataList = datalisttomap[primaryindex].value;

                            // log(serviceRateData.${modelNameList[Index]});

                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0.w),
                                border: Border.all(
                                    color: Colors.black12,
                                    style: BorderStyle.solid,
                                    width: 1.w),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom: 12.0.w, top: 12.0.w, left: 12.0.w),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          height: 40,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              85.w,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          decoration: customBoxDecoration(),
                                          child: Text(
                                            serviceListItems[primaryindex],
                                            style: bold15,
                                          ),
                                        ),
                                        width5,
                                        GetBuilder<ServicerateController>(
                                            builder: (context) {
                                          return SizedBox(
                                            height: 20.w,
                                            child: Checkbox(
                                              fillColor:
                                                  const MaterialStatePropertyAll(
                                                      kprimarycolor),
                                              value: getXcontroller
                                                      .serviceRateDataListEditing[
                                                  primaryindex]['isSelected'],

                                              // getXcontroller
                                              //         .serviceSelectedBoolList[
                                              //     primaryindex],
                                              onChanged: (value) {
                                                getXcontroller
                                                    .changeserviceRateDataListEditing(
                                                        primaryindex);
                                              },
                                            ),
                                          );
                                        })
                                      ],
                                    ),
                                    GetBuilder<ServicerateController>(
                                      builder: (getdata) {
                                        if (getXcontroller
                                                    .serviceRateDataListEditing[
                                                primaryindex]['isSelected'] ==
                                            false) {
                                          return const SizedBox();
                                        } else {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              heigh10,
                                              ListView.separated(
                                                  shrinkWrap: true,
                                                  physics:
                                                      const ScrollPhysics(),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Row(children: [
                                                      Container(
                                                          alignment: Alignment
                                                              .center,
                                                          height: 40.w,
                                                          width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  2 -
                                                              55.w,
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10.0.w),
                                                          decoration:
                                                              customBoxDecoration(),
                                                          child: Text(
                                                              getXcontroller
                                                                      .designType[
                                                                  index])),
                                                      width10,
                                                      Container(
                                                        color: kashcolor
                                                            .withOpacity(0.5),
                                                        width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                2 -
                                                            45.w,
                                                        height: 40.w,
                                                        child: index == 0
                                                            ? (getXcontroller.serviceRateDataListEditing[primaryindex]
                                                                        [
                                                                        'modern']
                                                                    [
                                                                    'isSelected']
                                                                ? TextFormField(
                                                                    textAlignVertical:
                                                                        TextAlignVertical
                                                                            .center,
                                                                    controller: index ==
                                                                            0
                                                                        ? getXcontroller.modernControllerList[
                                                                            primaryindex]
                                                                        : getXcontroller.classicalControllerList[
                                                                            primaryindex],
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .number,
                                                                    decoration: InputDecoration(
                                                                        errorBorder: OutlineInputBorder(borderSide: BorderSide(width: 1.w, color: kredcolor)),
                                                                        errorStyle: TextStyle(height: 0, color: Colors.transparent, fontSize: 1.sp),
                                                                        contentPadding: EdgeInsets.symmetric(
                                                                            // vertical: 10.0.w,
                                                                            horizontal: 10.0.w),
                                                                        border: OutlineInputBorder(borderSide: const BorderSide(color: kprimarycolor), borderRadius: BorderRadius.circular(5.w)),
                                                                        hintText: 'Min Rs ${modernMinimumAmount[primaryindex]}/SqFt',
                                                                        hintStyle: TextStyle(fontSize: 13.sp, color: kgreycolor)),
                                                                    validator: (value) {
                                                                      if (value!
                                                                          .isEmpty) {
                                                                        return '';
                                                                      }

                                                                      return null;
                                                                    })
                                                                : const SizedBox())
                                                            : getXcontroller.serviceRateDataListEditing[primaryindex]['classic']['isSelected']
                                                                ? TextFormField(
                                                                    textAlignVertical: TextAlignVertical.center,
                                                                    controller: index == 0 ? getXcontroller.modernControllerList[primaryindex] : getXcontroller.classicalControllerList[primaryindex],
                                                                    keyboardType: TextInputType.number,
                                                                    decoration: InputDecoration(
                                                                        errorBorder: OutlineInputBorder(borderSide: BorderSide(width: 1.w, color: kredcolor)),
                                                                        errorStyle: TextStyle(height: 0, color: Colors.transparent, fontSize: 1.sp),
                                                                        contentPadding: EdgeInsets.symmetric(
                                                                            // vertical: 10.0.w,
                                                                            horizontal: 10.0.w),
                                                                        border: OutlineInputBorder(
                                                                            borderSide: const BorderSide(
                                                                              color: kprimarycolor,
                                                                            ),
                                                                            borderRadius: BorderRadius.circular(5.w)),
                                                                        hintText: 'Min Rs ${classicalMinimumAmount[index]}/SqFt',
                                                                        hintStyle: TextStyle(fontSize: 13.sp, color: kgreycolor)),
                                                                    validator: (value) {
                                                                      if (value!
                                                                          .isEmpty) {
                                                                        return '';
                                                                      }

                                                                      return null;
                                                                    })
                                                                : const SizedBox(),
                                                      ),
                                                      SizedBox(
                                                          height: 20.w,
                                                          child: Checkbox(
                                                              value: index == 0
                                                                  ? getXcontroller
                                                                              .serviceRateDataListEditing[primaryindex]
                                                                          [
                                                                          'modern']
                                                                      [
                                                                      'isSelected']
                                                                  : getXcontroller
                                                                              .serviceRateDataListEditing[primaryindex]
                                                                          [
                                                                          'classic']
                                                                      [
                                                                      'isSelected'],

                                                              // value: index == 0 ? getXcontroller.modernSelectedBoolList[primaryindex] : getXcontroller.classicalSelectedBoolList[primaryindex],
                                                              fillColor:
                                                                  const MaterialStatePropertyAll(
                                                                      kblackcolor),
                                                              onChanged:
                                                                  (value) {
                                                                index == 0
                                                                    ? getXcontroller
                                                                        .changeModernserviceRateDataListEditing(
                                                                            primaryindex)
                                                                    : getXcontroller
                                                                        .changeclassicalserviceRateDataListEditing(
                                                                            primaryindex);
                                                              }))
                                                    ]);
                                                  },
                                                  separatorBuilder:
                                                      (context, index) {
                                                    return SizedBox(
                                                      height: 10.w,
                                                    );
                                                  },
                                                  itemCount: 2)
                                            ],
                                          );
                                        }
                                      },
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return heigh10;
                          },
                          itemCount: 10),
                      heigh20,
                      SizedBox(
                        height: 40.w,
                      )
                    ],
                  ),
                ),
              );
            },
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
                  final form = formKeyServiceRate.currentState;

                  if (form!.validate()) {
                    List<List<String>> serviceAmountList =
                        List.generate(10, (_) => []);

                    // for (int i = 0; i < 10; i++) {
                    //   getXcontroller.servicerateTextController[i].forEach((element) {
                    //     serviceAmountList[i].add(element.text);
                    //   });
                    // }

                    Map selctedserviceRateAmounrtMainListmap = {
                      "Floor Plan": {
                        'isSelected': getXcontroller
                            .serviceRateDataListEditing[0]['isSelected'],
                        'modern': {
                          'isSelected':
                              getXcontroller.serviceRateDataListEditing[0]
                                  ['modern']['isSelected'],
                          'price': getXcontroller.modernControllerList[0].text,
                        },
                        'classic': {
                          'isSelected':
                              getXcontroller.serviceRateDataListEditing[0]
                                  ['classic']['isSelected'],
                          'price':
                              getXcontroller.classicalControllerList[0].text,
                        },
                      },
                      'Structural Drawing': {
                        'isSelected': getXcontroller
                            .serviceRateDataListEditing[1]['isSelected'],
                        'modern': {
                          'isSelected':
                              getXcontroller.serviceRateDataListEditing[1]
                                  ['modern']['isSelected'],
                          'price': getXcontroller.modernControllerList[1].text,
                        },
                        'classic': {
                          'isSelected':
                              getXcontroller.serviceRateDataListEditing[1]
                                  ['classic']['isSelected'],
                          'price':
                              getXcontroller.classicalControllerList[1].text,
                        },
                      },
                      '3D Front Elevation': {
                        'isSelected': getXcontroller
                            .serviceRateDataListEditing[2]['isSelected'],
                        'modern': {
                          'isSelected':
                              getXcontroller.serviceRateDataListEditing[2]
                                  ['modern']['isSelected'],
                          'price': getXcontroller.modernControllerList[2].text,
                        },
                        'classic': {
                          'isSelected':
                              getXcontroller.serviceRateDataListEditing[2]
                                  ['classic']['isSelected'],
                          'price':
                              getXcontroller.classicalControllerList[2].text,
                        },
                      },
                      '2D Front Elevation': {
                        'isSelected': getXcontroller
                            .serviceRateDataListEditing[3]['isSelected'],
                        'modern': {
                          'isSelected':
                              getXcontroller.serviceRateDataListEditing[3]
                                  ['modern']['isSelected'],
                          'price': getXcontroller.modernControllerList[3].text,
                        },
                        'classic': {
                          'isSelected':
                              getXcontroller.serviceRateDataListEditing[3]
                                  ['classic']['isSelected'],
                          'price':
                              getXcontroller.classicalControllerList[3].text,
                        },
                      },
                      '3D Floor Plan': {
                        'isSelected': getXcontroller
                            .serviceRateDataListEditing[4]['isSelected'],
                        'modern': {
                          'isSelected':
                              getXcontroller.serviceRateDataListEditing[4]
                                  ['modern']['isSelected'],
                          'price': getXcontroller.modernControllerList[4].text,
                        },
                        'classic': {
                          'isSelected':
                              getXcontroller.serviceRateDataListEditing[4]
                                  ['classic']['isSelected'],
                          'price':
                              getXcontroller.classicalControllerList[4].text,
                        },
                      },
                      'Working Drawing': {
                        'isSelected': getXcontroller
                            .serviceRateDataListEditing[5]['isSelected'],
                        'modern': {
                          'isSelected':
                              getXcontroller.serviceRateDataListEditing[5]
                                  ['modern']['isSelected'],
                          'price': getXcontroller.modernControllerList[5].text,
                        },
                        'classic': {
                          'isSelected':
                              getXcontroller.serviceRateDataListEditing[5]
                                  ['classic']['isSelected'],
                          'price':
                              getXcontroller.classicalControllerList[5].text,
                        },
                      },
                      'Electrical Plan': {
                        'isSelected': getXcontroller
                            .serviceRateDataListEditing[6]['isSelected'],
                        'modern': {
                          'isSelected':
                              getXcontroller.serviceRateDataListEditing[6]
                                  ['modern']['isSelected'],
                          'price': getXcontroller.modernControllerList[6].text,
                        },
                        'classic': {
                          'isSelected':
                              getXcontroller.serviceRateDataListEditing[6]
                                  ['classic']['isSelected'],
                          'price':
                              getXcontroller.classicalControllerList[6].text,
                        },
                      },
                      'Plumbing Plan': {
                        'isSelected': getXcontroller
                            .serviceRateDataListEditing[7]['isSelected'],
                        'modern': {
                          'isSelected':
                              getXcontroller.serviceRateDataListEditing[7]
                                  ['modern']['isSelected'],
                          'price': getXcontroller.modernControllerList[7].text,
                        },
                        'classic': {
                          'isSelected':
                              getXcontroller.serviceRateDataListEditing[7]
                                  ['classic']['isSelected'],
                          'price':
                              getXcontroller.classicalControllerList[7].text,
                        },
                      },
                      'Walkthough Video': {
                        'isSelected': getXcontroller
                            .serviceRateDataListEditing[8]['isSelected'],
                        'modern': {
                          'isSelected':
                              getXcontroller.serviceRateDataListEditing[8]
                                  ['modern']['isSelected'],
                          'price': getXcontroller.modernControllerList[8].text,
                        },
                        'classic': {
                          'isSelected':
                              getXcontroller.serviceRateDataListEditing[8]
                                  ['classic']['isSelected'],
                          'price':
                              getXcontroller.classicalControllerList[8].text,
                        },
                      },
                      'Site Supervision': {
                        'isSelected': getXcontroller
                            .serviceRateDataListEditing[9]['isSelected'],
                        'modern': {
                          'isSelected':
                              getXcontroller.serviceRateDataListEditing[9]
                                  ['modern']['isSelected'],
                          'price': getXcontroller.modernControllerList[9].text,
                        },
                        'classic': {
                          'isSelected':
                              getXcontroller.serviceRateDataListEditing[9]
                                  ['classic']['isSelected'],
                          'price':
                              getXcontroller.classicalControllerList[9].text,
                        },
                      },
                    };

                    getformcontroller.addServicerateDetails(
                        FirebaseAuth.instance.currentUser!.uid,
                        // selctedserviceRateMainListmap,
                        selctedserviceRateAmounrtMainListmap);

                    Get.offAll(Architectbottomnavigationbar(
                      selectedindex: 0,
                    ));
                  } else {
                    print('object');
                  }
                },
                child: const Text('Submit'))));
  }
}
