import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Constants/constants.dart';
import '../../controller/HomepageController.dart';
import 'Homepageproductview.dart';

class separateddesignlistview extends StatelessWidget {
  separateddesignlistview({
    super.key,
    required this.screenwidth,
    required this.CategoryData,
  });

  final double screenwidth;

  final CategoryData;

  // int count = 0;

  final getcontroller = Get.put(HomePageContoller());

  // final CategoryDatalistLength = CategoryData.length;

  @override
  Widget build(BuildContext context) {
    // print('lendnkjfhsdkjhfkjhh ${CategoryData}');
    return Container(
      child: ListView.separated(
          // cacheExtent: 20.w,
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                // log(CategoryData[index]['uid'].toString());
                await FirebaseFirestore.instance
                    .collection('DesignDataFromAdmin')
                    .doc(CategoryData[index]['uid'])
                    .update({'visitors': FieldValue.increment(1)});
                Get.to(
                  () => Homepageproductview(
                    index: index,
                    DesignData: CategoryData ?? '',
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    color: kgreycolor),
                // height: 220.w,
                child: Column(
                  children: [
                    Container(
                      // height: 160.w,
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            placeholder: (context, url) => Image(
                                height: 160.w,
                                width: screenwidth - 20.w,
                                fit: BoxFit.fitWidth,
                                image:
                                    const AssetImage('asset/placeholder.jpg')),
                            imageUrl: CategoryData[index]['exteriorImageList']
                                [0],
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.w),
                                    topRight: Radius.circular(10.w)),
                                // image: DecorationImage(
                                //   fit: BoxFit.cover,
                                //   image: imageProvider,
                                // ),
                              ),
                              child: Image(image: imageProvider),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(0.w),
                                        bottomRight: Radius.circular(10.w)),
                                    color: const Color.fromARGB(
                                        255, 255, 214, 69)),
                                height: 22.w,
                                width: (screenwidth - 30) / 2.w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${CategoryData[index]['designType']} / ',
                                      // '',
                                      style: TextStyle(
                                          fontSize: 12.sp, color: kredcolor),
                                    ),
                                    Text(
                                      '${CategoryData[index]['houseType']}',
                                      // '',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 12.sp, color: kbluecolor),
                                    )
                                  ],
                                ),
                              ),
                              const Spacer(),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      // height: 60.w,
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  heigh5,
                                  Text(
                                    'Width x Length',
                                    style: TextStyle(fontSize: 11.sp),
                                  ),
                                  Text(
                                    '${CategoryData[index]['houseArea']['length']}Ft * ${CategoryData[index]['houseArea']['width']}Ft = ${CategoryData[index]['houseArea']['area']} sqft ',
                                    style: normal14,
                                  ),
                                  heigh5,
                                ],
                              ),
                              const Spacer(),
                              Text(
                                  '${CategoryData[index]['houseFacing']} Facing House'),
                            ],
                          ),
                        ],
                      ),
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
          itemCount: CategoryData.length),
    );
  }
}
