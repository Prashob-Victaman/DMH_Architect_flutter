import 'package:dmh_architect/Architect/Architectbottomnavigationbar/Architectbottomnavigationbar.dart';
import 'package:dmh_architect/controller/ArchitectformController.dart';
import 'package:dmh_architect/controller/ServicerateController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Constants/constants.dart';

class ServiceRateUpdated extends StatelessWidget {
  ServiceRateUpdated({Key? key}) : super(key: key);

  final formKeyServiceRate = GlobalKey<FormState>();

  // List modernMinimumAmount = [2, 2, 1.5, 2, 2, 1.5, 3, 3, 3, '', ''];

  // List classicalMinimumAmount = [3, 2, 2, 2, 2, 2, 3, 3, 5, '', ''];

  final getXcontroller = Get.put(ServicerateController());
  final getformcontroller = Get.put(ArchitectformController());

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
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                heigh10,
                ListView.separated(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, primaryindex) {
                      // final indexwiseData =
                      //     getXcontroller.serviceRateMainlist[primaryindex].values;
                      // print(getXcontroller.serviceRateMainlist[primaryindex]);

                      // print(indexwiseData);

                      // var datalisttomap = indexwiseData.entries.toList();

                      // List dataList = datalisttomap[primaryindex].value;

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
                                    width: MediaQuery.of(context).size.width -
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
                                                .serviceSelectedBoolList[
                                            primaryindex],
                                        onChanged: (value) {
                                          if (primaryindex != 0) {
                                            getXcontroller
                                                .changeServiceSelectedbool(
                                                    primaryindex);
                                          }
                                        },
                                      ),
                                    );
                                  })
                                ],
                              ),
                              GetBuilder<ServicerateController>(
                                  builder: (getdata) {
                                if (getdata.serviceSelectedBoolList[
                                        primaryindex] ==
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
                                          physics: const ScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return Row(
                                              children: [
                                                Container(
                                                  alignment: Alignment.center,
                                                  height: 40.w,
                                                  width: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2 -
                                                      100.w,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.0.w),
                                                  decoration:
                                                      customBoxDecoration(),
                                                  child: Text(
                                                    getXcontroller
                                                        .designType[index],
                                                    style: normal15,
                                                  ),
                                                ),
                                                width10,
                                                Container(
                                                  color: kashcolor
                                                      .withOpacity(0.5),
                                                  width: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2 -
                                                      100.w,
                                                  height: 40.w,
                                                  child: index == 0
                                                      ? (getXcontroller
                                                                  .modernSelectedBoolList[
                                                              primaryindex]
                                                          ? TextFormField(
                                                              textAlignVertical:
                                                                  TextAlignVertical
                                                                      .center,
                                                              controller: index ==
                                                                      0
                                                                  ? getXcontroller
                                                                          .modernControllerList[
                                                                      primaryindex]
                                                                  : getXcontroller
                                                                          .classicalControllerList[
                                                                      primaryindex],
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              decoration:
                                                                  InputDecoration(
                                                                      errorBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              width: 1
                                                                                  .w,
                                                                              color:
                                                                                  kredcolor)),
                                                                      errorStyle: TextStyle(
                                                                          height:
                                                                              0,
                                                                          color: Colors
                                                                              .transparent,
                                                                          fontSize:
                                                                              1.sp),
                                                                      contentPadding: EdgeInsets.symmetric(
                                                                          // vertical: 10.0.w,
                                                                          horizontal: 10.0.w),
                                                                      border: OutlineInputBorder(
                                                                          borderSide: const BorderSide(
                                                                            color:
                                                                                kprimarycolor,
                                                                          ),
                                                                          borderRadius: BorderRadius.circular(5.w)),
                                                                      hintText: 'Rate/SqFt',
                                                                      hintStyle: TextStyle(fontSize: 12.sp, color: kgreycolor)),
                                                              validator: (value) {
                                                                if (value!
                                                                    .isEmpty) {
                                                                  return '';
                                                                }

                                                                return null;
                                                              })
                                                          : SizedBox())
                                                      : getXcontroller.classicalSelectedBoolList[primaryindex]
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
                                                                        color:
                                                                            kprimarycolor,
                                                                      ),
                                                                      borderRadius: BorderRadius.circular(5.w)),
                                                                  hintText: 'Rate/Sqft',
                                                                  hintStyle: TextStyle(fontSize: 12.sp, color: kgreycolor)),
                                                              validator: (value) {
                                                                if (value!
                                                                    .isEmpty) {
                                                                  return '';
                                                                }

                                                                return null;
                                                              })
                                                          : SizedBox(),
                                                ),
                                                width10,
                                                Container(
                                                  color: kashcolor
                                                      .withOpacity(0.5),
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width) *
                                                      0.23,
                                                  height: 40.w,
                                                  child: index == 0
                                                      ? (getXcontroller
                                                                  .modernSelectedBoolList[
                                                              primaryindex]
                                                          ? TextFormField(
                                                              textAlignVertical:
                                                                  TextAlignVertical
                                                                      .center,
                                                              controller: index ==
                                                                      0
                                                                  ? getXcontroller
                                                                          .minratemodernControllerList[
                                                                      primaryindex]
                                                                  : getXcontroller
                                                                          .minrateclassicalControllerList[
                                                                      primaryindex],
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              decoration:
                                                                  InputDecoration(
                                                                      errorBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              width: 1
                                                                                  .w,
                                                                              color:
                                                                                  kredcolor)),
                                                                      errorStyle: TextStyle(
                                                                          height:
                                                                              0,
                                                                          color: Colors
                                                                              .transparent,
                                                                          fontSize:
                                                                              1.sp),
                                                                      contentPadding: EdgeInsets.symmetric(
                                                                          // vertical: 10.0.w,
                                                                          horizontal: 10.0.w),
                                                                      border: OutlineInputBorder(
                                                                          borderSide: const BorderSide(
                                                                            color:
                                                                                kprimarycolor,
                                                                          ),
                                                                          borderRadius: BorderRadius.circular(5.w)),
                                                                      hintText: 'Min Rate',
                                                                      hintStyle: TextStyle(fontSize: 12.sp, color: kgreycolor)),
                                                              validator: (value) {
                                                                if (value!
                                                                    .isEmpty) {
                                                                  return '';
                                                                }

                                                                return null;
                                                              })
                                                          : SizedBox())
                                                      : getXcontroller.classicalSelectedBoolList[primaryindex]
                                                          ? TextFormField(
                                                              textAlignVertical: TextAlignVertical.center,
                                                              controller: index == 0 ? getXcontroller.minratemodernControllerList[primaryindex] : getXcontroller.minrateclassicalControllerList[primaryindex],
                                                              keyboardType: TextInputType.number,
                                                              decoration: InputDecoration(
                                                                  errorBorder: OutlineInputBorder(borderSide: BorderSide(width: 1.w, color: kredcolor)),
                                                                  errorStyle: TextStyle(height: 0, color: Colors.transparent, fontSize: 1.sp),
                                                                  contentPadding: EdgeInsets.symmetric(
                                                                      // vertical: 10.0.w,
                                                                      horizontal: 10.0.w),
                                                                  border: OutlineInputBorder(
                                                                      borderSide: const BorderSide(
                                                                        color:
                                                                            kprimarycolor,
                                                                      ),
                                                                      borderRadius: BorderRadius.circular(5.w)),
                                                                  hintText: 'Min Rate',
                                                                  hintStyle: TextStyle(fontSize: 12.sp, color: kgreycolor)),
                                                              validator: (value) {
                                                                if (value!
                                                                    .isEmpty) {
                                                                  return '';
                                                                }

                                                                return null;
                                                              })
                                                          : SizedBox(),
                                                ),
                                                SizedBox(
                                                  height: 20.w,
                                                  child: Checkbox(
                                                    value: index == 0
                                                        ? getXcontroller
                                                                .modernSelectedBoolList[
                                                            primaryindex]
                                                        : getXcontroller
                                                                .classicalSelectedBoolList[
                                                            primaryindex],
                                                    fillColor:
                                                        MaterialStatePropertyAll(
                                                            kblackcolor),
                                                    onChanged: (value) {
                                                      if (primaryindex != 0) {
                                                        index == 0
                                                            ? getXcontroller
                                                                .changeModernSelectedBoolList(
                                                                primaryindex,
                                                              )
                                                            : getXcontroller
                                                                .changeClassicalSelectedBoolList(
                                                                primaryindex,
                                                              );
                                                      }
                                                    },
                                                  ),
                                                )
                                              ],
                                            );
                                          },
                                          separatorBuilder: (context, index) {
                                            return SizedBox(
                                              height: 10.w,
                                            );
                                          },
                                          itemCount: 2),
                                    ],
                                  );
                                }
                              }),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return heigh10;
                    },
                    itemCount: 11),
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
            final form = formKeyServiceRate.currentState;

            if (form!.validate()) {
              List<List<String>> serviceAmountList =
                  List.generate(11, (_) => []);

              // for (int i = 0; i < 10; i++) {
              //   getXcontroller.servicerateTextController[i].forEach((element) {
              //     serviceAmountList[i].add(element.text);
              //   });
              // }

              Map selctedserviceRateAmounrtMainListmap = {
                "Floor Plan": {
                  'isSelected': getXcontroller.serviceSelectedBoolList[0],
                  'modern': {
                    'isSelected': getXcontroller.modernSelectedBoolList[0],
                    'pricesqft': getXcontroller.modernControllerList[0].text,
                    'minprice':
                        getXcontroller.minratemodernControllerList[0].text,
                  },
                  'classic': {
                    'isSelected': getXcontroller.classicalSelectedBoolList[0],
                    'pricesqft': getXcontroller.classicalControllerList[0].text,
                    'minprice':
                        getXcontroller.minrateclassicalControllerList[0].text,
                  },
                },
                'Structural Drawing': {
                  'isSelected': getXcontroller.serviceSelectedBoolList[1],
                  'modern': {
                    'isSelected': getXcontroller.modernSelectedBoolList[1],
                    'pricesqft': getXcontroller.modernControllerList[1].text,
                    'minprice':
                        getXcontroller.minratemodernControllerList[1].text,
                  },
                  'classic': {
                    'isSelected': getXcontroller.classicalSelectedBoolList[1],
                    'pricesqft': getXcontroller.classicalControllerList[1].text,
                    'minprice':
                        getXcontroller.minrateclassicalControllerList[1].text,
                  },
                },
                '3D Front Elevation': {
                  'isSelected': getXcontroller.serviceSelectedBoolList[2],
                  'modern': {
                    'isSelected': getXcontroller.modernSelectedBoolList[2],
                    'pricesqft': getXcontroller.modernControllerList[2].text,
                    'minprice':
                        getXcontroller.minratemodernControllerList[2].text,
                  },
                  'classic': {
                    'isSelected': getXcontroller.classicalSelectedBoolList[2],
                    'pricesqft': getXcontroller.classicalControllerList[2].text,
                    'minprice':
                        getXcontroller.minrateclassicalControllerList[2].text,
                  },
                },
                '2D Front Elevation': {
                  'isSelected': getXcontroller.serviceSelectedBoolList[3],
                  'modern': {
                    'isSelected': getXcontroller.modernSelectedBoolList[3],
                    'pricesqft': getXcontroller.modernControllerList[3].text,
                    'minprice':
                        getXcontroller.minratemodernControllerList[3].text,
                  },
                  'classic': {
                    'isSelected': getXcontroller.classicalSelectedBoolList[3],
                    'pricesqft': getXcontroller.classicalControllerList[3].text,
                    'minprice':
                        getXcontroller.minrateclassicalControllerList[3].text,
                  },
                },
                '3D Floor Plan': {
                  'isSelected': getXcontroller.serviceSelectedBoolList[4],
                  'modern': {
                    'isSelected': getXcontroller.modernSelectedBoolList[4],
                    'pricesqft': getXcontroller.modernControllerList[4].text,
                    'minprice':
                        getXcontroller.minratemodernControllerList[4].text,
                  },
                  'classic': {
                    'isSelected': getXcontroller.classicalSelectedBoolList[4],
                    'pricesqft': getXcontroller.classicalControllerList[4].text,
                    'minprice':
                        getXcontroller.minrateclassicalControllerList[4].text,
                  },
                },
                'Working Drawing': {
                  'isSelected': getXcontroller.serviceSelectedBoolList[5],
                  'modern': {
                    'isSelected': getXcontroller.modernSelectedBoolList[5],
                    'pricesqft': getXcontroller.modernControllerList[5].text,
                    'minprice':
                        getXcontroller.minratemodernControllerList[5].text,
                  },
                  'classic': {
                    'isSelected': getXcontroller.classicalSelectedBoolList[5],
                    'pricesqft': getXcontroller.classicalControllerList[5].text,
                    'minprice':
                        getXcontroller.minrateclassicalControllerList[5].text,
                  },
                },
                'Electrical Plan': {
                  'isSelected': getXcontroller.serviceSelectedBoolList[6],
                  'modern': {
                    'isSelected': getXcontroller.modernSelectedBoolList[6],
                    'pricesqft': getXcontroller.modernControllerList[6].text,
                    'minprice':
                        getXcontroller.minratemodernControllerList[6].text,
                  },
                  'classic': {
                    'isSelected': getXcontroller.classicalSelectedBoolList[6],
                    'pricesqft': getXcontroller.classicalControllerList[6].text,
                    'minprice':
                        getXcontroller.minrateclassicalControllerList[6].text,
                  },
                },
                'Plumbing Plan': {
                  'isSelected': getXcontroller.serviceSelectedBoolList[7],
                  'modern': {
                    'isSelected': getXcontroller.modernSelectedBoolList[7],
                    'pricesqft': getXcontroller.modernControllerList[7].text,
                    'minprice':
                        getXcontroller.minratemodernControllerList[7].text,
                  },
                  'classic': {
                    'isSelected': getXcontroller.classicalSelectedBoolList[7],
                    'pricesqft': getXcontroller.classicalControllerList[7].text,
                    'minprice':
                        getXcontroller.minrateclassicalControllerList[7].text,
                  },
                },
                'Walkthough Video': {
                  'isSelected': getXcontroller.serviceSelectedBoolList[8],
                  'modern': {
                    'isSelected': getXcontroller.modernSelectedBoolList[8],
                    'pricesqft': getXcontroller.modernControllerList[8].text,
                    'minprice':
                        getXcontroller.minratemodernControllerList[8].text,
                  },
                  'classic': {
                    'isSelected': getXcontroller.classicalSelectedBoolList[8],
                    'pricesqft': getXcontroller.classicalControllerList[8].text,
                    'minprice':
                        getXcontroller.minrateclassicalControllerList[8].text,
                  },
                },
                'Site Supervision': {
                  'isSelected': getXcontroller.serviceSelectedBoolList[9],
                  'modern': {
                    'isSelected': getXcontroller.modernSelectedBoolList[9],
                    'pricesqft': getXcontroller.modernControllerList[9].text,
                    'minprice':
                        getXcontroller.minratemodernControllerList[9].text,
                  },
                  'classic': {
                    'isSelected': getXcontroller.classicalSelectedBoolList[9],
                    'pricesqft': getXcontroller.classicalControllerList[9].text,
                    'minprice':
                        getXcontroller.minrateclassicalControllerList[9].text,
                  },
                },
                'Naksha Layout': {
                  'isSelected': getXcontroller.serviceSelectedBoolList[10],
                  'modern': {
                    'isSelected': getXcontroller.modernSelectedBoolList[10],
                    'pricesqft': getXcontroller.modernControllerList[10].text,
                    'minprice':
                        getXcontroller.minratemodernControllerList[10].text,
                  },
                  'classic': {
                    'isSelected': getXcontroller.classicalSelectedBoolList[10],
                    'pricesqft':
                        getXcontroller.classicalControllerList[10].text,
                    'minprice':
                        getXcontroller.minrateclassicalControllerList[10].text,
                  },
                },
              };
              // log(finalmap.toString());

              // Map selctedserviceRateAmounrtMainListmap = {
              //   "Floor Plan": serviceAmountList[0],
              //   'Structural Drawing': serviceAmountList[1],
              //   '3D Front Elevation': serviceAmountList[2],
              //   '2D Front Elevation': serviceAmountList[3],
              //   '3D Floor Plan': serviceAmountList[4],
              //   'Working Drawing': serviceAmountList[5],
              //   'Electrical Plan': serviceAmountList[6],
              //   'Plumbing Plan': serviceAmountList[7],
              //   'Walkthough Video': serviceAmountList[8],
              //   'Site Supervision': serviceAmountList[9],
              // };

              // log(selctedserviceRateAmounrtMainListmap.toString());
              // log(selctedserviceRateMainListmap.toString());

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
          child: const Text('Next'),
        ),
      ),
    );
  }
}
