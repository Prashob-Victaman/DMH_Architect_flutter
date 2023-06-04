import 'dart:developer';

import 'package:dmh_architect/controller/ServicerateController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Constants/constants.dart';

class ServiceRateUpdated extends StatefulWidget {
  ServiceRateUpdated({Key? key}) : super(key: key);

  @override
  State<ServiceRateUpdated> createState() => _ServiceRateUpdatedState();

  // List servicerateTextController = [
  //   [TextEditingController()],
  //   [TextEditingController()],
  //   [TextEditingController()],
  //   [TextEditingController()],
  //   [TextEditingController()],
  //   [TextEditingController()],
  //   [TextEditingController()],
  //   [TextEditingController()],
  //   [TextEditingController()],
  //   [TextEditingController()],
  // ];
}

class _ServiceRateUpdatedState extends State<ServiceRateUpdated> {
  final getXcontroller = Get.put(ServicerateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
                        padding: EdgeInsets.all(12.0.w),
                        child: Column(
                          children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                height: 40,
                                width: MediaQuery.of(context).size.width - 25.w,
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
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 40.w,
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2 -
                                              55.w,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          decoration: customBoxDecoration(),
                                          child: DropdownButton(
                                            value: selctedserviceRateMainList[
                                                primaryindex][index],
                                            underline: const SizedBox(),
                                            items: getXcontroller.desiignType
                                                .map(
                                                    (value) => DropdownMenuItem(
                                                          value: value,
                                                          child: Text(value),
                                                        ))
                                                .toList(),
                                            onChanged: (value) {
                                              selctedserviceRateMainList[
                                                  primaryindex][index] = value!;
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
                                          color: kashcolor.withOpacity(0.5),
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2 -
                                              35.w,
                                          height: 40.w,
                                          child: TextField(
                                            controller: getXcontroller
                                                    .servicerateTextController[
                                                primaryindex][index],
                                            keyboardType: TextInputType.number,
                                            decoration: customInputDecoration(
                                                'Ener Amount'),
                                          ),
                                        ),
                                        index == 0
                                            ? GestureDetector(
                                                onTap: () {
                                                  getXcontroller
                                                      .servicerateTextController[
                                                          primaryindex]
                                                      .add(
                                                          TextEditingController());
                                                  getXcontroller
                                                      .changeserviceTypeCountfunction(
                                                          primaryindex);
                                                  // print(getXcontroller
                                                  //     .servicerateTextController[
                                                  //         primaryindex]
                                                  //     .length);

                                                  // print(
                                                  //     '${selctedserviceRateMainList[primaryindex]}fggggggggggggggggggggggggg');

                                                  // print(
                                                  //     '${selctedserviceRateMainList.toString()}fggggggggggggggggggggggggg');
                                                },
                                                child: Icon(Icons.add,
                                                    size: 20.sp))
                                            : index ==
                                                    selctedserviceRateMainList[
                                                                primaryindex]
                                                            .length -
                                                        1
                                                ? GestureDetector(
                                                    onTap: () {
                                                      getXcontroller
                                                          .removeserviceTypeCountfunction(
                                                              primaryindex);

                                                      getXcontroller
                                                          .servicerateTextController[
                                                              primaryindex]
                                                          .removeLast();
                                                      // print(getXcontroller
                                                      //     .servicerateTextController[
                                                      //         primaryindex]
                                                      //     .length);
                                                    },
                                                    child: Icon(
                                                      Icons.delete,
                                                      size: 20.sp,
                                                    ))
                                                : Icon(Icons.delete,
                                                    size: 20.sp,
                                                    color: kwhitecolor)
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return heigh10;
                                  },
                                  itemCount:
                                      selctedserviceRateMainList[primaryindex]
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
                  itemCount: 10),
              heigh20,
              SizedBox(
                height: 40.w,
              )
            ],
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
            // Get.offAll(Architectbottomnavigationbar(
            //   selectedindex: 0,
            // ));

            log(selctedserviceRateMainListmap.toString());
          },
          child: const Text('Next'),
        ),
      ),
    );
  }
}
