// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../Constants/constants.dart';
//
// class FloorDetails extends StatefulWidget {
//   const FloorDetails({super.key});
//
//   @override
//   State<FloorDetails> createState() => _FloorDetailsState();
// }
//
// class _FloorDetailsState extends State<FloorDetails> {
//   @override
//   Widget build(BuildContext context) {
//     var screenWidth = MediaQuery.of(context).size.width;
//     String selectedFloor = 'Basement';
//
//     final List<String> _floorDropdown = [
//       "Basement",
//     ];
//     return Container(
//       child: Container(
//         decoration: customBoxDecoration(),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     width: 300.sp,
//                     padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                     decoration: customBoxDecoration(),
//                     child: DropdownButton(
//                       value: selectedFloor,
//                       underline: const SizedBox(),
//                       items: _floorDropdown
//                           .map((value) => DropdownMenuItem(
//                                 value: value,
//                                 child: Text(value),
//                               ))
//                           .toList(),
//                       onChanged: (value) {
//                         selectedFloor = value!;
//                         setState(() {});
//                       },
//                       isExpanded: true,
//                     ),
//                   ),
//                   IconButton(
//                       onPressed: () {},
//                       icon: const Icon(Icons.add_box_rounded)),
//                 ],
//               ),
//               heigh10,
//               Row(
//                 children: [
//                   Container(
//                     width: 145.sp,
//                     padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                     decoration: customBoxDecoration(),
//                     child: DropdownButton(
//                       value: selectedFloor,
//                       underline: const SizedBox(),
//                       items: _floorDropdown
//                           .map((value) => DropdownMenuItem(
//                                 value: value,
//                                 child: Text(value),
//                               ))
//                           .toList(),
//                       onChanged: (value) {
//                         selectedFloor = value!;
//                         setState(() {});
//                       },
//                       isExpanded: true,
//                     ),
//                   ),
//                   width10,
//                   Container(
//                     width: 145.sp,
//                     padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                     decoration: customBoxDecoration(),
//                     child: DropdownButton(
//                       value: selectedFloor,
//                       underline: const SizedBox(),
//                       items: _floorDropdown
//                           .map((value) => DropdownMenuItem(
//                                 value: value,
//                                 child: Text(value),
//                               ))
//                           .toList(),
//                       onChanged: (value) {
//                         selectedFloor = value!;
//                         setState(() {});
//                       },
//                       isExpanded: true,
//                     ),
//                   ),
//                 ],
//               ),
//               heigh10,
//               Row(
//                 children: [
//                   Container(
//                     width: 145.sp,
//                     padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                     decoration: customBoxDecoration(),
//                     child: DropdownButton(
//                       value: selectedFloor,
//                       underline: const SizedBox(),
//                       items: _floorDropdown
//                           .map((value) => DropdownMenuItem(
//                                 value: value,
//                                 child: Text(value),
//                               ))
//                           .toList(),
//                       onChanged: (value) {
//                         selectedFloor = value!;
//                         setState(() {});
//                       },
//                       isExpanded: true,
//                     ),
//                   ),
//                   width10,
//                   Container(
//                     width: 145.sp,
//                     padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                     decoration: customBoxDecoration(),
//                     child: DropdownButton(
//                       value: selectedFloor,
//                       underline: const SizedBox(),
//                       items: _floorDropdown
//                           .map((value) => DropdownMenuItem(
//                                 value: value,
//                                 child: Text(value),
//                               ))
//                           .toList(),
//                       onChanged: (value) {
//                         selectedFloor = value!;
//                         setState(() {});
//                       },
//                       isExpanded: true,
//                     ),
//                   ),
//                   IconButton(
//                       onPressed: () {}, icon: const Icon(Icons.add_box_rounded))
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Constants/constants.dart';
import '../../../controller/uploadDesignController.dart';



class FloorDetails extends StatefulWidget {
  FloorDetails({super.key});

  @override
  State<FloorDetails> createState() => _FloorDetailsState();
}

class _FloorDetailsState extends State<FloorDetails> {
  final GetxController = Get.put(UploadDesignController());

