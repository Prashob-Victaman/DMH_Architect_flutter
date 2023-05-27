import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmh_architect/Architect/ArchitectDesignpage/widgets/designlistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Constants/constants.dart';
import '../ArchitectDrawer/ArchitectDrawerscreen.dart';
import '../widgets/appbar.dart';

class ArchitectDesignPage extends StatefulWidget {
  const ArchitectDesignPage({super.key});

  @override
  State<ArchitectDesignPage> createState() => _ArchitectDesignPageState();
}

class _ArchitectDesignPageState extends State<ArchitectDesignPage> {
  late String searchKey;
  Stream streamQuery = FirebaseFirestore.instance
      .collection("DesignDataFromAdmin")
      .orderBy("sortId", descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: ArchitectDrawerscreen(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55.w),
          child: const appbar(),
        ),
        body: ListView(children: [
          heigh10, 
          heigh5,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(children: [
              Container(
                width: screenwidth - 32.w,
                height: 41.w,
                decoration: BoxDecoration(
                  color: kwhitecolor,
                  borderRadius: BorderRadius.circular(10.w),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                        spreadRadius: .1,
                        blurStyle: BlurStyle.normal,
                        color: Color.fromARGB(137, 184, 184, 184),
                        blurRadius: 5.0,
                        offset: Offset(0.0, 0.0))
                  ],
                ),
                child: SizedBox(
                    // height: 41.w,
                    child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        style: normal16,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: 10.w, bottom: 5.w),
                          hintText: 'Search for your home design',
                          hintStyle: TextStyle(
                              fontSize: 14.sp,
                              color: Color.fromARGB(255, 192, 192, 192)),
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search),

                          // border: const OutlineInputBorder(),
                          // labelText: 'Email',
                          // labelStyle: normal20,
                        ),
                        keyboardType: TextInputType.name,
                        onChanged: (value) {
                          setState(() {
                            searchKey = value;
                            fetchData();
                          });
                        })),
              ),
              

              // GestureDetector(
              //   onTap: () => Get.to(() => DrawerScreen()),
              //   child: Container(
              //     width: 51.w,
              //     height: 41.w,
              //     decoration: BoxDecoration(
              //       color: kwhitecolor,
              //       borderRadius: BorderRadius.circular(10.w),
              //       boxShadow: const <BoxShadow>[
              //         BoxShadow(
              //             spreadRadius: .1,
              //             blurStyle: BlurStyle.normal,
              //             color: Color.fromARGB(137, 184, 184, 184),
              //             blurRadius: 5.0,
              //             offset: Offset(0.0, 0.0))
              //       ],
              //     ),
              //     child: Icon(
              //       Icons.filter_list,
              //       size: 30.w,
              //     ),
              //   ),
              // ),
            ]),
          ),
          heigh20,
          designlistview(
            screenwidth: screenwidth,
            streamQuery: streamQuery,
          ),
          heigh20,
          heigh20
        ]));
  }

  Future<void> fetchData() async {
    streamQuery = FirebaseFirestore.instance
        .collection('DesignDataFromAdmin')
        .where('designType', isGreaterThanOrEqualTo: searchKey.capitalizeFirst)
        .where('designType', isLessThan: '${searchKey.capitalizeFirst}z')
        .snapshots();
    final querySnapshot = await streamQuery.first;
    final length = querySnapshot.docs.length;

    if (length == 0) {
      streamQuery = FirebaseFirestore.instance
          .collection('DesignDataFromAdmin')
          .where('houseType', isGreaterThanOrEqualTo: searchKey.capitalizeFirst)
          .where('houseType', isLessThan: '${searchKey.capitalizeFirst}z')
          .snapshots();

      final querySnapshot = await streamQuery.first;
      final length = querySnapshot.docs.length;

      if (length == 0) {
        streamQuery = FirebaseFirestore.instance
            .collection('DesignDataFromAdmin')
            .where('houseFacing',
                isGreaterThanOrEqualTo: searchKey.capitalizeFirst)
            .where('houseFacing', isLessThan: '${searchKey.capitalizeFirst}z')
            .snapshots();
        final querySnapshot = await streamQuery.first;
      }
    }
    setState(() {});
  }
}
