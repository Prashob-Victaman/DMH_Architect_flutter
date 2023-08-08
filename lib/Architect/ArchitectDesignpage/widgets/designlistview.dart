import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dmh_architect/model/uploadDesignDataModel.dart';

import '../../../Constants/constants.dart';
import '../../productview/productview.dart';

class designlistview extends StatefulWidget {
  designlistview(
      {super.key, required this.screenwidth, required this.searchKey});

  final double screenwidth;
  String searchKey;

  @override
  State<designlistview> createState() => _designlistviewState();
}

class _designlistviewState extends State<designlistview> {
  Stream streamQuery = FirebaseFirestore.instance
      .collection("DesignDataFromAdmin")
      .orderBy("sortId", descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: streamQuery,
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

          return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                final data =
                    designDataModel.fromJson(snapshot.data!.docs[index].data());

                return GestureDetector(
                  onTap: () async {
                    await FirebaseFirestore.instance
                        .collection('DesignDataFromAdmin')
                        .doc(data.uid)
                        .update({'visitors': FieldValue.increment(1)});
                    print(data.uid);

                    Get.to(() => ProductView(
                          DesignData: data,
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.w),
                        color: kgreycolor),
                    height: 200.w,
                    child: Column(
                      children: [
                        Container(
                          height: 160.w,
                          child: Stack(
                            children: [
                              CachedNetworkImage(
                                imageUrl: data.exteriorImageList[0],
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.w),
                                        topRight: Radius.circular(10.w)),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: imageProvider),
                                  ),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10.w),
                                            bottomRight: Radius.circular(10.w)),
                                        color:
                                            Color.fromARGB(255, 255, 214, 69)),
                                    height: 22.w,
                                    width: (widget.screenwidth - 30) / 2.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${data.designType} /',
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: kredcolor),
                                        ),
                                        Text(
                                          '${data.houseType}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: kbluecolor),
                                        )
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          height: 40.w,
                          decoration: BoxDecoration(
                            color: kwhitecolor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.w),
                                bottomRight: Radius.circular(10.w)),
                            boxShadow: const <BoxShadow>[
                              BoxShadow(
                                  spreadRadius: .1,
                                  blurStyle: BlurStyle.normal,
                                  color: Color.fromARGB(137, 82, 82, 82),
                                  blurRadius: 10.0,
                                  offset: Offset(0.0, 0.0))
                            ],
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '${data.houseArea['length']}Ft * ${data.houseArea['width']}Ft = ${data.houseArea['area']} sqft ',
                                      style: TextStyle(fontSize: 12.sp),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '${data.houseFacing} Facing House',
                                      style: TextStyle(fontSize: 12.sp),
                                    ),
                                  ],
                                ),
                              ]),
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 15.w,
                );
              },
              itemCount: snapshot.data!.size);
        });
  }

  Future<void> fetchData() async {
    streamQuery = FirebaseFirestore.instance
        .collection('DesignDataFromAdmin')
        .where('designType',
            isGreaterThanOrEqualTo: widget.searchKey.capitalizeFirst)
        .where('designType', isLessThan: '${widget.searchKey.capitalizeFirst}z')
        .snapshots();
    final querySnapshot = await streamQuery.first;
    final length = querySnapshot.docs.length;

    if (length == 0) {
      streamQuery = FirebaseFirestore.instance
          .collection('DesignDataFromAdmin')
          .where('houseType',
              isGreaterThanOrEqualTo: widget.searchKey.capitalizeFirst)
          .where('houseType',
              isLessThan: '${widget.searchKey.capitalizeFirst}z')
          .snapshots();

      final querySnapshot = await streamQuery.first;
      final length = querySnapshot.docs.length;

      if (length == 0) {
        streamQuery = FirebaseFirestore.instance
            .collection('DesignDataFromAdmin')
            .where('houseFacing',
                isGreaterThanOrEqualTo: widget.searchKey.capitalizeFirst)
            .where('houseFacing',
                isLessThan: '${widget.searchKey.capitalizeFirst}z')
            .snapshots();
        final querySnapshot = await streamQuery.first;
      }
    }
    setState(() {});
  }
}
