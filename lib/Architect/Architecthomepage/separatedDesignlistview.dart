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
                log(CategoryData[index]['uid'].toString());
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
                height: 220.w,
                child: Column(
                  children: [
                    Container(
                      height: 160.w,
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl:  CategoryData[index]['exteriorImageList'][0] ?? 'https://firebasestorage.googleapis.com/v0/b/designmyhouseuser.appspot.com/o/Placeholder%2Fef3-placeholder-image.jpg?alt=media&token=9e009457-de80-44b9-aa42-89b3bf2fb101&_gl=1*op8ful*_ga*MTIxMzcwMjQwOC4xNjg2MDYwMDEz*_ga_CW55HF8NVT*MTY4NjEzNTM2MS42LjEuMTY4NjEzNTkzNi4wLjAuMA..',
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.w),
                                    topRight: Radius.circular(10.w)),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: imageProvider,
                                ),
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
                                    color: Color.fromARGB(255, 255, 214, 69)),
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
                              Spacer(),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      height: 60.w,
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
                                  '${CategoryData[index]['houseArea']['length']}In * ${CategoryData[index]['houseArea']['width']} = ${CategoryData[index]['houseArea']['area']} sqft ',
                                  style: normal14,
                                ),
                                Spacer(),
                                Text(
                                  '₹ ${CategoryData[index]['designprice']}.00',
                                  style: bold18,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  ' ${CategoryData[index]['shortdescription']}',
                                  style: normal14,
                                ),
                                const Spacer(),
                                // Container(
                                //   child: RatingBar.builder(
                                //     itemSize: 12.w,
                                //     initialRating: 3.5,
                                //     minRating: 1,
                                //     direction: Axis.horizontal,
                                //     allowHalfRating: true,
                                //     itemCount: 5,
                                //     itemBuilder: (context, _) => const Icon(
                                //       Icons.star,
                                //       color: Colors.amber,
                                //     ),
                                //     onRatingUpdate: (rating) {
                                //       print(rating);
                                //     },
                                //   ),
                                // )
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
          itemCount: CategoryData.length),
    );
  }
}
