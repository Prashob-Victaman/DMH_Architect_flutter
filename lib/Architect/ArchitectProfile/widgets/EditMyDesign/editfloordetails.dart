import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/ArchitectMyDesign.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../Constants/constants.dart';
import '../../../../controller/upload design/ArchitectUploadDesignController.dart';

class EditFloorDetails extends StatefulWidget {
  String designUid;
  EditFloorDetails({super.key, required this.designUid});

  @override
  State<EditFloorDetails> createState() => _EditFloorDetailsState();
}

class _EditFloorDetailsState extends State<EditFloorDetails> {
  final GetxController = Get.put(ArchitectUploadDesignController());

  // Get.put(ArchitectUploadDesignController()).createdlistofitems = designData.floordetails;

  // ArchitectUploadDesignController.c

  @override
  Widget build(BuildContext context) {
    // print(GetxController.floorCount);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(10.w),
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Edit Floor Details',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Container(
                      alignment: Alignment.center,
                      width: 50.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                          color: kprimarycolor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5.w)),
                      child: SizedBox(
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              GetxController.incrementfloorcount(1);
                              GetxController.groupofselectedfloolist.clear();
                              GetxController.groupofselectedfloolist.addAll({
                                '0': GetxController.selectedFloorList.toList()
                              });
                              // .add((GetxController.selectedFloorList));

                              // GetxController.groupofselectedfloolist.clear();

                              GetxController.groupofselectedfloolist.addAll({
                                '1': GetxController.roomtypeitemsvalue.toList()
                              });

                              // GetxController.groupofselectedfloolist.clear();

                              GetxController.groupofselectedfloolist.addAll({
                                '2': GetxController.roomcountvalue.toList()
                              });

                              //adding to final list to list

                              GetxController.createdlistofitems.add(Map.from(
                                  GetxController.groupofselectedfloolist));

                              setState(() {});

                              print(GetxController.createdlistofitems);
                            },
                            icon: Icon(
                              Icons.add_box_outlined,
                              color: kprimarycolor,
                              size: 25.w,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 50.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                          color: kprimarycolor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5.w)),
                      child: IconButton(
                        onPressed: () {
                          if (GetxController.numberOfFloors > 1) {
                            GetxController.incrementfloorcount(-1);
                            GetxController.createdlistofitems.removeLast();
                            setState(() {});
                            print(GetxController.createdlistofitems);
                          }
                        },
                        icon: Icon(
                          Icons.delete_outlined,
                          color: kprimarycolor,
                          size: 25.w,
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
                    padding: EdgeInsets.symmetric(vertical: 10.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.w),
                        border: Border.all(width: 1.w, color: kgreycolor)),
                    // height: 200.w,
                    width: MediaQuery.of(context).size.width - 20.w,
                    child: GetBuilder<ArchitectUploadDesignController>(
                        builder: (getdata) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              width10,
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(left: 10.w),
                                height: 40.w,
                                width: 230.w,
                                decoration: BoxDecoration(
                                    color: kgreycolor.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(5.w)),
                                child: DropdownButton(
                                  underline: const SizedBox(),
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: kblackcolor,
                                      fontWeight: FontWeight.bold),
                                  value: GetxController.selectedFloorList[0],
                                  icon: Icon(Icons.keyboard_arrow_down,
                                      size: 20.sp),
                                  items: GetxController.dropdownditems
                                      .map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    GetxController.selectedFloorList[0] =
                                        value!;

                                    // GetxController.groupofselectedfloolist
                                    //     .add(GetxController.selectedFloorList[index]);
                                    // print(GetxController.selectedFloorList);
                                    setState(() {});
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 45.w,
                                height: 40.w,
                                decoration: BoxDecoration(
                                    color: kprimarycolor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(5.w)),
                                child: IconButton(
                                  onPressed: () {
                                    // GetxController.incrementfloorcount(1);
                                    GetxController.selectedFloorList
                                        .add('Basement');
                                    GetxController.roomtypeitemsvalue
                                        .add('Rooms');
                                    GetxController.roomcountvalue.add('1');

                                    // print(GetxController.numberOfFloors);
                                    // setState(() {});

                                    GetxController.changeroomcountfunction(1);

                                    // print(GetxController.roomCount);
                                  },
                                  icon: Icon(
                                    Icons.add_box_outlined,
                                    color: kprimarycolor,
                                    size: 20.sp,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 45.w,
                                height: 40.w,
                                decoration: BoxDecoration(
                                    color: kprimarycolor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(5.w)),
                                child: GestureDetector(
                                  // onTap: () {
                                  //   GetxController.incrementfloorcount(-1);
                                  //   setState(() {});
                                  // },
                                  onTap: () {},
                                  child: IconButton(
                                    onPressed: () {
                                      if (GetxController.roomCount > 1) {
                                        GetxController.changeroomcountfunction(
                                            -1);
                                        GetxController.selectedFloorList
                                            .removeLast();

                                        GetxController.roomtypeitemsvalue
                                            .removeLast();
                                        GetxController.roomcountvalue
                                            .removeLast();
                                        // print(GetxController.selectedFloorList);
                                      }
                                    },
                                    icon: Icon(
                                      Icons.delete_outlined,
                                      color: kprimarycolor,
                                      size: 20.sp,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                            ],
                          ),
                          heigh10,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 40.w,
                                child: ListView.separated(
                                    shrinkWrap: true,
                                    physics: ScrollPhysics(),
                                    itemBuilder: (context, indexprimarylist) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Basement dropdown
                                          SizedBox(
                                            width: 10.w,
                                          ),

                                          // roomtype dropdown

                                          Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.only(
                                                left: 10.w, right: 10.w),
                                            height: 40.w,
                                            width: 160.w,
                                            decoration: BoxDecoration(
                                                color:
                                                    kgreycolor.withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(5.w)),
                                            child: DropdownButton(
                                              isExpanded: true,
                                              underline: const SizedBox(),
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: kblackcolor),
                                              value: GetxController
                                                      .roomtypeitemsvalue[
                                                  indexprimarylist],
                                              icon: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  size: 20.sp),
                                              items: GetxController
                                                  .roomtypeitems
                                                  .map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(items),
                                                );
                                              }).toList(),
                                              onChanged: (newValue) {
                                                GetxController
                                                            .roomtypeitemsvalue[
                                                        indexprimarylist] =
                                                    newValue;
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          // Spacer(),
                                          // roomcount dropdown

                                          Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.only(
                                                left: 10.w, right: 10.w),
                                            height: 40.w,
                                            width: 160.w,
                                            decoration: BoxDecoration(
                                                color:
                                                    kgreycolor.withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(5.w)),
                                            child: DropdownButton(
                                              isExpanded: true,
                                              underline: const SizedBox(),
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: kblackcolor),
                                              value:
                                                  GetxController.roomcountvalue[
                                                      indexprimarylist],
                                              icon: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  size: 20.sp),
                                              items: GetxController.roomcount
                                                  .map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(items),
                                                );
                                              }).toList(),
                                              onChanged: (newValue) {
                                                GetxController.roomcountvalue[
                                                        indexprimarylist] =
                                                    newValue;
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 10.w,
                                          // ),
                                          // roomcount  end dropdown

                                          // Spacer(),
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
                            ],
                          ),
                        ],
                      );
                    })),
                heigh10,

                ListView.separated(
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

                      // print('${Maptolistitem} kanhagad');
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.w),
                          color: kgreycolor.withOpacity(0.3),
                        ),
                        padding: EdgeInsets.all(10.w),
                        // height: 50.w,
                        width: MediaQuery.of(context).size.width - 20.w,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 40.w,
                              width: 150.w,
                              decoration: BoxDecoration(
                                  color: kgreycolor.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(5.w)),
                              child: Text('${Maptolistitem[0].value[0]}',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: kblackcolor,
                                      fontWeight: FontWeight.bold)),
                            ),
                            width10,
                            SizedBox(
                              width: 180.w,
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemBuilder: (context, indexthree) {
                                  var mapvaluefloor = Maptolistitem[0].value;
                                  var mapvalueroom = Maptolistitem[1].value;
                                  List mapvalueroocount =
                                      Maptolistitem[2].value;

                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 40.w,
                                        width: 100.w,
                                        decoration: BoxDecoration(
                                            color: kgreycolor.withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(5.w)),
                                        child: Text(
                                            '${mapvalueroom[indexthree]}',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: kblackcolor,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      width10,
                                      Container(
                                        alignment: Alignment.center,
                                        height: 40.w,
                                        width: 60.w,
                                        decoration: BoxDecoration(
                                            color: kgreycolor.withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(5.w)),
                                        child: Text(
                                            '${mapvalueroocount[indexthree]}',
                                            style: TextStyle(
                                                fontSize: 14.sp,
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
                // Text(GetxController.createdlistofitems.length.toString())
              ],
            ),
          ],
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
            // print(widget.designUid);

            DocumentReference userDocRef = FirebaseFirestore.instance
                .collection('DesignDataFromAdmin')
                .doc(widget.designUid);

            userDocRef
                .update({'floordetails': GetxController.createdlistofitems});
            Get.off(ArchitectMyDesign());


            GetxController.createdlistofitems.clear();
          },
          child: const Text('Submit'),
        ),
      ),
    );
  }
}