  @override
  Widget build(BuildContext context) {
    // print(GetxController.floorCount);
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Floor Details',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Container(
              alignment: Alignment.center,
              width: 170.w,
              height: 40.w,
              decoration: BoxDecoration(
                  color: kprimarycolor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5.w)),
              child: GestureDetector(
                onTap: () {
                  GetxController.incrementfloorcount(1);
                  // GetxController.selectedFloorList.add('Basement');
                  // GetxController.groupofselectedfloolist.clear();
                  GetxController.groupofselectedfloolist.clear();
                  GetxController.groupofselectedfloolist
                      .addAll({'0': GetxController.selectedFloorList.toList()});
                  // .add((GetxController.selectedFloorList));

                  // GetxController.groupofselectedfloolist.clear();

                  GetxController.groupofselectedfloolist.addAll(
                      {'1': GetxController.roomtypeitemsvalue.toList()});

                  // .add((GetxController.roomtypeitemsvalue));

                  // GetxController.groupofselectedfloolist.clear();

                  GetxController.groupofselectedfloolist
                      .addAll({'2': GetxController.roomcountvalue.toList()});
                  // .add((GetxController.roomcountvalue));

                  //adding to final list to list

                  GetxController.createdlistofitems
                      .add(Map.from(GetxController.groupofselectedfloolist));

                  print(
                      '${GetxController.createdlistofitems}fgfffffffffffffffffffffffff');
                  // print(GetxController.createdlistofitems);

                  setState(() {});
                },
                child: Row(
                  children: [
                    const Spacer(),
                    Text(
                      'Add Floors',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: kprimarycolor),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Icon(
                      Icons.add_box_outlined,
                      color: kprimarycolor,
                      size: 25.w,
                    ),
                    const Spacer()
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Container(
              alignment: Alignment.center,
              width: 170.w,
              height: 40.w,
              decoration: BoxDecoration(
                  color: kprimarycolor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5.w)),
              child: GestureDetector(
                onTap: () {
                  GetxController.incrementfloorcount(-1);
                  GetxController.createdlistofitems.removeLast();
                  setState(() {});
                },
                child: Row(
                  children: [
                    const Spacer(),
                    Text(
                      'Remove Floors',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: kprimarycolor),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Icon(
                      Icons.delete_outlined,
                      color: kprimarycolor,
                      size: 25.w,
                    ),
                    Spacer()
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.w,
        ),
        // for (int floor = 0; floor < GetxController.numberOfFloors; floor++)
        Container(
            padding: EdgeInsets.all(15.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.w),
                border: Border.all(width: 1.w, color: kgreycolor)),
            // height: 200.w,
            width: 1240.w,
            child: GetBuilder<UploadDesignController>(builder: (getdata) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 10.w),
                    height: 40.w,
                    width: 250.w,
                    decoration: BoxDecoration(
                        color: kgreycolor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5.w)),
                    child: DropdownButton(
                      underline: const SizedBox(),
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: kblackcolor,
                          fontWeight: FontWeight.bold),
                      value: GetxController.selectedFloorList[0],
                      icon: Icon(Icons.keyboard_arrow_down, size: 20.sp),
                      items: GetxController.dropdownditems.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (value) {
                        GetxController.selectedFloorList[0] = value!;

                        // GetxController.groupofselectedfloolist
                        //     .add(GetxController.selectedFloorList[index]);
                        // print(GetxController.selectedFloorList);
                        setState(() {});
                      },
                    ),
                  ),
                  Container(
                    width: 580.w,
                    child: ListView.separated(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (context, indexprimarylist) {
                          return Row(
                            children: [
                              // Basement dropdown

                              SizedBox(
                                width: 10.w,
                              ),

                              // roomtype dropdown

                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(left: 10.w),
                                height: 40.w,
                                width: 250.w,
                                decoration: BoxDecoration(
                                    color: kgreycolor.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(5.w)),
                                child: DropdownButton(
                                  underline: const SizedBox(),
                                  style: TextStyle(
                                      fontSize: 16.sp, color: kblackcolor),
                                  value: GetxController
                                      .roomtypeitemsvalue[indexprimarylist],
                                  icon: Icon(Icons.keyboard_arrow_down,
                                      size: 20.sp),
                                  items: GetxController.roomtypeitems
                                      .map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    GetxController.roomtypeitemsvalue[
                                    indexprimarylist] = newValue;
                                    setState(() {});
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              // roomcount dropdown

                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(left: 10.w),
                                height: 40.w,
                                width: 250.w,
                                decoration: BoxDecoration(
                                    color: kgreycolor.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(5.w)),
                                child: DropdownButton(
                                  underline: const SizedBox(),
                                  style: TextStyle(
                                      fontSize: 16.sp, color: kblackcolor),
                                  value: GetxController
                                      .roomcountvalue[indexprimarylist],
                                  icon: Icon(Icons.keyboard_arrow_down,
                                      size: 20.sp),
                                  items: GetxController.roomcount
                                      .map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    GetxController
                                        .roomcountvalue[indexprimarylist] =
                                        newValue;
                                    setState(() {});
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              // roomcount  end dropdown

                              Spacer(),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: getdata.roomCount),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      // Basement dropdown

                      // roomcount  end dropdown

                      Container(
                        alignment: Alignment.center,
                        width: 150.w,
                        height: 40.w,
                        decoration: BoxDecoration(
                            color: kprimarycolor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(5.w)),
                        child: GestureDetector(
                          onTap: () {
                            // GetxController.incrementfloorcount(1);
                            GetxController.selectedFloorList.add('Basement');
                            GetxController.roomtypeitemsvalue.add('Rooms');
                            GetxController.roomcountvalue.add('1');

                            // print(GetxController.numberOfFloors);
                            // setState(() {});

                            GetxController.changeroomcountfunction(1);

                            // print(GetxController.roomCount);
                          },
                          child: Row(
                            children: [
                              const Spacer(),
                              Text(
                                'Add Rooms',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: kprimarycolor),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Icon(
                                Icons.add_box_outlined,
                                color: kprimarycolor,
                                size: 20.sp,
                              ),
                              const Spacer()
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 150.w,
                        height: 40.w,
                        decoration: BoxDecoration(
                            color: kprimarycolor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(5.w)),
                        child: GestureDetector(
                          // onTap: () {
                          //   GetxController.incrementfloorcount(-1);
                          //   setState(() {});
                          // },
                          onTap: () {
                            if (GetxController.roomCount > 1) {
                              GetxController.changeroomcountfunction(-1);
                              GetxController.selectedFloorList.removeLast();

                              GetxController.roomtypeitemsvalue.removeLast();
                              GetxController.roomcountvalue.removeLast();
                              // print(GetxController.selectedFloorList);
                            }
                          },
                          child: Row(
                            children: [
                              const Spacer(),
                              Text(
                                'Remove Rooms',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: kprimarycolor),
                              ),
                              Icon(
                                Icons.delete_outlined,
                                color: kprimarycolor,
                                size: 20.sp,
                              ),
                              const Spacer()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            })),
        heigh10,

        Container(
          child: ListView.separated(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context, indexSecondarylist) {
                // var maptolist = GetxController
                //     .createdlistofitems[indexSecondarylist].entries
                //     .toList();
                // var listKey = mapEntry.key;
                // var listItems = mapEntry.value;
                // print(maptolist);

                Map Maptolist =
                GetxController.createdlistofitems[indexSecondarylist];

                var Maptolistitem = Maptolist.entries.toList();

                print('${Maptolistitem} kanhagad');
                return Container(
                  padding: EdgeInsets.all(15.w),
                  // height: 50.w,
                  width: 1240.w,
                  color: kgreycolor.withOpacity(0.3),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 40.w,
                        width: 250.w,
                        decoration: BoxDecoration(
                            color: kgreycolor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(5.w)),
                        child: Text('${Maptolistitem[0].value[0]}',
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: kblackcolor,
                                fontWeight: FontWeight.bold)),
                      ),
                      width10,
                      SizedBox(
                        width: 550.w,
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemBuilder: (context, indexthree) {
                            var mapvaluefloor = Maptolistitem[0].value;
                            var mapvalueroom = Maptolistitem[1].value;
                            List mapvalueroocount = Maptolistitem[2].value;

                            return Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 40.w,
                                  width: 250.w,
                                  decoration: BoxDecoration(
                                      color: kgreycolor.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(5.w)),
                                  child: Text('${mapvalueroom[indexthree]}',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color: kblackcolor,
                                          fontWeight: FontWeight.bold)),
                                ),
                                width10,
                                Container(
                                  alignment: Alignment.center,
                                  height: 40.w,
                                  width: 250.w,
                                  decoration: BoxDecoration(
                                      color: kgreycolor.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(5.w)),
                                  child: Text('${mapvalueroocount[indexthree]}',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color: kblackcolor,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 10.w,
                            );
                          },
                          itemCount: Maptolistitem[0].value.length,
                          // Maptolistitem[indexSecondarylist].value.length
                        ),
                      ),
                      // Text(GetxController.createdlistofitems[indexSecondarylist]
                      //     .toString()),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10.w,
                );
              },
              itemCount: GetxController.createdlistofitems.length),
        ),
        // Text(GetxController.createdlistofitems.length.toString())
      ],
    );
  }
}

// class Dropdown extends StatelessWidget {
//   var dropdownvalue;
//   var dropdownitems;
//   // Function onChangedFunction;
//   Dropdown({
//     super.key,
//     required this.dropdownvalue,
//     required this.dropdownitems,
//     // required this.onChangedFunction(newValue),
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(left: 10.w),
//       height: 40.w,
//       width: 200.w,
//       decoration: BoxDecoration(
//           color: kgreycolor.withOpacity(0.3),
//           borderRadius: BorderRadius.circular(5.w)),
//       child: DropdownButton(
//         underline: const SizedBox(),
//         style: TextStyle(fontSize: 16.sp, color: kblackcolor),
//         value: dropdownvalue,
//         icon: Icon(Icons.keyboard_arrow_down, size: 20.sp),
//         items: dropdownitems.map((String items) {
//           return DropdownMenuItem(
//             value: items,
//             child: Text(items),
//           );
//         }).toList(),
//         onChanged: (String? newValue) {
//           getdata.changedropdowbvalue(newValue);
//         },
//       ),
//     );
//   }
// }
