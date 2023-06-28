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

class ProfileServiceRate extends StatelessWidget {
  ProfileServiceRate({Key? key}) : super(key: key);

  final formKeyServiceRate = GlobalKey<FormState>();

  final getXcontroller = Get.put(ServicerateController());
  final getformcontroller = Get.put(ArchitectformController());

  List designTypeList = ['Modern', 'Classic'];

  TextEditingController amountcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
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

                            List<MapEntry> mapEntries =
                                serviceRateTypemap.entries.toList();

                            Map serviceRateAmountmap =
                                data.serviceRateamountList;

                            List<MapEntry> AmountmapEntries =
                                serviceRateAmountmap.entries.toList();

                            // log(mapEntries[0].value.toString());

                            // serviceRateamountmap =
                            //   widget.architectData['serviceRateamountList'];

                            // List<List> serviceRateTypelist = serviceRateTypemap.map((number) => number).toList();

                            print(
                                '${selctedserviceRateMainList[primaryindex]}');
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
                                          serviceListItems[primaryindex],
                                          style: bold15,
                                        )),
                                    heigh10,
                                    GetBuilder<ServicerateController>(
                                        builder: (getdata) {
                                      return ListView.separated(
                                          shrinkWrap: true,
                                          physics: const ScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            var serviceRate;

                                            try {
                                              serviceRate =
                                                  serviceRateAmountmap[
                                                      serviceListItems[
                                                          primaryindex]][index];
                                            } catch (e) {
                                              serviceRate = null;
                                              print(e);
                                            }

                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  alignment: Alignment.center,
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
                                                  child: Text(
                                                      designTypeList[index]),
                                                ),
                                                Container(
                                                  decoration:
                                                      customBoxDecoration(),
                                                  alignment: Alignment.center,
                                                  width: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2 -
                                                      45.w,
                                                  height: 40.w,
                                                  child: Text(
                                                    serviceRate ?? 'Not Added',
                                                    style: normal15,
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: 20.w,
                                                    child: IconButton(
                                                      onPressed: () {
                                                        cofirmationPopup(
                                                          context,
                                                          serviceListItems[
                                                              primaryindex],
                                                          designTypeList[index],
                                                          index,
                                                        );
                                                      },
                                                      icon: Icon(
                                                        Icons.edit_square,
                                                        color: kprimarycolor,
                                                        size: 25.sp,
                                                      ),
                                                    )),
                                                width5
                                              ],
                                            );
                                          },
                                          separatorBuilder: (context, index) {
                                            return heigh10;
                                          },
                                          itemCount: designTypeList.length);
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
      // floatingActionButton: Container(
      //   width: 143,
      //   height: 35,
      //   child: ElevatedButton(
      //     style: ButtonStyle(
      //       backgroundColor: MaterialStateProperty.all<Color>(
      //           const Color.fromARGB(255, 255, 90, 95)),
      //     ),
      //     onPressed: () {
      //       final form = widget.formKeyServiceRate.currentState;

      //       if (form!.validate()) {
      //         List<List<String>> serviceAmountList =
      //             List.generate(10, (_) => []);

      //         for (int i = 0; i < 10; i++) {
      //           widget.getXcontroller.servicerateTextController[i]
      //               .forEach((element) {
      //             serviceAmountList[i].add(element.text);
      //           });
      //         }

      //         Map selctedserviceRateAmounrtMainListmap = {
      //           "Planning": serviceAmountList[0],
      //           'Structure': serviceAmountList[1],
      //           '2D Elevation': serviceAmountList[2],
      //           '3D Elevation': serviceAmountList[3],
      //           '3D Floor': serviceAmountList[4],
      //           'Walkthrough Video(Exterior)': serviceAmountList[5],
      //           'Walkthrough Video(Interior & Exterior)': serviceAmountList[6],
      //           'Electricals': serviceAmountList[7],
      //           'Plumbing': serviceAmountList[8],
      //           'Site Supervision': serviceAmountList[9],
      //         };

      //         // log(selctedserviceRateAmounrtMainListmap.toString());
      //         // log(selctedserviceRateMainListmap.toString());

      //         widget.getformcontroller.addServicerateDetails(
      //             FirebaseAuth.instance.currentUser!.uid,
      //             selctedserviceRateMainListmap,
      //             selctedserviceRateAmounrtMainListmap);

      //         Get.offAll(Architectbottomnavigationbar(
      //           selectedindex: 0,
      //         ));
      //       }
      //     },
      //     child: const Text('Update'),
      //   ),
      // ),
    );
  }

  Future<void> cofirmationPopup(
    BuildContext context,
    title,
    subtitle,
    index,
  ) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(0.w),
          title: Container(
            height: 150.w,
            width: 300.w,
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.all(10.w),
                    alignment: Alignment.center,
                    // height: 84.w,
                    child: Text(
                      'Enter Service Rate for ${title} - ${subtitle}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: kblackcolor,
                          fontWeight: FontWeight.bold),
                    )),
                // const Spacer(),
                Container(
                  height: 50.w,
                  width: 270.w,
                  padding: EdgeInsets.symmetric(vertical: 10.w),
                  child: TextFormField(
                      // initialValue: dataController.email,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Email';
                        }
                        if (!RegExp(
                                r'^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$')
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      controller: amountcontroller,
                      decoration: customInputDecoration('Amount')),
                ),
                Spacer(),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        // final documentReference = await FirebaseFirestore
                        //     .instance
                        //     .collection('ArchitectData')
                        //     .doc(FirebaseAuth.instance.currentUser!.uid);

                        // documentReference.update({
                        //   'serviceRateamountList.${title}.${index}':
                        //       amountcontroller.text,
                        // });

                        // await FirebaseFirestore.instance
                        //     .collection("order")
                        //     .doc(orderUid!)
                        //     .update({'servicesSelectedModel': value});

                        Get.back();
                        amountcontroller.clear();
                      },
                      child: Container(
                        height: 30.w,
                        width: 150.w,
                        decoration: const BoxDecoration(color: kprimarycolor),
                        child: Center(
                            child: Text(
                          'Yes',
                          style: TextStyle(fontSize: 14.sp, color: kwhitecolor),
                        )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        height: 30.w,
                        width: 150.w,
                        decoration: BoxDecoration(
                            color: kwhitecolor,
                            border: Border.all(color: kprimarycolor)),
                        child: Center(
                            child: Text(
                          'Cancel',
                          style:
                              TextStyle(fontSize: 14.sp, color: kprimarycolor),
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
}
