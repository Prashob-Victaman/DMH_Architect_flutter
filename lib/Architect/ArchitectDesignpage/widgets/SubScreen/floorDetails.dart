import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../Constants/constants.dart';
import '../../../../controller/floorDetailController.dart';

class FloorDetails extends StatefulWidget {
  const FloorDetails({super.key});

  @override
  State<FloorDetails> createState() => _FloorDetailsState();
}

class _FloorDetailsState extends State<FloorDetails> {


  final getxcontroller = Get.put(FloorDetailController());

  final List<String> _floorDropdown = [
    'Basement',
    'Ground Floor',
    'First Floor',
    'Second Floor',
  ];

  final List<String> _typeDropdown = [
    'Rooms',
    'Toilets',
    'Balcony',
    'Garden',
  ];

  final List<int> _numberDropdown = [1, 2, 3, 4, 5, 6];

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return ListView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: [
        heigh10,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Floor Details',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
            ),
            Spacer(),

            // IconButton(
            //     onPressed: () {
            //       if (getxcontroller.numberOfFloors != 1) {
            //         getxcontroller.numberOfFloors -= 1;
            //         //print(numberOfFloors);
            //         setState(() {});
            //       }
            //     },
            //     icon: const Icon(Icons.delete_rounded)),
            // IconButton(
            //     onPressed: () {
            //       getxcontroller.numberOfFloors += 1;
            //       print(getxcontroller.numberOfFloors);
            //       getxcontroller.selectedFloorList.add('Basement');
            //       setState(() {});
            //     },
            //     icon: const Icon(Icons.add_box_rounded)),

          ],
        ),
        heigh20,
        for (int floor = 0; floor < getxcontroller.numberOfFloors; floor++)
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Container(
              child: Container(
                decoration: customBoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 250.sp,
                            padding:
                            const EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: customBoxDecoration(),
                            child: DropdownButton(
                              value: getxcontroller.selectedFloorList[floor],
                              underline: const SizedBox(),
                              items: _floorDropdown
                                  .map((value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ))
                                  .toList(),
                              onChanged: (value) {
                                getxcontroller.selectedFloorList[floor] = value!;
                                setState(() {});
                              },
                              isExpanded: true,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                if (getxcontroller.numberOfRoomType != 0) {
                                  getxcontroller.updateNumberOfRoomType(floor, -1);
                                  getxcontroller.selectedTypeList.removeLast();
                                  getxcontroller.numberOfRoomsList.removeLast();
                                  print(getxcontroller.numberOfRoomsList);
                                  print(getxcontroller.selectedTypeList);
                                  print(
                                      'printing ${getxcontroller.selectedTypeList[getxcontroller.numberOfRoomType[floor]]}');
                                  setState(() {});
                                }
                              },

                              icon: const Icon(Icons.delete_rounded)),
                          IconButton(
                              onPressed: () {

                                getxcontroller.updateNumberOfRoomType(floor, 1);

                                getxcontroller.selectedTypeList.add('Rooms');
                                getxcontroller.numberOfRoomsList.add(1);
                                print(getxcontroller.numberOfRoomsList);
                                print(getxcontroller.selectedTypeList);
                                setState(() {});
                              },
                              icon: const Icon(Icons.add_box_rounded)),
                        ],
                      ),
                      heigh10,
                      for (int index = 0; index < getxcontroller.selectedTypeList.length; index++)
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.h),
                          child: Row(
                            children: [
                              Container(
                                width: 145.sp,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                decoration: customBoxDecoration(),
                                child: DropdownButton(
                                  value: getxcontroller.selectedTypeList[index],
                                  underline: const SizedBox(),
                                  items: _typeDropdown
                                      .map((value) => DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  ))
                                      .toList(),
                                  onChanged: (value) {
                                    getxcontroller.selectedTypeList[index] = value!;
                                    setState(() {});
                                  },
                                  isExpanded: true,
                                ),
                              ),
                              width10,
                              Container(
                                width: 145.sp,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                decoration: customBoxDecoration(),
                                child: DropdownButton(
                                  value: getxcontroller.numberOfRoomsList[index],
                                  underline: const SizedBox(),
                                  items: _numberDropdown
                                      .map((value) => DropdownMenuItem(
                                    value: value,
                                    child: Text('$value'),
                                  ))
                                      .toList(),
                                  onChanged: (value) {
                                    getxcontroller.numberOfRoomsList[index] = value!;
                                    setState(() {});
                                  },
                                  isExpanded: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      heigh10,
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
